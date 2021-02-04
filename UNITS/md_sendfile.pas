unit md_sendfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Gauges, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachmentFile,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Buttons, ExtCtrls;

type
  TF_sendfile = class(TForm)
    HTTP: TIdHTTP;
    SMTP: TIdSMTP;
    SSLSocket_1: TIdSSLIOHandlerSocketOpenSSL;
    Message_1: TIdMessage;
    panel_1: TPanel;
    Gauge_1: TGauge;
    Label_1: TLabel;

    bt_fechar: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure envio_Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
    procedure envio_WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Integer);
    procedure envio_Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Integer);
    procedure envio_WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    function  via_SMTP(FileToSend: string): boolean;
    function  via_HTTP(FileToSend: string): boolean;
    procedure bt_fecharClick(Sender: TObject);

  private
    { Private declarations }
  public
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    { Public declarations }
  end;

var
  F_sendfile: TF_sendfile;

implementation

uses dm_hotel, md_diarias, md_utilities;

{$R *.dfm}

procedure TF_sendfile.FormShow(Sender: TObject);
begin
  with F_database do
  begin
    F_diarias.Caption := 'PSI-HOTEL v'+trim(
    F_database.T_empresaVERSAO.Value)+' - '+
    F_database.T_empresaEMPRESA.Value;
	end;
  Gauge_1.AddProgress(0);
  bt_fechar.Enabled := FALSE;
  bt_fechar.SetFocus;
end;

procedure TF_sendfile.envio_Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
begin
  Label_1.Caption := AStatusText;
end;

procedure TF_sendfile.envio_Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Integer);
begin
  Gauge_1.AddProgress(AWorkCount);
end;

procedure TF_sendfile.envio_WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Integer);
begin
  Gauge_1.AddProgress(10);
end;

procedure TF_sendfile.envio_WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Gauge_1.AddProgress(100);
  MessageDlg('Arquivo enviado com sucesso!', mtInformation, [mbOK], 0);
end;

function TF_sendfile.via_SMTP(FileToSend: string): boolean;
var
	SMTP			: TIdSMTP;
	Message_1	: TIdMessage;
	AuthSSL		: TIdSSLIOHandlerSocketOpenSSL;
  SMTPAuthSSL,
  SMTPAuth  : Boolean;
begin
  SMTP	 		:= TIdSMTP.Create(nil);
  Message_1 := TIdMessage.Create(nil);
  try
    with F_database do
    begin
      SMTP.Host 		:= T_empresaSMTP_HOST.AsString;
      SMTP.Port 		:= T_empresaSMTP_PORT.Value;
      SMTP.AuthType := atDefault;
      SMTP.Username := T_empresaSMTP_USER.AsString;
      SMTP.Password := xyz(T_empresaSMTP_PASSWORD.AsString);
      SMTPAuthSSL   := True;
      SMTPAuth      := True;

      if SMTPAuthSSL = True then
      begin
        AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
        SMTP.IOHandler := AuthSSL;
        {  método antigo }
        //SMTP.UseTLS := utUseExplicitTLS;
        //AuthSSL.SSLOptions.Method := sslvTLSv1;
        { método atualizado e testado }
        SMTP.UseTLS := utUseImplicitTLS;
        AuthSSL.SSLOptions.Method := sslvSSLv3; // Gmail, Yahoo, Hotmail, outros...
        AuthSSL.SSLOptions.Mode := sslmClient;
      end;

      if SMTPAuth = True then
      SMTP.AuthType := atDefault else
      SMTP.AuthType := atNone;

      try
        SMTP.Connect;
      except
        SMTP.Connect;
      end;

      try
        Message_1.From.Address := SMTP.Username;
        Message_1.From.Name := 'PSI-HOTEL v7.5';
        Message_1.Recipients.EMailAddresses := T_empresaEMAIL.AsString;
        Message_1.Subject := 'Relatório - '+Trim(T_caixaCAIXA.AsString); //O assunto da mensagem

        Message_1.Body.Text:=
        'ARQUIVO ENVIADO EM : ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now)+#13#10+''+#13#10+
        'SEGUE EM ANEXO RESUMO DO CAIXA: '+Trim(T_caixaCAIXA.AsString)+#13#10+''+#13#10+
        'RECEPÇÃO: '+T_caixaRECEPCAO.AsString+#13#10+
        'TURNO FECHADO EM: '+T_caixaSAIDA.AsString+#13#10+
        'PSI-HOTEL v7.5';
        Message_1.Body.SaveToFile(T_empresaPATH_APLICACAO.asString+'envio\ultimoenvio.txt');
        Message_1.MessageParts.Clear; // Limpa os anexos da lista

        if FileExists(FileToSend) then
        TIdAttachmentFile.Create(Message_1.MessageParts, TFileName(FileToSend)); // adiciona anexo na lista, pode ser utilizado com looping
        SMTP.Send(Message_1);
        ShowMessage('Arquivo transmitido com sucesso para: ' + T_empresaEMAIL.AsString);
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao enviar E-Mail:'+#13#10+e.Message);
          Exit;
        end;
      end;

    end;
  finally
    SMTP.Disconnect;
    FreeAndNil(SMTP);
    FreeAndNil(Message_1);
    if AuthSSL <> nil then
    FreeAndNil(AuthSSL);
  end;
  bt_fechar.Enabled := True;
end;

function TF_sendfile.via_HTTP(FileToSend: string): boolean;
var
  Response: String;
  HTTP: TIdHTTP;
  Info: TStringList;
  Server, Script: string;
begin
  result := False;
  HTTP := TidHTTP.Create;
  HTTP.ProtocolVersion := pv1_0;
  HTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

  Response := '';
  Info := TStringList.Create;
  try
    try
      with F_database do
      begin
        Server := T_empresaLOCAL_SERV.AsString; //'HTTP://127.0.0.1:82';
        Script := '/email_php/send_file.php';
        Info.Add('full_name='   + T_empresaEMPRESA.AsString);
        Info.Add('telephone='   + T_empresaTELEFONE.AsString);
        Info.Add('email_to='    + T_empresaEMAIL.AsString);
        Info.Add('email_from='  + 'ezequiasmartins@gmail.com');
        Info.Add('case_id='     + 'PSI-HOTEL v'+trim(T_empresaVERSAO.Value));
        Info.Add('file_send='   + FileToSend);
        Info.Add('file_path='   + T_empresaPATH_1.AsString);
        Info.Add('dt_envio='    + DateToStr(Date));
        Info.Add('email_subject=' + 'Relatório - ' + T_caixaCAIXA.AsString);
        Info.Add('your_msg=' + 'enviado em ' + T_caixaSAIDA.AsString);
      end;

      Response := Trim(HTTP.Post(server + script, Info));
      Label_1.Caption := Response;
      if Response = 'OK' then
      begin
        Result := true;
//      ShowMessage('Arquivo transmitido com sucesso para: ' + T_empresaEMAIL.AsString);
      end;
    finally
      Info.Free;
      HTTP.free;
    end;
  except
    on e:exception do  ShowMessage('Erro no envio do arquivo ao servidor! Detalhes: '+e.Message);
  end;
  bt_fechar.Enabled := True;
end;

procedure TF_sendfile.bt_fecharClick(Sender: TObject);
begin
  CLOSE;
end;

end.

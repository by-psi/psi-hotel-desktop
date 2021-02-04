unit md_utilities;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Gauges,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdAttachmentFile, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

  function xyz(s: string ): string;
  function serial_n(FDrive: string): string;
  function Check_TFC(var telefone: String):string;
  function Extract_N(var S: String): String;
  function MsgDlg(Frase: String; Tipo: TMsgDlgType; Botoes: TMsgDlgButtons): Integer;
  function vr_extenso(literal: Double): string;
  function dt_hoje: string;
  function tm_sistema: string;
  function Insert_R(var s: string; T: integer; chr: Char): string;
  function Insert_L(var s: string; T: integer; chr: Char): string;
  function Sendfile_SMTP(FileToSend: string): boolean;
  function SendFile_HTTP(FileToSend: string): boolean;
  function SendBKP_HTTP(FileToSend: string): boolean;

  procedure ShowModalForm(FormClass: TFormClass; var Reference);
  procedure F_AjustarEscala(var Reference);
  procedure F_AjustarTela(var Reference);

const
  SIM	= 1;
  NAO	= 0;

implementation

uses
  md_firedac;

  function xyz(s: string ): string;
  const
    chave : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345789'; // .~W$Xi@vzv>D
  var
    x,y 	: integer;
    str_y	: String;
  begin
    for x := 1 to length(chave) do
    begin
      str_y := '';
      for y := 1 to length(s) do
      str_y := str_y + chr((Ord(chave[x]) xor Ord(s[y])));
      s := str_y;
    end;
    result := s;
  end;

  function serial_n(FDrive: string): string;
  var
    serial:DWord;
    DirLen,Flags: DWord;
    DLabel : Array[0..11] of char;
  begin
    try
      GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@serial,DirLen,Flags,NIL,0);
      result := IntToHex(serial,8);
    except
      result := '';
    end;
  end;

  function Check_TFC(var telefone: String):string;
  var T,msk: string;
  begin
    T := telefone; T := Extract_N(T);
    if(Length(T) >= 4 ) and (copy(T,1,4) = '0800') then msk := '!\(9999\) 000-0000;1; ' else
    if Length(T) <= 10 then msk := '!\(99\) 0000-00009;1; ' else
    if Length(T) >  10 then msk := '!\(99\) 00000-0000;1; ';
    Result := msk;
  end;

  function Extract_N(var S: String): String;
  var
    i: Integer;
  begin
    for i := 1 to Length(S) do
    IF S[i] IN ['0'..'9'] THEN
    Result := Result + S[i];
  end;

  function MsgDlg(Frase: String; Tipo: TMsgDlgType; Botoes: TMsgDlgButtons): Integer;
  var
    Mensagem: TForm;
    I, CheckModForm, TamBtn, H_Left, Y_T_A_Left, N_T_A_Left: Integer;

  const
    Button: array [1..11] of String = (
  'ABORT', 'ALL', 'CANCEL', 'HELP', 'IGNORE', 'NO','NOTOALL', 'OK', 'RETRY', 'YES', 'YESTOALL');
    Botao : array [1..11] of String = (
  'A&bortar', '&Todos', '&Cancelar', '&Ajuda', '&Ignorar', '&Não', 'Não à To&dos', '&OK', '&Repetir', '&Sim', 'S&im à Todos');
    TypeMsg: array [1..4] of String = ('Confirm', 'Error', 'Information', 'Warning');
    TipoMsg: array [1..4] of String = ('Confirma', 'Erro', 'Informação', 'Cuidado');

  begin
    if Botoes = mbYesNo then
    Mensagem := CreateMessageDialog(''+Frase+'', Tipo, Botoes, mbNo) else
    Mensagem := CreateMessageDialog(''+Frase+'', Tipo, Botoes);

    for I := 1 to 4 do
    begin
      if Mensagem.Caption = TypeMsg[I] then
      Mensagem.Caption := TipoMsg[I]
    end;

    CheckModForm := 0;

    if (Mensagem.FindComponent('YESTOALL') as TButton).Caption = 'Yes to &All' then
    begin
      Mensagem.Width := Mensagem.Width + 20;
      TamBtn := (Mensagem.FindComponent('YESTOALL') as TButton).Width;
      Y_T_A_Left := (Mensagem.FindComponent('YESTOALL') as TButton).Left;
      (Mensagem.FindComponent('YESTOALL') as TButton).Width := TamBtn + 20;
      CheckModForm := CheckModForm + 1;

      if (Mensagem.FindComponent('HELP') as TButton).Caption = '&Help' then
      begin
        H_Left := (Mensagem.FindComponent('HELP') as TButton).Left;
        (Mensagem.FindComponent('HELP') as TButton).Left := TamBtn + Y_T_A_Left + 25;
      end;
    end;

    if (Mensagem.FindComponent('NOTOALL') as TButton).Caption = 'N&o to All' then
    begin
      Mensagem.Width := Mensagem.Width + 20;
      TamBtn := (Mensagem.FindComponent('NOTOALL') as TButton).Width;
      N_T_A_Left := (Mensagem.FindComponent('NOTOALL') as TButton).Left;
      (Mensagem.FindComponent('NOTOALL') as TButton).Width := TamBtn + 20;
      CheckModForm := CheckModForm + 1;
      if (Mensagem.FindComponent('HELP') as TButton).Caption = '&Help' then
      begin
        H_Left := (Mensagem.FindComponent('HELP') as TButton).Left;
        (Mensagem.FindComponent('HELP') as TButton).Left := TamBtn + N_T_A_Left + 25;
      end;
    end;

    if CheckModForm = 2 then
    begin
      (Mensagem.FindComponent('NOTOALL') as TButton).Left := N_T_A_Left;
      (Mensagem.FindComponent('YESTOALL') as TButton).Left := Y_T_A_Left + 20;
      if (Mensagem.FindComponent('HELP') as TButton).Caption = '&Help' then
      (Mensagem.FindComponent('HELP') as TButton).Left := TamBtn + Y_T_A_Left + 45;
    end;

    for I := 1 to 11 do (Mensagem.FindComponent(Button[I]) as TButton).Caption := Botao[I];

    // Mostra o MessageDlg traduzido

    Result := Mensagem.ShowModal;
  end;

  function vr_extenso(literal: Double): string;
  var
    i, centena, dezena, unidade: integer;
    valor, montagem, extenso: string;
  begin
    extenso := '';
    if literal = 0.00 then result := 'zero' else
    begin
      valor := FormatFloat('000000000000.00',literal);
      i := 1;
      while i <= 13 do
      begin
        if (Pos(valor[i]  ,'0123456789')=0) then valor[i]   := '0';
        if (Pos(valor[i+1],'0123456789')=0) then valor[i+1] := '0';
        if (Pos(valor[i+2],'0123456789')=0) then valor[i+2] := '0';

        if (i = 13) then centena := 0 else centena := StrToInt(valor[i]);

        dezena  := StrToInt(valor[i+1]);

        if dezena > 1 then
        unidade := StrToInt(valor[i+2]) else
        unidade := StrToInt(copy(valor,(i+1),2));

        if (((i=13) and (StrToFloat(copy(valor,14,2))>0.01)) and
           ((StrToFloat(copy(valor,1,12)))<>0.00)) then
        extenso := Trim(extenso)+' e';

        montagem := 'duzentos    trezentos   quatrocentos  quinhentos  seiscentos  setecentos  oitocentos  novecentos';

        if ((dezena+unidade)=0) then
        montagem := '            cem         '+montagem else
        montagem := '            cento       '+montagem;

        extenso := Trim(extenso)+' '+Trim(copy(montagem,((centena*12)+1),12));

        if ((centena<>0) and ((dezena+unidade)>0)) then
        extenso:=Trim(extenso)+' e';

        montagem := '                  vinte    trinta   quarenta cincoenta sessenta setenta  oitenta  noventa';

        extenso := Trim(extenso)+' '+Trim(copy(montagem,((dezena*9)+1),9));

        if ((dezena>1) and (unidade>0)) then
        extenso := Trim(extenso)+' e';

        montagem := '         um       dois     tres     quatro   cinco    seis     sete     oito     nove     dez      onze     doze     treze    quatorze quinze   dezeseis dezesete dezoito  dezenove';

        extenso := Trim(extenso)+' '+Trim(copy(montagem,((unidade*9)+1),9));

        if ((centena+dezena+unidade)>0) then
        begin
          if i = 1 then
          if (((centena+dezena)=0) and (unidade<=1)) then
          extenso:=Trim(extenso)+' bilhão' else
          extenso:=Trim(extenso)+' bilhões';

          if (i = 4) then
          if ((centena+dezena=0) and (unidade<=1)) then
          extenso:=Trim(extenso)+' milhão' else
          extenso:=Trim(extenso)+' milhões';

          if i = 7 then
          extenso:=Trim(extenso)+' mil';

          if ((i<10) and (StrToFloat(copy(valor,(i+3),(13-i)))>1.00)) then
          extenso:=extenso+' e';
        end;

        if ((i=1) and (StrToFloat(copy(valor,4,9))=0.00) and
           ((centena+unidade+dezena)<>0)) then
        extenso:=Trim(extenso)+' de';

        if ((i=4) and (StrToFloat(copy(valor,7,6))=0.00) and
           ((centena+unidade+dezena)<>0)) then
        extenso:=Trim(extenso)+' de';

        if ((i=10) and (StrToFloat(copy(valor,1,12))<>0.00)) then
        if (StrToFloat(copy(valor,1,12))=1.00) then
        extenso:=Trim(extenso)+' real' else
        extenso:=Trim(extenso)+' reais';

        if ((i=13) and ((dezena+unidade)<>0)) then
        if ((dezena+unidade)=1) then
        extenso:=Trim(extenso)+' centavo' else
        extenso:=Trim(extenso)+' centavos';
        i := i+3;
      end;
      if literal<0.00 then extenso := Trim(extenso)+' negativo';
      if(literal<1.00) then
      if (StrToInt(copy(valor,14,2))=1) then
      extenso:=Trim(extenso)+' de real' else
      extenso:=Trim(extenso)+' de reais';
      result:=extenso;
      // "de real/de reais" podem ser substituidos por campos de arquivos de parametros
    end;
  end;

  function dt_hoje: string;
  var
    dia,mes,ano: word;
  const
    m_nome: array[1..12] of string = ('Janeiro','Fevereiro','Março','Abril',
    'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
    m_dia : array[1..07] of string = ('Domingo','Segunda','Terça','Quarta','Quinta',
    'Sexta','Sábado');
  begin
    DecodeDate(now,ano,mes,dia);
    result := m_dia[DayOfWeek(now)]+', '+
    IntToStr(dia)+' de '+m_nome[mes]+' de '+IntToStr(ano);
  end;

  function tm_sistema: string;
  begin
    result := TimeToStr(time);
  end;

  function Insert_R(var s: string; T: integer; chr: Char): string;
  begin
    while Length(s)<T do s := s + chr;
    Result := s;
  end;

  function Insert_L(var s: string; T: integer; chr: Char): string;
  begin
    while Length(s)<T do s := chr + s;
    Result := s;
  end;

  function Sendfile_SMTP(FileToSend: string): boolean;
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
      with dm_firedac do
      begin
        SMTP.Host 		:= T_empresaSMTP_HOST.AsString;
        SMTP.Port 		:= T_empresaSMTP_PORT.Value;
        SMTP.AuthType := satDefault;
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
        SMTP.AuthType := satDefault else
        SMTP.AuthType := satNone;

        try
          SMTP.Connect;
        except
          SMTP.Connect;
        end;

        try
          Message_1.From.Address := SMTP.Username;
          Message_1.From.Name := 'PSI-HOTEL v7.5';
          Message_1.Recipients.EMailAddresses := T_empresaEMAIL.AsString;
          Message_1.Subject := 'Relatório de Caixa - '+Trim(T_caixaCAIXA.AsString); //O assunto da mensagem

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
          ShowMessage('Arquivo enviado com sucesso para: ' + T_empresaEMAIL.AsString);
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
  end;

  function SendFile_HTTP(FileToSend: string): boolean;
  var
    HTTP: TIdHTTP;
    Info: TStringList;
    Server, Script: string;
    Response: String;
  begin
    result := False;
    HTTP := TidHTTP.Create;
    HTTP.ProtocolVersion := pv1_0;
    HTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    Response := '';
    Info := TStringList.Create;
    try
      with dm_firedac do
      begin
        try
          Server := T_empresaLOCAL_SERV.AsString; //'HTTP://127.0.0.1:82';
          Script := '/smtp/send_file.php';

          Info.Add('full_name='+T_empresaEMPRESA.AsString);
          Info.Add('telephone='+T_empresaTELEFONE.AsString);
          Info.Add('email_from='+'psihotel.vip@gmail.com');
          Info.Add('email_to='+T_empresaEMAIL.AsString);
          Info.Add('email_cc='+'ezequiasmartins@gmail.com'); // cc suporte
          Info.Add('case_id='+'PSI-HOTEL v'+trim(T_empresaVERSAO.AsString));
          Info.Add('file_send='+FileToSend);
          Info.Add('file_path='+T_empresaPATH_1.AsString);
          Info.Add('smtp_host='+T_empresaSMTP_HOST.AsString);
          Info.Add('smtp_port='+T_empresaSMTP_PORT.AsString);
          Info.Add('smtp_user='+T_empresaSMTP_USER.AsString);
          Info.Add('smtp_password='+T_empresaSMTP_PASSWORD.AsString);
          Info.Add('dt_envio='+DateToStr(Date));
          Info.Add('email_subject='+'Relatório - '+T_caixaCAIXA.AsString);
          Info.Add('your_msg=' +
          'Resumo do Caixa '+Trim(T_caixaCAIXA.AsString)+' '+T_caixaRECEPCAO.AsString+'<br/>'+
          'Turno aberto em '+T_caixaENTRADA.AsString+'<br/>'+
          'Turno fechado em '+T_caixaSAIDA.AsString+'<br/>'+
          'Valor líquido enviado em dinheiro: '+FloatToStrF(T_caixaT_LIQENV.Value,ffCurrency,10,2)+'<br/>'+
          'Valor líquido enviado em cartão: '+FloatToStrF(T_caixaT_CARTAO.Value,ffCurrency,10,2)+'<br/><br/>'+
          'PSI-HOTEL v7.5'+' ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now)+
          '<br/>');

          Response := Trim(HTTP.Post(server + script, Info));

          if Response = 'OK' then
          Result := true;
        finally
  //      ShowMessage('Arquivo enviado com sucesso para: ' + T_empresaEMAIL.AsString);
          Info.Free;
          HTTP.free;
        end;
      end;
    except
      on e:exception do  ShowMessage('Erro no envio do arquivo! Detalhes: '+e.Message);
    end;
  end;

  function SendBKP_HTTP(FileToSend: string): boolean;
  var
    HTTP: TIdHTTP;
    Info: TStringList;
    Server, Script: string;
    Response: String;
  begin
    result := False;
    HTTP := TidHTTP.Create;
    HTTP.ProtocolVersion := pv1_0;
    HTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    Response := '';
    Info := TStringList.Create;

    try
      with dm_firedac do
      begin
        try
          Server := T_empresaLOCAL_SERV.AsString;
          Script := '/smtp/send_file.php'; //http://127.0.0.1:82/smtp/send_file.php'

          Info.Add('full_name='+T_empresaEMPRESA.AsString);
          Info.Add('telephone='+T_empresaTELEFONE.AsString);
          Info.Add('email_from='+'psihotel.vip@gmail.com');
          Info.Add('email_to='+'ezequiasmartins@gmail.com'); // cc suporte
          Info.Add('email_cc='+''); // cc suporte
          Info.Add('case_id='+ 'PSI-HOTEL v'+trim(T_empresaVERSAO.AsString));
          Info.Add('file_send='+FileToSend);
          Info.Add('file_path='+T_empresaPATH_APLICACAO.AsString+'\backup\');
          Info.Add('smtp_host='+T_empresaSMTP_HOST.AsString);
          Info.Add('smtp_port='+T_empresaSMTP_PORT.AsString);
          Info.Add('smtp_user='+T_empresaSMTP_USER.AsString);
          Info.Add('smtp_password='+T_empresaSMTP_PASSWORD.AsString);
          Info.Add('dt_envio='    + DateToStr(Date));
          Info.Add('email_subject=' + 'Backup (PSI-HOTEL v7.5)');
          T_caixa.Last;
          Info.Add('your_msg=' +
          'Último fechamento de Caixa Nº '+Trim(T_caixaCAIXA.AsString)+'<br/>'+
          'PSI-HOTEL v7.5'+' ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now)+
          '<br/>');

           Response := Trim(HTTP.Post(server + script, Info));

          if Response = 'OK' then
          Result := true;
        finally
          Info.Free;
          HTTP.free;
        end;
      end;
    except
      on e:exception do  ShowMessage('Erro no envio do arquivo! Detalhes: '+e.Message);
    end;
  end;

  procedure ShowModalForm(FormClass: TFormClass; var Reference);
  var
    Instance: TForm;
  begin
    if (TForm(Reference) = NIL) then
    begin
      Instance := TForm(FormClass.NewInstance);
      TForm(Reference) := Instance;
      try
        Instance.Create(Application);
      except
        TComponent(Reference) := NIL;
        raise;
      end;
    end;
    if (TForm(Reference) <> NIL) then
    TForm(Reference).ShowModal;
  end;

  procedure F_AjustarEscala(var Reference);
  var
    nEscala: Double; // Vai me passar o percentual de transformação escalar
    nPercentual,ScSize: Integer; // Vai me passar em percentual inteiro o valor
  begin
    with TForm(Reference) do
    begin
      ScSize := dm_firedac.T_empresaSC_SIZE.Value;
      if ScSize <> Screen.Width then
      begin
        nEscala := ((Screen.Width-ScSize)/ScSize);
        nPercentual := Round((nEscala*100)+100);
        Width := Round(Width * (nEscala+1));
        Height := Round(Height * (nEscala+1));
        ScaleBy(nPercentual, 100);
      end;
    end;
  end;

  procedure F_AjustarTela(var Reference);
  {Ajustar de acordo com o padrão 800x600, 1024x768, 1280x800, 1400x900 etc.}
  var
    Screen_W,Screen_H: LongInt;
  begin
    with TForm(Reference) do
    begin
      case dm_firedac.T_empresaSC_SIZE.Value of
      800 : begin
             Screen_W := 800;
             Screen_H := 600;
            end;
      1024: begin
              Screen_W := 1024;
              Screen_H := 768;
            end;
      1280: begin
              Screen_W := 1280;
              Screen_H := 800;
            end;
      1366: begin
              Screen_W := 1366;
              Screen_H := 768;
            end;
      1400: begin
              Screen_W := 1400;
              Screen_H := 900;
            end;
      end;

      scaled := true;

      if (screen.width <> Screen_W) then
      begin
        height := longint(height) * longint(screen.height) DIV Screen_H;
        width := longint(width) * longint(screen.width) DIV Screen_W;
        scaleBy(screen.width, Screen_W);
      end;
    end;
  end;

end.


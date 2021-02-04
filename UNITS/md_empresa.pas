unit md_empresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, OleCtrls, jpeg,
  Printers;

type
  TF_empresa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ed_empresa: TDBEdit;
    ed_cnpj: TDBEdit;
    ed_inscricao: TDBEdit;
    ed_endereco: TDBEdit;
    ed_bairro: TDBEdit;
    ed_cidade: TDBEdit;
    ed_uf: TDBEdit;
    ed_cep: TDBEdit;
    ed_telefone: TDBEdit;
    ed_fax: TDBEdit;
    ed_responsavel: TDBEdit;
    ed_versao: TDBEdit;
    ed_ultimarevisao: TDBEdit;
    ed_ultimacomanda: TDBEdit;
    ed_metadevendas: TDBEdit;
    ed_comissao: TDBEdit;
    RadioGroup_1: TDBRadioGroup;
    Label18: TLabel;
    ed_aviso: TDBMemo;
    Label19: TLabel;
    Label21: TLabel;
    ed_tolerancia: TDBEdit;
    Label22: TLabel;
    Label24: TLabel;
    ed_email: TDBEdit;
    CheckBox_SMTP: TDBCheckBox;
    ed_PathAplicacao: TDBEdit;
    Label25: TLabel;
    ed_Path2: TDBEdit;
    ed_Path3: TDBEdit;
    Label26: TLabel;
    ed_Path1: TDBEdit;
    CheckBox_HTTP: TDBCheckBox;
    CheckBox_BKP: TDBCheckBox;
    RadioGroup_2: TDBRadioGroup;
    Label20: TLabel;
    ed_celular: TDBEdit;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_empresa: TDataSource;
    bt_imprimir: TSpeedButton;
    bt_OpenDiretory: TBitBtn;
    
    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_empresaDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure bt_OpenDiretoryClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
	SIM = 1;
  NAO = 0;

var
  F_empresa: TF_empresa;

  chv,nrg: string;
  ctd,x,y,linha,pag: integer;

implementation

uses
	md_login, md_utilities, md_firedac;

{$R *.DFM}

procedure TF_empresa.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
  	F_empresa.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DA EMPRESA';
		T_empresa.Last;
  end;

	if F_login.IDC <> 9 then
  begin
    ed_empresa.ReadOnly := True; ed_empresa.Color := $00CAFFFF;
    ed_cnpj.ReadOnly := True; ed_cnpj.Color := $00CAFFFF;
    ed_inscricao.ReadOnly := True; ed_inscricao.Color := $00CAFFFF;
    ed_endereco.ReadOnly := True; ed_endereco.Color := $00CAFFFF;
    ed_bairro.ReadOnly := True; ed_bairro.Color := $00CAFFFF;
    ed_cidade.ReadOnly := True; ed_cidade.Color := $00CAFFFF;
    ed_uf.ReadOnly := True; ed_uf.Color := $00CAFFFF;
    ed_cep.ReadOnly := True; ed_cep.Color := $00CAFFFF;
    ed_telefone.ReadOnly := True; ed_telefone.Color := $00CAFFFF;
    ed_fax.ReadOnly := True; ed_fax.Color := $00CAFFFF;
    ed_celular.ReadOnly := True; ed_celular.Color := $00CAFFFF;
    ed_responsavel.ReadOnly := True; ed_responsavel.Color := $00CAFFFF;
    ed_email.ReadOnly := True; ed_email.Color := $00CAFFFF;
    ed_versao.ReadOnly := True; ed_versao.Color := $00CAFFFF;
    ed_ultimarevisao.ReadOnly := True; ed_ultimarevisao.Color := $00CAFFFF;
    ed_ultimacomanda.ReadOnly := True; ed_ultimacomanda.Color := $00CAFFFF;
    RadioGroup_2.ReadOnly := True; RadioGroup_2.Color := $00CAFFFF;
    ed_PathAplicacao.ReadOnly := True; ed_PathAplicacao.Color := $00CAFFFF;
    CheckBox_SMTP.ReadOnly := True; CheckBox_SMTP.Color := $00CAFFFF;
    ed_Path1.ReadOnly := True; ed_Path1.Color := $00CAFFFF;
    ed_Path2.ReadOnly := True; ed_Path2.Color := $00CAFFFF;
    ed_Path3.ReadOnly := True; ed_Path3.Color := $00CAFFFF;
    ed_aviso.ReadOnly := True; ed_aviso.Color := $00CAFFFF;
  end else
  if F_login.IDC = 9 then
  begin
    ed_empresa.ReadOnly := False; ed_empresa.Color := clWhite;
    ed_cnpj.ReadOnly := False; ed_cnpj.Color := clWhite;
    ed_inscricao.ReadOnly := False; ed_inscricao.Color := clWhite;
    ed_endereco.ReadOnly := False; ed_endereco.Color := clWhite;
    ed_bairro.ReadOnly := False; ed_bairro.Color := clWhite;
    ed_cidade.ReadOnly := False; ed_cidade.Color := clWhite;
    ed_uf.ReadOnly := False; ed_uf.Color := clWhite;
    ed_cep.ReadOnly := False; ed_cep.Color := clWhite;
    ed_telefone.ReadOnly := False; ed_telefone.Color := clWhite;
    ed_fax.ReadOnly := False; ed_fax.Color := clWhite;
    ed_celular.ReadOnly := False; ed_celular.Color := clWhite;
    ed_responsavel.ReadOnly := False; ed_responsavel.Color := clWhite;
    ed_email.ReadOnly := False; ed_email.Color := clWhite;
    ed_versao.ReadOnly := False; ed_versao.Color := clWhite;
    ed_ultimarevisao.ReadOnly := False; ed_ultimarevisao.Color := clWhite;
    ed_ultimacomanda.ReadOnly := False; ed_ultimacomanda.Color := clWhite;
    RadioGroup_2.ReadOnly := False; RadioGroup_2.Color := clWhite;
    ed_PathAplicacao.ReadOnly := False; ed_PathAplicacao.Color := clWhite;
    CheckBox_SMTP.ReadOnly := False; CheckBox_SMTP.Color := clWhite;
    ed_Path1.ReadOnly := False; ed_Path1.Color := clWhite;
    ed_Path2.ReadOnly := False; ed_Path2.Color := clWhite;
    ed_Path3.ReadOnly := False; ed_Path3.Color := clWhite;
    ed_aviso.ReadOnly := False; ed_aviso.Color := clWhite;
  end;
  bt_status(0); ed_empresa.SetFocus;
end;

procedure TF_empresa.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ;
 	end else
  if opcao = 1 then
  begin
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false;
  end;
end;

procedure TF_empresa.processo(opcao: byte);
var
	x1,x2: string;
  MyTXT: TextFile;

  procedure impresso_dadosdaempresa;
  begin
    with dm_firedac do
    begin
      Writeln(MyTXT,'PSI-HOTEL v'+trim(T_empresaVERSAO.Value));
      Writeln(MyTXT,'------------------------------------------------');
      Writeln(MyTXT,'DADOS DA EMPRESA');
      Writeln(MyTXT,' ');
      Writeln(MyTXT,T_empresaEMPRESA.AsString);
      Writeln(MyTXT,T_empresaENDERECO.AsString);
      Writeln(MyTXT,T_empresaBAIRRO.AsString+' - '+T_empresaCIDADE.AsString+'/'+T_empresaUF.AsString);
      Writeln(MyTXT,'CEP: '+T_empresaCEP.AsString);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'CNPJ: '+T_empresaCNPJ.AsString);
      Writeln(MyTXT,'INSCRIÇÃO: '+T_empresaINSCRICAO.AsString);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'RESPONSÁVEL: ');
      Writeln(MyTXT,T_empresaRESPONSAVEL.AsString);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'E-MAIL: ');
      Writeln(MyTXT,T_empresaEMAIL.AsString);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'TELEFONES: ');
      if Length(T_empresaTELEFONE.asString)> 0 then Writeln(MyTXT,T_empresaTELEFONE.AsString);
      if Length(T_empresaFAX.asString)> 0 then Writeln(MyTXT,T_empresaFAX.AsString);
      if Length(T_empresaCELULAR.asString)> 0 then Writeln(MyTXT,T_empresaCELULAR.AsString);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'------------------------------------------------');
      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
      Writeln(MyTXT,''); Writeln(MyTXT,#12); // ejeta a página
      // fim de impressão - DADOS DA EMPRESA
    end;
  end;

begin
	case opcao of
  03: with dm_firedac do
  		begin
        ds_empresa.DataSet.Post;
        bt_status(0); ed_empresa.SetFocus;
	  	end;

	04:	with dm_firedac do
  		begin
        ds_empresa.DataSet.Cancel;
        bt_status(0); ed_empresa.SetFocus;
  		end;

  05:	with dm_firedac do
  		begin
        case T_empresaSAIDA_I.Value of
        1,5:if MsgDlg('Imprimir dados da empresa?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
            begin
              // imprime em Arquivo
              AssignFile(MyTXT, T_empresaPATH_APLICACAO.AsString+'\EMPRESA.TXT');
              Rewrite(MyTXT);
              impresso_dadosdaempresa;
              CloseFile(MyTXT);
              // imprime em Generic Text Only
              if T_empresaSAIDA_I.Value = 5 then
              begin
                AssignFile(MyTXT,'LPT1');
                Rewrite(MyTXT);
                impresso_dadosdaempresa;
                CloseFile(MyTXT);
              end;
            end;
      	end;
  		end;

  07: CLOSE;
  end;
end;

procedure TF_empresa.processar_evento(Sender: TObject);
begin
	if Sender = bt_ok   		then processo(03) else
	if Sender = bt_cancelar	then processo(04) else
  if Sender = bt_imprimir then processo(05) else
	if Sender = bt_fechar	 	then processo(07);
end;

procedure TF_empresa.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_F7 : processo(03);
  VK_F8 : processo(04);
  VK_F5 : processo(05);
  VK_F10: processo(07);
  end;
end;

procedure TF_empresa.bt_OpenDiretoryClick(Sender: TObject);
begin
  ds_empresa.DataSet.Edit;
  ed_PathAplicacao.Text := ExtractFilePath(Application.ExeName);
  ed_Path1.Text := ExtractFilePath(Application.ExeName)+'impressos\CAIXA\';
  ed_Path2.Text := ExtractFilePath(Application.ExeName)+'impressos\CANHOTOS\';
  ed_Path3.Text := ExtractFilePath(Application.ExeName)+'impressos\CONTAS\';
  bt_status(1);
end;

procedure TF_empresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_empresa.ds_empresaDataChange(Sender: TObject;
Field: TField);
begin
  if ds_empresa.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_empresa.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_empresa);
end;

end.

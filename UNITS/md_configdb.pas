unit md_configdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Printers;

type
  TF_configdb = class(TForm)
    tipo_acesso: TDBRadioGroup;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ed_localserv: TDBEdit;
    ed_localuser: TDBEdit;
    ed_localdb: TDBEdit;
    ed_webserv: TDBEdit;
    ed_webuser: TDBEdit;
    ed_webdb: TDBEdit;
    CheckBox_1: TCheckBox;
    CheckBox_2: TCheckBox;
    ed_localpassword: TMaskEdit;
    ed_webpassword: TMaskEdit;
    Label1: TLabel;
    ed_smtphost: TDBEdit;
    ed_user: TLabel;
    ed_smtpuser: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_smtpport: TDBEdit;
    ed_smtppassword: TMaskEdit;
    CheckBox_3: TCheckBox;
    Bevel3: TBevel;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_fechar: TBitBtn;
    ds_empresa: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_empresaDataChange(Sender: TObject; Field: TField);
    procedure CheckBox_1Click(Sender: TObject);
    procedure CheckBox_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox_3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_configdb: TF_configdb;

  chv: string;
  x,y: integer;

implementation

uses
	md_utilities, md_firedac;

{$R *.dfm}

procedure TF_configdb.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_configdb.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CONFIGURAÇÕES DE ACESSO AO DATABASE';
    CheckBox_1.Checked := FALSE;
    CheckBox_2.Checked := FALSE;
    CheckBox_3.Checked := False;
		T_empresa.Last;
    ed_localpassword.Text := xyz(T_empresaLOCAL_PASSWORD.Value);
    ed_webpassword.Text := xyz(T_empresaWEB_PASSWORD.Value);
    ed_smtppassword.Text := xyz(T_empresaSMTP_PASSWORD.Value);
  end;
  bt_status(0); tipo_acesso.SetFocus;
end;

procedure TF_configdb.bt_status(opcao: byte);
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

procedure TF_configdb.processo(opcao: byte);
begin
	case opcao of
  03: with dm_firedac do
  		begin
			  if T_empresa.State in [dsEdit, dsInsert] then
        begin
          T_empresaLOCAL_PASSWORD.Value := xyz(ed_localpassword.Text);
  				T_empresaWEB_PASSWORD.Value := xyz(ed_webpassword.Text);
          T_empresaSMTP_PASSWORD.Value := xyz(ed_smtppassword.Text);
        end;
				T_empresa.Post;
        bt_status(0); bt_fechar.SetFocus;
	  	end;

	04:	with dm_firedac do
  		begin
				T_empresa.Cancel;
        bt_status(0); bt_fechar.SetFocus;
  		end;

  05: if MsgDlg('IMPRIMIR DADOS CONFIG DB E SMTP?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
      with dm_firedac do
      begin
        // implementar bloco de impressão
      end;

  07: CLOSE;
  end;
end;

procedure TF_configdb.processar_evento(Sender: TObject);
begin
	if Sender = bt_ok   			then processo(03) else
	if Sender = bt_cancelar		then processo(04) else
	if Sender = bt_fechar	 		then processo(07);
end;

procedure TF_configdb.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F7 : Processo(03);
  VK_F8 : Processo(04);
  VK_F10: Processo(07);
  end;
end;

procedure TF_configdb.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_configdb.ds_empresaDataChange(Sender: TObject; Field: TField);
begin
  if ds_empresa.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_configdb.CheckBox_1Click(Sender: TObject);
begin
  if CheckBox_1.Checked = TRUE then
	ed_localpassword.PasswordChar := #0 else
  ed_localpassword.PasswordChar := '*';
end;

procedure TF_configdb.CheckBox_2Click(Sender: TObject);
begin
  if CheckBox_2.Checked = TRUE then
	ed_webpassword.PasswordChar := #0 else
  ed_webpassword.PasswordChar := '*';
end;

procedure TF_configdb.CheckBox_3Click(Sender: TObject);
begin
  if CheckBox_3.Checked = TRUE then
	ed_smtppassword.PasswordChar := #0 else
  ed_smtppassword.PasswordChar := '*';
end;

procedure TF_configdb.FormCreate(Sender: TObject);
begin
//	F_AjustarTela(F_configdb);
end;

end.

unit md_dadosdousuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DB, DBCtrls;

type
  TF_dadosdousuario = class(TForm)
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox_1: TCheckBox;
    CheckBox_2: TCheckBox;
    ed_senha: TEdit;
    ed_contrasenha: TEdit;
    Edit_1: TDBEdit;
    Edit_2: TDBEdit;
    Edit_3: TDBEdit;
    RadioGroup_1: TDBRadioGroup;
    GroupBox_1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Edit_5: TDBEdit;
    Edit_6: TDBEdit;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_usuarios: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
    procedure ed_contrasenhaExit(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure CheckBox_1Click(Sender: TObject);
    procedure CheckBox_2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ds_usuariosDataChange(Sender: TObject; Field: TField);
    procedure bt_fecharClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_dadosdousuario: TF_dadosdousuario;
  chv,password,linha: string;

implementation

uses
  md_utilities, md_usuarios, md_firedac;

{$R *.dfm}

procedure TF_dadosdousuario.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_dadosdousuario.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - DADOS DO USUÁRIO';
    CheckBox_1.Checked := FALSE;
    CheckBox_2.Checked := FALSE;
    case F_usuarios.ds_opcao of
    1:begin
        T_usuarios.IndexFieldNames := 'ID'; T_usuarios.LAST;
        if T_usuarios.RecordCount = 0 then chv := '1' else chv := trim(IntToStr((StrToInt(T_usuariosID.value)+1)));
        while length(chv) < 6 do chv := '0'+ chv;

        T_usuarios.Insert;

        T_usuariosID.value := chv;
        T_usuariosUSUARIO.value := '';
        T_usuariosSENHA.value := '';
        T_usuariosIDC.value := 1;
        T_usuariosHR_ENTRADA.AsString := '07:00:00';  // Turnos de 12x36 hs.
        T_usuariosHR_SAIDA.AsString := '19:00:00';
      end;

    2:begin
        ed_senha.Text := ''; ed_contrasenha.Text := '';
        T_usuarios.Edit;
      end;
    end;
    bt_status(0); Edit_2.SetFocus;
  end;
end;

procedure TF_dadosdousuario.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
	  bt_ok.Enabled				:= False;
  	bt_cancelar.Enabled	:= False;
    bt_fechar.Enabled		:= True;
 	end else
  if opcao = 1 then
  begin
	  bt_ok.Enabled				:= True;
  	bt_cancelar.Enabled := True;
    bt_fechar.Enabled		:= False;
  end;
end;

procedure TF_dadosdousuario.ed_contrasenhaExit(Sender: TObject);
begin
  with dm_firedac do
  begin
    if ds_usuarios.State in [dsInsert, dsEdit] then
    begin
	    if ed_contrasenha.Text <> ed_senha.Text then
  	  begin
    	  ShowMessage('SENHA e CONFIRMAÇÃO não conferem! Por favor, digite-as novamente.');
      	ed_senha.SetFocus;
      end;
    end;
  end;
end;

procedure TF_dadosdousuario.CheckBox_1Click(Sender: TObject);
begin
  if CheckBox_1.Checked = TRUE then
	ed_senha.PasswordChar := #0 else
  ed_senha.PasswordChar := '*';
end;

procedure TF_dadosdousuario.CheckBox_2Click(Sender: TObject);
begin
  if CheckBox_2.Checked = TRUE then
	ed_contrasenha.PasswordChar := #0 else
  ed_contrasenha.PasswordChar := '*';
end;

procedure TF_dadosdousuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_dadosdousuario.bt_okClick(Sender: TObject);
begin
	with dm_firedac do
  begin
    if ds_usuarios.State in [dsInsert,dsEdit] then
    begin
      T_usuarios.Post;

      if Length(ed_senha.Text)> 0 then
      begin
        chv := T_usuariosID.Value;
        password := ed_senha.Text; if password = '' then password := 'NULL';
        linha := 'update T_usuarios SET SENHA = PASSWORD(md5('+password+')) WHERE ID = '+chv+' ';
        q_usuarios.DisableControls;
        q_usuarios.SQL.Clear;
        q_usuarios.SQL.text := linha;
        q_usuarios.ExecSQL;
        q_usuarios.EnableControls;
      end;
    end;
    T_usuarios.Refresh;
		bt_status(0);
  end;
end;

procedure TF_dadosdousuario.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac  do
  begin
    if ds_usuarios.State in [dsInsert,dsEdit] then
    T_usuarios.Cancel;
  end;
	bt_status(0);
end;

procedure TF_dadosdousuario.bt_fecharClick(Sender: TObject);
begin
	CLOSE;
end;

procedure TF_dadosdousuario.ds_usuariosDataChange(Sender: TObject;
  Field: TField);
begin
	if ds_usuarios.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_dadosdousuario.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_dadosdousuario);
end;

end.

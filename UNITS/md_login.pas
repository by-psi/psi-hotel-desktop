unit md_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param;

type
  TF_login = class(TForm)
    Label_1: TLabel;
    Label_2: TLabel;
    Label_4: TLabel;
    ed_senha: TEdit;
    Label_3: TLabel;
    Image1: TImage;
    bt_cancelar: TBitBtn;
    bt_ok: TBitBtn;
    ds_usuarios: TDataSource;
    ed_usuario: TComboBox;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure edit_keypress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    USR: string;
    IDC: byte;
  end;

var
  F_login: TF_login;
  linha,chv,pwd: string;

implementation

{$R *.dfm}

uses md_utilities, md_firedac;

procedure TF_login.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_login.Caption := 'PSI-HOTEL v'+dm_firedac.q_empresa.FieldByName('VERSAO').AsString+' - LOGIN DE ACESSO';
    q_usuarios.First; ed_senha.Text := '';
  	ed_usuario.Items.Clear;
    while not q_usuarios.EOF do
    begin
    	ed_usuario.Items.Add(q_usuarios.FieldByName('USUARIO').AsString);
      q_usuarios.NEXT;
    end;
	  ed_usuario.ItemIndex := 0;
    ed_usuario.SetFocus;
  end;
end;

procedure TF_login.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
    if ed_senha.Text = '' then ed_senha.Text := 'NULL';
//  SELECT * FROM T_USUARIOS WHERE USUARIO = :USUARIO AND SENHA = PASSWORD(md5(:SENHA)) 	
    query_login.DisableControls;
    query_login.Close;
    query_login.ParamByName('USUARIO').AsString := ed_usuario.Text;
    query_login.ParamByName('SENHA').AsString := ed_senha.Text;
    query_login.Open;
    query_login.EnableControls;

		if NOT (query_login.IsEmpty) then
    begin
      USR := query_login.FieldByName('USUARIO').AsString;
    	IDC := query_login.FieldByName('IDC').AsInteger;
	end else
	begin
      ShowMessage('ACESSO NEGADO! USUÁRIO E SENHA NÃO CONFEREM.');
      USR := 'NÃO AUTORIZADO';
      IDC := 3;
    end;
  end;
  CLOSE;
end;

procedure TF_login.bt_cancelarClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TF_login.edit_keypress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_login.FormCreate(Sender: TObject);
begin
//	F_AjustarTela(F_login);
end;

end.

unit md_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, Printers,
  ExtCtrls;

type
  TF_usuarios = class(TForm)
    Grid_1: TDBGrid;
    DBNavigator_1: TDBNavigator;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_usuarios: TDataSource;

    procedure FormShow(Sender: TObject);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_1TitleClick(Column: TColumn);
    procedure Grid_1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ds_opcao: byte;
  end;

const
	SIM = 1;
  NAO = 0;

var
  F_usuarios: TF_usuarios;

  chv: string;
  x,y,linha,pag: integer;
  MyTXT: TextFile;

implementation

uses
	md_utilities, md_dadosdousuario, md_firedac;

{$R *.dfm}

procedure TF_usuarios.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
  	F_usuarios.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DE USUÁRIOS';
  	T_usuarios.First;
  end;
	Grid_1.SetFocus;
end;

procedure TF_usuarios.processo(opcao: byte);
var
	x1,x2,x3,x4,x5: string;

  procedure listagem_usuarios;
  begin
    with dm_firedac do
    begin
      Writeln(MyTXT,T_empresaEMPRESA.Value);
      Writeln(MyTXT,T_empresaENDERECO.Value);
      Writeln(MyTXT,T_empresaTELEFONE.Value);
      Writeln(MyTXT,'');
      Writeln(MyTXT,'CONTROLE DE DIARIAS - v'+trim(dm_firedac.T_empresaVERSAO.Value));
      Writeln(MyTXT,'------------------------------------------------');
      Writeln(MyTXT,'LISTAGEM DE USUARIOS');
      Writeln(MyTXT,' ');
//                   000000 AAA456789012345678 00:00:00 00:00:00 99
      Writeln(MyTXT,'ID     USUARIO            ENTRADA  SAIDA    IDC');
      Writeln(MyTXT,' ');

      T_usuarios.FIRST;
      while not T_usuarios.EOF do
      begin
        x1 := T_usuariosID.Value;
        x2 := Trim(T_usuariosUSUARIO.Value); Insert_R(x2,18,' ');
        x3 := TimeToStr(T_usuariosHR_ENTRADA.Value);
        x4 := TimeToStr(T_usuariosHR_SAIDA.Value);
        x5 := IntToStr(T_usuariosIDC.Value);
        Writeln(MyTXT,x1+' '+x2+' '+x3+' '+x4+' '+x5);
        Writeln(MyTXT,'------------------------------------------------');
        T_usuarios.NEXT;
      end;
      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
      Writeln(MyTXT,''); Writeln(MyTXT,#12); // ejeta a página
      // fim de impressão - copa
      T_usuarios.FIRST;
    end;

  end;

begin
  case opcao of
  01:	with dm_firedac do
  		begin
        ds_opcao := 1;
        ShowModalForm(TF_dadosdousuario, F_dadosdousuario);
				Grid_1.Refresh; Grid_1.SetFocus;
	    end;

  02:	with dm_firedac do
  		begin
        if MsgDlg('Confirma exclusão deste usuário?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
        if T_usuarios.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
					Grid_1.SetFocus;
        end else
        begin
          T_usuarios.Delete;
					Grid_1.Refresh; Grid_1.SetFocus;
        end;
	  	end;

	03: with dm_firedac do
  		begin
        ds_opcao := 2;
        ShowModalForm(TF_dadosdousuario, F_dadosdousuario);
        Grid_1.Refresh; Grid_1.SetFocus;
      end;

  05: if MsgDlg('Imprimir listagem de Usuários?', mtConfirmation, [mbYes, mbNo]) = mrNo then
      with dm_firedac do
      begin
        if T_empresaSAIDA_I.Value = 1 then
        AssignFile(MyTXT, 'USUARIOS.TXT') else
        AssignFile(MyTXT, 'LPT1');
        Rewrite(MyTXT);
        listagem_usuarios;
        CloseFile(MyTXT);
			end;

  07: CLOSE;
  end;
end;

procedure TF_usuarios.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir then processo(01) else
	if Sender = bt_excluir then processo(02) else
  if Sender = bt_imprimir	then processo(05) else
	if Sender = bt_fechar	then processo(07);
end;

procedure TF_usuarios.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_F2 : Processo(01);
  VK_F3 : Processo(02);
  VK_F5 : Processo(05);
  VK_F10: Processo(07);
  end;
end;

procedure TF_usuarios.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_usuarios.IndexFieldNames := Column.FieldName;
end;

procedure TF_usuarios.Grid_1DblClick(Sender: TObject);
begin
  processo(03);
end;

procedure TF_usuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_usuarios.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_usuarios);
end;

end.

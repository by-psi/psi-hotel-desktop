unit md_grupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask, Grids,
  DBGrids;

type
  TF_grupos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ed_idgrupo: TDBEdit;
    ed_grupo: TDBEdit;
    Grid_1: TDBGrid;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    DBNavigator_1: TDBNavigator;
    ds_grupos: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_gruposDataChange(Sender: TObject; Field: TField);
    procedure Grid_1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_grupos: TF_grupos;

  chv: string;
  x,y,linha,pag: integer;

const
	SIM = 1;
  NAO = 0;

implementation

uses md_utilities, md_firedac;

{$R *.dfm}

procedure TF_grupos.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
   	F_grupos.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DE GRUPOS';
    T_grupos.First;
  end;
  bt_status(0); Grid_1.SetFocus;
end;

procedure TF_grupos.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
    bt_incluir.enabled	 	:= true ;
    bt_excluir.enabled 		:= true ;
    bt_imprimir.enabled 	:= true ;
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ;
 	end else
  if opcao = 1 then
  begin
    bt_incluir.enabled  	:= false;
    bt_excluir.enabled  	:= false;
    bt_imprimir.enabled 	:= false;
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false;
  end;
end;

procedure TF_grupos.processo(opcao: byte);
begin
	case opcao of
  01:	with dm_firedac do
  		begin
        T_grupos.IndexFieldNames := 'ID_GRUPO'; T_grupos.LAST;
        if T_grupos.RecordCount = 0 then chv := '1' else
  			chv := trim(IntToStr((StrToInt(T_gruposID_GRUPO.value)+1)));
        while length(chv) < 2 do chv := '0'+ chv;
        T_grupos.Insert;
				T_gruposID_GRUPO.value := chv;
        T_gruposGRUPO.value := '';
        T_gruposCHV.value := '1';
				T_grupos.Post;
        ed_grupo.SetFocus;
	    end;

  02:	with dm_firedac do
  		begin
        if MsgDlg('Deseja EXCLUIR esta FICHA?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        if T_grupos.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
          Grid_1.SetFocus;
        end else
        begin
	        T_grupos.Delete;
  	      Grid_1.SetFocus;
        end;
	  	end;

	03: with dm_firedac do
  		begin
				T_grupos.Post;
        bt_status(0); Grid_1.SetFocus;
	  	end;

  04: with dm_firedac do
  		begin
				T_grupos.Cancel;
        bt_status(0); Grid_1.SetFocus;
  		end;

  05: begin
				{listagem - grupos de mercadorias}
      end;

  07:	CLOSE;
  end;
end;

procedure TF_grupos.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir		then processo(01) else
	if Sender = bt_excluir		then processo(02) else
  if Sender = bt_imprimir		then processo(05) else
	if Sender = bt_ok   			then processo(03) else
	if Sender = bt_cancelar		then processo(04) else
	if Sender = bt_fechar	 		then processo(07);
end;

procedure TF_grupos.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_F2 : Processo(01);
  VK_F3 : Processo(02);
  VK_F5 : Processo(05);
  VK_F7 : Processo(03);
  VK_F8 : Processo(04);
  VK_F10: Processo(07);
  end;
end;

procedure TF_grupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_grupos.ds_gruposDataChange(Sender: TObject; Field: TField);
begin
  if ds_grupos.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_grupos.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_grupos.IndexFieldNames := Column.FieldName;
end;

procedure TF_grupos.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_grupos);
end;

end.

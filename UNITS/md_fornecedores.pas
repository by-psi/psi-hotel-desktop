unit md_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  ComCtrls, DB, Printers;

type
  TF_fornecedores = class(TForm)
    Grid_1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    ed_codigo: TDBEdit;
    ed_fornecedor: TDBEdit;
    Label3: TLabel;
    ed_endereco: TDBEdit;
    Label4: TLabel;
    ed_bairro: TDBEdit;
    Label5: TLabel;
    ed_cidade: TDBEdit;
    Label6: TLabel;
    ed_uf: TDBEdit;
    Label7: TLabel;
    ed_cep: TDBEdit;
    Label8: TLabel;
    ed_cnpj: TDBEdit;
    Label9: TLabel;
    ed_inscricao: TDBEdit;
    Label10: TLabel;
    ed_contato: TDBEdit;
    Label14: TLabel;
    ed_email: TDBEdit;
    Label15: TLabel;
    ed_telefone: TDBEdit;
    Label11: TLabel;
    ed_fax: TDBEdit;
    Label12: TLabel;
    ed_celular: TDBEdit;
    DBNavigator_1: TDBNavigator;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_fornecedores: TDataSource;


    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_fornecedoresDataChange(Sender: TObject; Field: TField);

    procedure Grid_1TitleClick(Column: TColumn);
    procedure Grid_1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_fornecedores: TF_fornecedores;

  chv: string;
  x,y,linha,pag: integer;

const
	SIM = 1;
  NAO = 0;

implementation

uses md_utilities, md_firedac;

{$R *.dfm}

procedure TF_fornecedores.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
   	F_fornecedores.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DE FORNECEDORES';
    T_fornecedores.First;
  end;
  bt_status(0); Grid_1.SetFocus;
end;

procedure TF_fornecedores.bt_status(opcao: byte);
begin
	if opcao = 0 then // modo de edição OFF
  begin
    bt_incluir.enabled	 	:= true ;
    bt_excluir.enabled 		:= true ;
    bt_imprimir.enabled 	:= true ;
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ;
 	end else
  if opcao = 1 then // modo de edição ON
  begin
    bt_incluir.enabled  	:= false;
    bt_excluir.enabled  	:= false;
    bt_imprimir.enabled 	:= false;
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false;
  end;
end;

procedure TF_fornecedores.processo(opcao: byte);
begin
	case opcao of
  01:	with dm_firedac do
  		begin
        T_fornecedores.Last; chv := '';
        if T_fornecedores.RecordCount = 0 then chv := '000001' else chv := trim(IntToStr((T_fornecedores.RecordCount+1)));
        while length(chv) < 6 do chv := '0'+ chv;

        T_fornecedores.INSERT;
				T_fornecedoresID_FORNEC.value := chv;
        T_fornecedoresFORNECEDOR.value := '';
        T_fornecedoresENDERECO.value := '';
        T_fornecedoresBAIRRO.value := '';
        T_fornecedoresCIDADE.value := 'BELO HORIZONTE';
        T_fornecedoresUF.value := 'MG';
        T_fornecedoresCEP.value := '30000-000';
        T_fornecedoresCNPJ.value := '00.000.000/0001-00';
        T_fornecedoresINSCRICAO.value := '000.000.000.0000';
        T_fornecedoresCONTATO.value := '';
        T_fornecedoresTELEFONE.value := '';
        T_fornecedoresFAX.value := '';
        T_fornecedoresCELULAR.value := '';
        T_fornecedoresEMAIL.value := 'email@provedor.com.br';
				T_fornecedores.POST;

        ed_fornecedor.SetFocus;
	    end;

  02:	with dm_firedac do
  		begin
        if MsgDlg('Confirma exclusão deste fornecedor?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        if T_fornecedores.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
          Grid_1.SetFocus;
        end else
        begin
	        T_fornecedores.DELETE;
  	      Grid_1.SetFocus;
        end;
	  	end;

	03: with dm_firedac do
  		begin
        T_fornecedores.POST;
        bt_status(0); ed_codigo.SetFocus;
	  	end;

  04: with dm_firedac do
  		begin
        T_fornecedores.CANCEL;
        bt_status(0); ed_codigo.SetFocus;
  		end;

  05: begin
				{impressão ficha individual - fornecedor}
      end;

  07: CLOSE;
  end;
end;

procedure TF_fornecedores.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir		then processo(01) else
	if Sender = bt_excluir		then processo(02) else
  if Sender = bt_imprimir		then processo(05) else
	if Sender = bt_ok   			then processo(03) else
	if Sender = bt_cancelar		then processo(04) else
	if Sender = bt_fechar	 		then processo(07);
end;

procedure TF_fornecedores.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
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

procedure TF_fornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
  		Key := #0;
	end;
end;

procedure TF_fornecedores.ds_fornecedoresDataChange(Sender: TObject; Field: TField);
begin
	if ds_fornecedores.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_fornecedores.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_fornecedores.IndexFieldNames := Column.FieldName;
end;

procedure TF_fornecedores.Grid_1DblClick(Sender: TObject);
begin
  ed_fornecedor.SetFocus;
end;

procedure TF_fornecedores.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_fornecedores);
end;

end.


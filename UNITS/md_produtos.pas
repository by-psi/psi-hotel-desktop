unit md_produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Db,
  Printers, OleCtrls;

type
  TF_produtos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Grid_1: TDBGrid;
    ed_codigo: TDBEdit;
    ed_produto: TDBEdit;
    ed_grupo: TDBLookupComboBox;
    ed_vrcusto: TDBEdit;
    ed_vrvenda: TDBEdit;
    ed_estqminimo: TDBEdit;
    ed_sdatual: TDBEdit;
    ed_unidade: TDBComboBox;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    DBNavigator_1: TDBNavigator;
    bt_renumerar: TSpeedButton;
    ds_grupos: TDataSource;
    ds_produtos: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_produtosDataChange(Sender: TObject; Field: TField);
    procedure Grid_1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
	SIM = 1;
  NAO = 0;

var
  F_produtos: TF_produtos;

	chv: string;
  ctd, x,y,linha,pag: integer;

implementation

uses md_utilities, md_firedac;

{$R *.DFM}

procedure TF_produtos.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
   	F_produtos.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DE PRODUTOS';
    T_produtos.First;
  end;
  bt_status(0); Grid_1.SetFocus;
end;

procedure TF_produtos.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
    bt_incluir.Enabled	:= true ;
    bt_excluir.Enabled 	:= true ;
    bt_imprimir.Enabled := true ;
	  bt_ok.Enabled 		  := FALSE;
  	bt_cancelar.Enabled	:= FALSE;
    bt_fechar.Enabled 	:= true ;
 	end else
  if opcao = 1 then
  begin
    bt_incluir.Enabled  := false;
    bt_excluir.Enabled  := false;
    bt_imprimir.Enabled := false;
	  bt_ok.Enabled   	  := TRUE	;
  	bt_cancelar.Enabled := TRUE ;
    bt_fechar.Enabled		:= false;
  end;
end;

procedure TF_produtos.processo(opcao: byte);
var
	x01,x02,x03,
  cb_1,cb_2,cb_3: string;
  MyTXT: TextFile;

	procedure xy(x,y: integer; s: string);
	begin
    Printer.Canvas.TextOut(x*10,y*32,s); { Para teste em arquivo (video) ajustar p/ y*120, valor default: y*20}
  end;

  procedure imprime_cb;
  begin
    with dm_firedac do
    begin
      cb_1 := T_empresaEMPRESA.value;
      cb_2 := T_empresaENDERECO.value;
  	  cb_3:= 'CONTROLE DE DIARIAS - v'+T_empresaVERSAO.value;
      xy(1,1,cb_1); xy(1,2,cb_2); xy(1,3,cb_3);
      xy(1,4,'========================================');
	  end;
	end;

begin
	case opcao of
  01:	with dm_firedac do
  		begin
        T_produtos.Last;
        if T_produtos.RecordCount = 0 then chv := '001' else chv := trim(IntToStr((T_produtos.RecordCount+1)));
        while length(chv) < 3 do chv := '0'+ chv;

        T_produtos.Insert;
        T_produtosID_PRODUTO.Value  := chv ;
        T_produtosID_GRUPO.Value 		:= '01';
        T_produtosPRODUTO.value 		:= ''  ;
        T_produtosUNIDADE.value 		:= 'UN';
        T_produtosVR_CUSTO.Value 		:= 0   ;
      	T_produtosVR_VENDA.Value 		:= 0   ;
        T_produtosENTRADAS.Value		:= 0   ;
        T_produtosSAIDAS.Value			:= 0	 ;
        T_produtosSD_ATUAL.Value 		:= 0   ;
        T_produtosESTQ_M.Value 			:= 0   ;
        T_produtosCHV.Value 				:= '1' ; { 1: ATIVO 0: INATIVO }
        T_produtos.Post;

        bt_status(1); ed_produto.SetFocus;
			end;

  02:	with dm_firedac do
  	  begin
        if MsgDlg('Deseja EXCLUIR este PRODUTO?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        if T_produtos.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
          Grid_1.SetFocus;
        end else
        begin
          T_produtos.Delete;
          Grid_1.SetFocus;
        end;
	  	end;

  03:	with dm_firedac do
  		begin
  			T_produtos.Post;
      	bt_status(0); Grid_1.SetFocus;
	  	end;

	04:	with dm_firedac do
  	  begin
      	T_produtos.Cancel;
        bt_status(0); Grid_1.SetFocus;
  		end;

  05:	with dm_firedac do
  		begin
        if MsgDlg('Imprimir listagem de Produtos?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        begin
          if T_empresaSAIDA_I.Value = 1 then
          AssignFile(MyTXT, 'IMPRESSAO-COPA.TXT') else
          AssignFile(MyTXT, 'LPT1');
          Rewrite(MyTXT);

          Writeln(MyTXT,T_empresaEMPRESA.AsString);
          Writeln(MyTXT,T_empresaENDERECO.Value+' - '+T_empresaTELEFONE.Value);
          Writeln(MyTXT,'CONTROLE DE DIARIAS - v'+trim(T_empresaVERSAO.Value));
          Writeln(MyTXT,'-------------------------------------------------');
          Writeln(MyTXT,'LISTAGEM DE PRODUTOS COPA');
          Writeln(MyTXT,' ');
          Writeln(MyTXT,'COD  PRODUTO                                PREÇO');
          Writeln(MyTXT,' ');

          T_produtos.FIRST;

          while not T_produtos.EOF do
          begin
            x01	:= T_produtosID_PRODUTO.value;
            x02	:= trim(Copy(T_produtosPRODUTO.AsString,1,35)); x02 := Insert_R(x02,37,#32);
            x03 := Copy(FloatToStrF(T_produtosVR_VENDA.Value,ffCurrency, 10,2),3,7); x03 := Insert_L(x03,7,#32);
            Writeln(MyTXT,x01+' '+x02+' '+x03);
            Writeln(MyTXT,'-------------------------------------------------');
            T_produtos.NEXT;
          end;

          Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
          Writeln(MyTXT,''); Writeln(MyTXT,#12); // ejeta a página
          CloseFile(MyTXT);
          Grid_1.SetFocus;
        end;
  		end;

	09: if MsgDlg('Renumerar código de todos os Produtos?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
  		with dm_firedac do
  		begin
        T_produtos.First; ctd := 1; chv := '';
        while not T_produtos.Eof do
        begin
					T_produtos.Edit;
          chv := trim(IntToStr(ctd)); while length(chv) < 3 do chv := '0'+ chv;
					T_produtos.FieldByName('ID_PRODUTO').Value := chv ;
          T_produtos.Post; T_produtos.Next;
          ctd := ctd + 1;
        end;
      	bt_status(0); Grid_1.SetFocus;
		  end;

  07: CLOSE;

  end;
end;

procedure TF_produtos.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir	then processo(01) else
	if Sender = bt_excluir	then processo(02) else
  if Sender = bt_imprimir	then processo(05) else
	if Sender = bt_ok   		then processo(03) else
	if Sender = bt_cancelar	then processo(04) else
  if Sender = bt_renumerar then processo(09) else
	if Sender = bt_fechar	 	then processo(07);
end;

procedure TF_produtos.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
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

procedure TF_produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_produtos.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_produtos.IndexFieldNames := Column.FieldName;
end;

procedure TF_produtos.ds_produtosDataChange(Sender: TObject; Field: TField);
begin
	if ds_produtos.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_produtos.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_produtos);
end;

end.


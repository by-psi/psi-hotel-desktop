unit md_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, DB, StdCtrls, Mask, Grids, DBGrids,
  Buttons, ExtCtrls, Printers, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_estoque = class(TForm)
    PageControl_1: TPageControl;
    TabSheet_1: TTabSheet;
    Grid_1: TDBGrid;
    TabSheet_2: TTabSheet;
    Grid_2: TDBGrid;
    Panel1: TPanel;
    bt_fechar1: TBitBtn;
    bt_resumodacopa: TBitBtn;
    bt_atualizar: TBitBtn;
    bt_zerarestoque: TBitBtn;
    Panel2: TPanel;
    bt_fechar2: TBitBtn;
    ds_estoque: TDataSource;
    Query_T1: TFDQuery;
    ds_grupos: TDataSource;
    query_estoque: TFDQuery;
    dt_inicial: TDateTimePicker;
    dt_final: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit_1: TMaskEdit;
    MaskEdit_2: TMaskEdit;
    MaskEdit_3: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox_1: TComboBox;
    bt_fechar: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_estoqueDataChange(Sender: TObject; Field: TField);
    procedure DBNavigator_1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Grid_1TitleClick(Column: TColumn);
    procedure Grid_3TitleClick(Column: TColumn);
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
  F_estoque: TF_estoque;
  dt_1,dt_2,
  linha,chv,nrg: string;
  ctd,x,y,pag: integer;

implementation

uses
	md_utilities, md_firedac;

{$R *.dfm}

procedure TF_estoque.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_estoque.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CONTROLE DE ESTOQUE (ENTRADAS/SAÍDAS)';

    dt_inicial.Date :=(Now-DayOfTheMonth(Now)+1);
    dt_final.Date := IncMonth(Now)-DayOfTheMonth(Now);

    DateTimeToString(dt_1, 'yyyy-mm-dd', dt_inicial.date);
    DateTimeToString(dt_2, 'yyyy-mm-dd', dt_final.date);

    linha := 'select * from t_estoque order by DH_LANCAMENTO ';

    query_estoque.DisableControls;
    query_estoque.Close;
    query_estoque.SQL.text := linha;
    query_estoque.Open;
    query_estoque.EnableControls;
    query_estoque.First;

    ds_estoque.DataSet := query_estoque;
    Grid_1.Refresh;
  end;

//bt_status(0);
  PageControl_1.ActivePage := TabSheet_1;
  Grid_1.SetFocus;
end;

procedure TF_estoque.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
{    bt_incluir.enabled	 	:= true ;
    bt_excluir.enabled 		:= true ;
    bt_imprimir.enabled 	:= true ;
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ; }
 	end else
  if opcao = 1 then
  begin
{    bt_incluir.enabled  	:= false;
    bt_excluir.enabled  	:= false;
    bt_imprimir.enabled 	:= false;
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false; }
  end;
end;

procedure TF_estoque.processo(opcao: byte);
begin
	case opcao of
  01:	with dm_firedac do
  		begin
//     	bt_status(1);
//      ShowModalForm(TF_entradassaidas, F_entradassaidas);
        PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
//      bt_status(0);
			end;

  02:	with dm_firedac do
  	  begin
        PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
        if MsgDlg('Deseja excluir este lançamento de Entradas/Saídas (E/S)?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
        begin
    			chv := T_estoqueID_PRODUTO.Value;
    			if T_produtos.Locate('ID_PRODUTO',chv,[loPartialKey]) then
          begin
	          T_produtos.Edit;
 		        T_produtosENTRADAS.Value := T_produtosENTRADAS.Value - T_estoqueENTRADAS.Value;
   		      T_produtosSAIDAS.Value := T_produtosSAIDAS.Value 	- T_estoqueSAIDAS.Value;
     		    T_produtosSD_ATUAL.Value := T_produtosENTRADAS.Value - T_produtosSAIDAS.Value;
       		  T_produtos.Post;
          end;
					T_estoque.Delete;
        end;
	  	end;

  04: with dm_firedac do
  		begin
        chv := trim(ed_chv.Text);
				DateTimeToString(dt_1, 'yyyy-mm-dd', dt_inicial.date);
				DateTimeToString(dt_2, 'yyyy-mm-dd', dt_final.date);
        query_estoque.DisableControls;
        query_estoque.Close;
        case ComboBox_1.ItemIndex of
        0:	begin
              linha := 'select * from t_estoque '+
              'where DH_LANCAMENTO between '''+dt_1+'''  and '''+dt_2+''' '+
							'order by DH_LANCAMENTO ';
              query_estoque.SQL.text := linha;
		         	query_estoque.ExecSQL;
              MaskEdit_1.Text := '';
              MaskEdit_2.Text := '';
              MaskEdit_3.Text := '';
	       		end;

        1:	begin
              linha := 'select * from t_estoque ' +
              'where ID_PRODUTO = '''+chv+''' ' +
              'and DH_LANCAMENTO between '''+dt_1+'''  and '''+dt_2+''' ' +
	            'order by DH_LANCAMENTO ';
              query_estoque.SQL.text := linha;
		         	query_estoque.ExecSQL;

              // somando totais de entradas e saídas

              linha := 'select sum(ENTRADAS),sum(SAIDAS) from t_estoque ' +
              'where ID_PRODUTO = '''+chv+''' ' +
              'and DH_LANCAMENTO between '''+dt_1+'''  and '''+dt_2+''' ';
							Query_T1.DisableControls;
              Query_T1.Close;
              Query_T1.SQL.text := linha;
              Query_T1.ExecSQL;
              Query_T1.EnableControls;

              MaskEdit_1.Text := IntToStr(Query_T1.Fields[0].Value);
              MaskEdit_2.Text := IntToStr(Query_T1.Fields[1].Value);
              MaskEdit_3.Text := IntToStr(Query_T1.Fields[0].Value - Query_T1.Fields[1].Value);
          	end;

        2:	begin
              linha := 'select * from t_estoque ' +
              'where ID_GRUPO = '''+chv+''' ' +
              'and DH_LANCAMENTO between '''+dt_1+'''  and '''+dt_2+''' ' +
              'order by DH_LANCAMENTO ';
              query_estoque.SQL.text := linha;
		         	query_estoque.ExecSQL;

              // somando totais de entradas e saídas

              linha := 'select sum(ENTRADAS),sum(SAIDAS) from t_estoque ' +
              'where ID_GRUPO = '''+chv+''' ' +
              'and DH_LANCAMENTO between '''+dt_1+'''  and '''+dt_2+''' ';
							Query_T1.DisableControls;
              Query_T1.Close;
              Query_T1.SQL.text := linha;
              Query_T1.ExecSQL;
              Query_T1.EnableControls;

              MaskEdit_1.Text := IntToStr(Query_T1.Fields[0].Value);
              MaskEdit_2.Text := IntToStr(Query_T1.Fields[1].Value);
              MaskEdit_3.Text := IntToStr(Query_T1.Fields[0].Value - Query_T1.Fields[1].Value);
        		end;

        end;
        query_estoque.EnableControls;
        query_estoque.First;

        PageControl_1.ActivePage := TabSheet_1;
        Grid_1.Refresh;
      end;

  05:	with dm_firedac do
  		begin
				if MsgDlg('Impresso em 40 colunas?',  mtConfirmation, mbYesNoCancel) = mrYes then
        ShowMessage('Impressão não disponível. Este módulo está em revisão!');
//        F_impresso_estoque_40C.Preview else
//				F_impresso_estoque.Preview;
        PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
      end;

  06:	with dm_firedac do
  		begin
        case T_empresaSAIDA_I.Value of
        1,5: ShowMessage('Impressão não disponível. Este módulo está em revisão!');
//        2:F_impresso_copa.Print;
//        3:if mensagem_1('Imprimir resumo da copa?') = SIM then F_impresso_copa.Print;
//        4:F_impresso_copa.Preview;
        end;
        PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
      end;

  07: with dm_firedac do
      begin
        if MsgDlg('Atualizar Saldo de Estoque?', mtConfirmation, mbYesNoCancel) = mrYes then
        begin
          T_produtos.First;
          T_produtos.DisableControls;
          while T_produtos.Eof <> TRUE do
          begin
            chv   := T_produtosID_PRODUTO.Value;
            linha := 'select sum(ENTRADAS),sum(SAIDAS) from t_estoque where ID_PRODUTO = '''+chv+''' ';
            Query_T1.DisableControls;
            Query_T1.Close;
            Query_T1.SQL.text := linha;
            Query_T1.ExecSQL;
            Query_T1.EnableControls;
            T_produtos.Edit;
            if Query_T1.Fields[0].Value = NULL then T_produtosENTRADAS.Value := 0 else T_produtosENTRADAS.Value := Query_T1.Fields[0].Value;
            if Query_T1.Fields[1].Value= NULL then T_produtosSAIDAS.Value := 0 else T_produtosSAIDAS.Value := Query_T1.Fields[1].Value;
            T_produtosSD_ATUAL.Value := T_produtosENTRADAS.Value - T_produtosSAIDAS.Value;
            T_produtos.Post;
            T_produtos.Next;
          end;
          T_produtos.EnableControls;
          T_produtos.First;
        end;
      end;

  08: with dm_firedac do
  		begin
				if MsgDlg('Atenção! Zerar Estoque Atual?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
        begin
          linha := 'update t_produtos set ENTRADAS=0, SAIDAS=0, SD_ATUAL=0 ';
	        Query_T1.DisableControls;
   				Query_T1.Close;
         	Query_T1.SQL.text := linha;
         	Query_T1.ExecSQL;
         	Query_T1.EnableControls;
          T_produtos.Refresh;
        end;
      end;

  10: CLOSE;
  end;
end;

procedure TF_estoque.processar_evento(Sender: TObject);
begin
{	if Sender = bt_incluir		then processo(01) else
	if Sender = bt_excluir		then processo(02) else
	if Sender = bt_selecionar then processo(04) else
  if Sender = bt_imprimir		then processo(05) else }
  if Sender = bt_resumodacopa then processo(06) else
  if Sender = bt_atualizar  then processo(07) else
  if Sender = bt_zerarestoque then processo(08) else
	if Sender = bt_fechar 		then processo(10);
end;

procedure TF_estoque.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_F2 : Processo(01);
  VK_F3 : Processo(02);
  VK_F4 : Processo(04);
  VK_F5 : Processo(05);
  VK_F10: Processo(10);
  end;
end;

procedure TF_estoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_estoque.ds_estoqueDataChange(Sender: TObject; Field: TField);
begin
  if dm_firedac.T_estoque.state in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_estoque.DBNavigator_1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
	PageControl_1.ActivePage := TabSheet_2;
end;

procedure TF_estoque.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_produtos.IndexFieldNames := Column.FieldName;
end;

procedure TF_estoque.Grid_3TitleClick(Column: TColumn);
begin
	dm_firedac.T_estoque.IndexFieldNames := Column.FieldName;
end;

procedure TF_estoque.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_estoque);
end;

end.

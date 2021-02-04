unit md_comandas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, Db, ExtCtrls;

type
  TF_comandas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ed_conta: TDBEdit;
    Label3: TLabel;
    ed_codigo: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    ed_qtd: TDBEdit;
    Label6: TLabel;
    ed_vrunitario: TDBEdit;
    Label7: TLabel;
    ed_comanda: TDBEdit;
    DBLookupComboBox_1: TDBLookupComboBox;
    bt_cancelar: TBitBtn;
    bt_ok: TBitBtn;
    ed_vrtotal: TDBEdit;
    ds_produtos: TDataSource;
    ds_pedidos: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure Grid_1Exit(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure ed_qtdExit(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_comandas: TF_comandas;

  linha,
	x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,
  comanda,chv,cmp: string;
  ctd: integer;

implementation

uses
	md_utilities, md_diarias, md_firedac;

{$R *.DFM}

procedure TF_comandas.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
  	F_comandas.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - LANÇAMENTO DE PEDIDOS (COMANDAS)';

    T_pedidos.Last;
    if T_pedidos.RecordCount = 0 then chv := '1' else chv := trim(IntToStr((T_pedidos.RecordCount+1)));
    while length(chv) < 6 do chv := '0' + chv;

  	T_pedidos.Insert;
    T_pedidosCOMANDA.Value := chv;
    T_pedidosCONTA.value := T_apartamentosDIARIA.Value;
    T_pedidosDH_LANCAMENTO.Value := Now();
    chv := '001'; T_pedidosID_PRODUTO.Value := chv;
    if T_produtos.Locate('ID_PRODUTO',chv,[loPartialKey])then
    T_pedidosQTD.value := 1 else
    T_pedidosQTD.Value := 0;
  end;
  ed_codigo.SetFocus;
end;

procedure TF_comandas.Grid_1Exit(Sender: TObject);
begin
  with dm_firedac do
  begin
		T_pedidosID_PRODUTO.value := T_produtosID_PRODUTO.value;
		T_pedidosPRODUTO.value 		:= T_produtosPRODUTO.value   ;
		T_pedidosVR_UN.value	 		:= T_produtosVR_VENDA.value  ;
	end;
end;

procedure TF_comandas.ed_codigoExit(Sender: TObject);
begin
	with dm_firedac do
  begin
    T_pedidos.DisableControls;
		chv := trim(ed_codigo.text); while length(chv) < 3 do chv := '0' + chv;
    if T_produtos.Locate('ID_PRODUTO',chv,[loPartialKey])then
  	begin
      T_pedidosID_PRODUTO.value := T_produtosID_PRODUTO.value;
      T_pedidosPRODUTO.value 		:= T_produtosPRODUTO.value   ;
      T_pedidosVR_UN.value	 		:= T_produtosVR_VENDA.value  ;
		end else
    begin
			ShowMessage('Produto não cadastrado!');
    	T_produtos.FIRST;
    end;
    T_pedidos.EnableControls;
  end;
end;

procedure TF_comandas.ed_qtdExit(Sender: TObject);
begin
	with dm_firedac do
  begin
		chv := trim(ed_codigo.text); while length(chv) < 2 do chv := '0' + chv;
    if T_produtos.Locate('ID_PRODUTO',chv,[loPartialKey])then
  	begin
    	if (T_produtosSD_ATUAL.Value > 0) and (T_produtosSD_ATUAL.Value <= T_produtosESTQ_M.Value) then
      ShowMessage('Produto abaixo do estoque mínimo, favor abastecer a copa!');
      T_pedidosVR_TOTAL.value := T_pedidosQTD.value *
      T_pedidosVR_UN.value;
{
      if T_produtosSD_ATUAL.Value <= 0 then
      begin
      	mensagem_2('Produto fora de estoque! (estoque zerado)'+#10#13+
        'Lançamento será feito em negativo no saldo de estoque.'+#10#13+
        'Favor abastecer a copa! ');
				T_pedidosVR_TOTAL.value := T_pedidosQTD.value *
  			T_pedidosVR_UN.value;
      end else
      begin
	      if (T_produtosSD_ATUAL.Value > 0) and (T_produtosSD_ATUAL.Value <= T_produtosESTQ_M.Value) then
  	    mensagem_2('Produto abaixo do estoque mínimo, favor abastecer a copa!');
				T_pedidosVR_TOTAL.value := T_pedidosQTD.value *
  			T_pedidosVR_UN.value;
    	end;
}
    end;
  end;
  bt_ok.SetFocus;
end;

procedure TF_comandas.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_pedidos.state in [dsInsert,dsEdit] then
    begin
      chv := T_pedidosID_PRODUTO.Value;
      if T_produtos.Locate('ID_PRODUTO',chv,[loPartialKey]) then
      begin
        T_estoque.Insert;
        T_estoqueDH_LANCAMENTO.value := T_pedidosDH_LANCAMENTO.Value;

        T_estoqueID_PRODUTO.value := T_produtosID_PRODUTO.Value;
        T_estoqueID_GRUPO.value 	:= T_produtosID_GRUPO.Value;
        T_estoqueUNIDADE.value 		:= T_produtosUNIDADE.Value;

        T_estoqueHISTORICO.Value 	:= 'PEDIDO N.'+T_pedidosCOMANDA.Value+' REF. CONTA N.'+T_pedidosCONTA.Value;

        T_estoqueSD_ANTERIOR.Value:= T_produtosSD_ATUAL.Value;
        T_estoqueENTRADAS.Value		:= 0;
        T_estoqueSAIDAS.Value			:= T_pedidosQTD.Value;
		    T_estoqueSD_ATUAL.value 	:=(T_estoqueSD_ANTERIOR.Value+T_estoqueENTRADAS.value)-T_estoqueSAIDAS.value;

	      T_estoqueCHV.Value 				:= '1';

	      T_produtos.Edit;
  	    T_produtosENTRADAS.Value	:= T_produtosENTRADAS.Value + T_estoqueENTRADAS.Value;
    	  T_produtosSAIDAS.Value 		:= T_produtosSAIDAS.Value + T_estoqueSAIDAS.Value;
 	    	T_produtosSD_ATUAL.Value	:= T_produtosENTRADAS.Value - T_produtosSAIDAS.Value;

	      T_produtos.Post;
		 		T_estoque.Post;
      end;
      T_pedidosCHV.Value := '1';
      T_pedidos.Post;
      T_pedidos.Last;
    end;
	end;
  CLOSE;
end;

procedure TF_comandas.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_pedidos.state in [dsInsert,dsEdit] then
		T_pedidos.Cancel;
	end;
  CLOSE;
end;

procedure TF_comandas.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_comandas.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_comandas);
end;

end.


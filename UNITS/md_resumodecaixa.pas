unit md_resumodecaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DateUtils,
  ComCtrls, ShellAPI, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client{, PrintDAT};


type
  TF_relatoriodecaixa = class(TForm)
    Label10: TLabel;
    dt_inicial: TDateTimePicker;
    Label12: TLabel;
    dt_final: TDateTimePicker;
    bt_selecionar: TBitBtn;
    DBText01: TDBText;
    DBText02: TDBText;
    DBText03: TDBText;
    DBText04: TDBText;
    DBText05: TDBText;
    DBText06: TDBText;
    DBText07: TDBText;
    DBText09: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBText15: TDBText;
    DBText12: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText11: TDBText;
    Label2: TLabel;
    Label_1: TLabel;
    Label_2: TLabel;
    Label1: TLabel;
    Label_3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label29: TLabel;
    DBText13: TDBText;
    Label11: TLabel;
    DBText14: TDBText;
    DBText21: TLabel;
    Grid_1: TDBGrid;
    bt_imprimir: TSpeedButton;
    bt_calculadora: TSpeedButton;
    bt_fechar: TSpeedButton;
    DBNavigator_1: TDBNavigator;
    ds_diarias: TDataSource;
    ds_resumo: TDataSource;
    ds_caixa: TDataSource;
    Query_1: TFDQuery;
    Query_2: TFDQuery;
    Query_3: TFDQuery;
    Query_4: TFDQuery;
    Query_3sumT_COMISSAO2: TFloatField;
    Query_3sumT_REPCXA2: TFloatField;
    Query_3sumT_DIF2: TFloatField;
    Query_3sumT_DESPESAS2: TFloatField;
    Query_3sumT_VALES2: TFloatField;
    Query_3sumT_VALETRANSPORTE2: TFloatField;
    Query_3sumT_COMISSAOT_REPCXAT_DIFT_DESPESAST_VALEST_VALETRANSPORTE2: TFloatField;
    Query_4FICHA2: TFDAutoIncField;
    Query_4CONTA2: TStringField;
    Query_4AP2: TStringField;
    Query_4TIPO2: TStringField;
    Query_4DS2: TSmallintField;
    Query_4DT_ENTRADA2: TDateField;
    Query_4DT_SAIDA2: TDateField;
    Query_4HR_ENTRADA2: TTimeField;
    Query_4HR_SAIDA2: TTimeField;
    Query_4RC_ENTRADA2: TStringField;
    Query_4RC_SAIDA2: TStringField;
    Query_4CX_ENTRADA2: TStringField;
    Query_4CX_SAIDA2: TStringField;
    Query_4HR_USO2: TTimeField;
    Query_4HR_FRANQUIA2: TTimeField;
    Query_4HR_EXCEDENTES2: TTimeField;
    Query_4VR_LOCACAO2: TFloatField;
    Query_4VR_HE2: TFloatField;
    Query_4VR_HORASEXCEDENTES2: TFloatField;
    Query_4VR_HORASUSO2: TFloatField;
    Query_4VR_PEDIDOS2: TFloatField;
    Query_4VR_EXTRAS2: TFloatField;
    Query_4VR_DESCONTO2: TFloatField;
    Query_4VR_TOTAL2: TFloatField;
    Query_4RC_CE2: TFloatField;
    Query_4RC_DE2: TFloatField;
    Query_4VR_ENTRADA2: TFloatField;
    Query_4RC_CS2: TFloatField;
    Query_4RC_DS2: TFloatField;
    Query_4VR_SAIDA2: TFloatField;
    Query_4RC_CARTAO2: TFloatField;
    Query_4RC_DINHEIRO2: TFloatField;
    Query_4VR_RECEBIDO2: TFloatField;
    Query_4VR_TROCO2: TFloatField;
    Query_4DF_TROCO2: TFloatField;
    Query_4CAIXA2: TStringField;
    Query_4CHECK_OUT2: TStringField;
    Query_4CHV2: TStringField;
    Query_1FICHA: TFDAutoIncField;
    Query_1CONTA: TStringField;
    Query_1AP: TStringField;
    Query_1TIPO: TStringField;
    Query_1DS: TSmallintField;
    Query_1DT_ENTRADA: TDateField;
    Query_1DT_SAIDA: TDateField;
    Query_1HR_ENTRADA: TTimeField;
    Query_1HR_SAIDA: TTimeField;
    Query_1RC_ENTRADA: TStringField;
    Query_1RC_SAIDA: TStringField;
    Query_1CX_ENTRADA: TStringField;
    Query_1CX_SAIDA: TStringField;
    Query_1HR_USO: TTimeField;
    Query_1HR_FRANQUIA: TTimeField;
    Query_1HR_EXCEDENTES: TTimeField;
    Query_1VR_LOCACAO: TFloatField;
    Query_1VR_HE: TFloatField;
    Query_1VR_HORASEXCEDENTES: TFloatField;
    Query_1VR_HORASUSO: TFloatField;
    Query_1VR_PEDIDOS: TFloatField;
    Query_1VR_EXTRAS: TFloatField;
    Query_1VR_DESCONTO: TFloatField;
    Query_1VR_TOTAL: TFloatField;
    Query_1RC_CE: TFloatField;
    Query_1RC_DE: TFloatField;
    Query_1VR_ENTRADA: TFloatField;
    Query_1RC_CS: TFloatField;
    Query_1RC_DS: TFloatField;
    Query_1VR_SAIDA: TFloatField;
    Query_1RC_CARTAO: TFloatField;
    Query_1RC_DINHEIRO: TFloatField;
    Query_1VR_RECEBIDO: TFloatField;
    Query_1VR_TROCO: TFloatField;
    Query_1DF_TROCO: TFloatField;
    Query_1CAIXA: TStringField;
    Query_1CHECK_OUT: TStringField;
    Query_1CHV: TStringField;
    Query_2sumVR_HORASUSO: TFloatField;
    Query_2sumVR_PEDIDOS: TFloatField;
    Query_2sumVR_EXTRAS: TFloatField;
    Query_2sumVR_DESCONTO: TFloatField;
    Query_2sumVR_TOTAL: TFloatField;
    Query_2sumRC_DINHEIRO: TFloatField;
    Query_2sumRC_CARTAO: TFloatField;
    Query_2SUMDF_TROCO: TFloatField;
    Query_2sumRC_DINHEIRODF_TROCORC_CARTAO: TFloatField;

    procedure FormShow(Sender: TObject);
    procedure atualiza_sql(Sender: TObject);
    procedure bt_fecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dt_finalExit(Sender: TObject);
    procedure bt_calculadoraClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_relatoriodecaixa: TF_relatoriodecaixa;
  t_liq,m_receitabruta,m_receitaliquida: Double;
  linha: WideString;
  n_dias: Integer;
	d1,d2: TDateTime;
  MyTXT: TextFile;

implementation

uses
  md_utilities, md_login, md_firedac;

{$R *.dfm}

procedure TF_relatoriodecaixa.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
   	F_relatoriodecaixa.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - RELATÓRIO FINANCEIRO';
    dt_inicial.Date :=(Now-DayOfTheMonth(Now)+1);
    dt_final.Date := IncMonth(Now)-DayOfTheMonth(Now);
    atualiza_sql(Sender);
    dt_inicial.SetFocus;
  end;
end;

procedure TF_relatoriodecaixa.atualiza_sql(Sender: TObject);
begin
  d1 := dt_inicial.Date;
  d2 := dt_final.Date;

  Query_1.ParamByName('dt_1').Value := d1;
  Query_1.ParamByName('dt_2').Value := d2;
  linha := 'select * from t_diarias where DT_ENTRADA between :dt_1 and :dt_2 and CHV = ''F'' order by CONTA ';
  Query_1.DisableControls;
  Query_1.Close;
  Query_1.SQL.text := linha;
  Query_1.Open;
  Query_1.EnableControls;

	if Query_1.Fields.Count > 0 then
  begin
    Query_2.ParamByName('dt_1').Value := d1;
    Query_2.ParamByName('dt_2').Value := d2;
    linha :=  'select sum(VR_HORASUSO),sum(VR_PEDIDOS),sum(VR_EXTRAS),sum(VR_DESCONTO),sum(VR_TOTAL),'+
              'sum(RC_DINHEIRO),sum(RC_CARTAO),SUM(DF_TROCO),sum((RC_DINHEIRO-DF_TROCO)+RC_CARTAO) from t_diarias '+
              'where DT_ENTRADA between :dt_1 and :dt_2 and CHV = ''F'' ';
    Query_2.DisableControls;
    Query_2.Close;
    Query_2.SQL.text := linha;
    Query_2.Open;
    Query_2.EnableControls;

    Query_3.ParamByName('dt_1').Value := d1;
    Query_3.ParamByName('dt_2').Value := d2;
    linha :=  'select sum(T_COMISSAO),sum(T_REPCXA),sum(T_DIF),sum(T_DESPESAS),sum(T_VALES),'+
    		  'sum(T_VALETRANSPORTE),sum(T_COMISSAO+T_REPCXA+T_DIF+T_DESPESAS+T_VALES+T_VALETRANSPORTE) from t_caixa '+
              'where ENTRADA between :dt_1 and :dt_2 and CHV = ''F'' ';
    Query_3.DisableControls;
    Query_3.Close;
    Query_3.SQL.text := linha;
    Query_3.Open;
    Query_3.EnableControls;

    Query_1.First; d1 := Query_1DT_ENTRADA.Value;
    Query_1.Last ; d2 := Query_1DT_SAIDA.Value;
    n_dias := DaysBetween(d1, d2);

    if n_dias > 0 then
    begin
      t_liq := DBText19.Field.AsFloat - DBText20.Field.AsFloat;
      DBText21.Caption := FloatToStrF(t_liq,ffCurrency,10,2);
	    m_receitabruta := DBText05.Field.AsFloat/n_dias;
	    m_receitaliquida := t_liq/n_dias;
    end else
    begin
	    m_receitabruta := 0;
	    m_receitaliquida := 0;
    end;
    Label_1.Caption := IntToStr(n_dias);
    Label_2.Caption := FloatToStrF(m_receitabruta,ffCurrency,10,2);
    Label_3.Caption := FloatToStrF(m_receitaliquida,ffCurrency,10,2);
  end else
  begin
	  ShowMessage('Não foram encontrados lançamentos no período informado');
    Exit;
  end;
end;

procedure TF_relatoriodecaixa.bt_fecharClick(Sender: TObject);
begin
  d1 := dt_inicial.Date;
	d2 := dt_final.Date;
  if F_login.IDC = 9 then
  begin
    if MsgDlg('Atenção! Deseja manter os registros do período de: '+#10#13+DateToStr(d1)+' A '+DateToStr(d2)+'? ', mtConfirmation, mbYesNo) <> mrYes then
    begin
			if MsgDlg('AVISO: Este procedimento irá REMOVER TODOS os registros selecionados! Continuar???', mtConfirmation, mbYesNo) = mrYes then
      begin
        Query_4.ParamByName('dt_1').Value := d1;
        Query_4.ParamByName('dt_2').Value := d2;

        // excluindo registros em T_diarias

        linha := 'delete from t_diarias where DT_ENTRADA between :dt_1 and :dt_2 and CHV = ''F'' ';
        Query_4.DisableControls;
        Query_4.Close;
        Query_4.SQL.text := linha;
        Query_4.ExecSQL;
        Query_4.EnableControls;

        // excluindo registros em T_pedidos

        linha := 'delete from T_pedidos where DH_LANCAMENTO between :dt_1 and :dt_2 and CHV = ''F'' ';
        Query_4.DisableControls;
        Query_4.Close;
        Query_4.SQL.text := linha;
        Query_4.ExecSQL;
        Query_4.EnableControls;

        // excluindo registros em T_caixa

        linha := 'delete from T_caixa where ENTRADA between :dt_1 and :dt_2 and CHV = ''F'' ';
        Query_4.DisableControls;
        Query_4.Close;
        Query_4.SQL.text := linha;
        Query_4.ExecSQL;
        Query_4.EnableControls;

        // excluindo registros em T_rouparia

        linha := 'delete from T_rouparia where DH_RETIRADA between :dt_1 and :dt_2 and CHV = ''F'' ';
        Query_4.DisableControls;
        Query_4.Close;
        Query_4.SQL.text := linha;
        Query_4.ExecSQL;
        Query_4.EnableControls;

        // excluindo registros em T_coletas

        linha := 'delete from T_coletas where DH_COLETA between :dt_1 and :dt_2 and CHV = ''F'' ';

        Query_4.DisableControls;
        Query_4.Close;
        Query_4.SQL.text := linha;
        Query_4.ExecSQL;
        Query_4.EnableControls;
      end;
    end;
	end;
  with dm_firedac do
  begin
    T_empresa.Close;
    T_usuarios.Close;
    T_apartamentos.Close;
    T_feriados.Close;
    T_fornecedores.Close;
    T_grupos.Close;
    T_produtos.Close;
    T_estoque.Close;
    T_diarias.Close;
    T_pedidos.Close;
    T_caixa.Close;
    T_rouparia.Close;
    T_coletas.Close;

    Connection_1.Connected := False;
    Connection_1.Connected := True;

    T_empresa.Open;
    T_usuarios.Open;
    T_apartamentos.Open;
    T_feriados.Open;
    T_fornecedores.Open;
    T_grupos.Open;
    T_produtos.Open;
    T_estoque.Open;
    T_diarias.Open;
    T_pedidos.Open;
    T_caixa.Open;
    T_rouparia.Open;
    T_coletas.Open;
	end;
	CLOSE;
end;

procedure TF_relatoriodecaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_relatoriodecaixa.dt_finalExit(Sender: TObject);
begin
	if dt_final.Date < dt_inicial.Date then
  begin
		ShowMessage('Atenção! Você deverá informar a DATA FINAL igual ou maior que a DATA INICIAL!');
    dt_inicial.SetFocus;
  end;
end;

procedure TF_relatoriodecaixa.bt_calculadoraClick(Sender: TObject);
var
  cmd,par,dir: array[0..79] of char;
begin
  try
    cmd := 'calc.exe';
    strpcopy(dir,GetCurrentDir);
    strpcopy(par,'');
    shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_hide);
  except
    ShowMessage('Não foi possível executar a Calculadora!');
  end;
end;

procedure TF_relatoriodecaixa.bt_imprimirClick(Sender: TObject);
var
  dt1,dt2,lb1,lb2,lb3,
	x01,x02,x03,x04,x05,x06,x07,x09,x10,x11,
  x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,
  cb1,cb2,cb3: string;

  procedure impressao_resumodecaixa;
  begin
    with dm_firedac do
    begin
      // variáveis de impressão
		  d1 := dt_inicial.Date;
			d2 := dt_final.Date;

      cb1 := T_empresaEMPRESA.Value;
      cb2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      cb3 := 'CONTROLE DE DIARIAS - v7.0';

      dt1	:= DateToStr(d1); // DATA INICIAL
      dt2	:= DateToStr(d2); // DATA FINAL

//    Copy(FloatToStrF(x,ffCurrency,10,2),3,7); x14 := Insert_L(x14,7,#32);

      x01 := Copy(FloatToStrF(DBText01.Field.AsFloat,ffCurrency,13,2),3,10); x01 := Insert_L(x01,10,#32);
      x02 := Copy(FloatToStrF(DBText02.Field.AsFloat,ffCurrency,13,2),3,10); x02 := Insert_L(x02,10,#32);
      x03 := Copy(FloatToStrF(DBText03.Field.AsFloat,ffCurrency,13,2),3,10); x03 := Insert_L(x03,10,#32);
      x04 := Copy(FloatToStrF(DBText04.Field.AsFloat,ffCurrency,13,2),3,10); x04 := Insert_L(x04,10,#32);
      x05 := Copy(FloatToStrF(DBText05.Field.AsFloat,ffCurrency,13,2),3,10); x05 := Insert_L(x05,10,#32);
      x06 := Copy(FloatToStrF(DBText06.Field.AsFloat,ffCurrency,13,2),3,10); x06 := Insert_L(x06,10,#32);
      x07 := Copy(FloatToStrF(DBText07.Field.AsFloat,ffCurrency,13,2),3,10); x07 := Insert_L(x07,10,#32);
      x09 := Copy(FloatToStrF(DBText09.Field.AsFloat,ffCurrency,13,2),3,10); x09 := Insert_L(x09,10,#32);
      x11 := Copy(FloatToStrF(DBText11.Field.AsFloat,ffCurrency,13,2),3,10); x11 := Insert_L(x11,10,#32);
      x12 := Copy(FloatToStrF(DBText12.Field.AsFloat,ffCurrency,13,2),3,10); x12 := Insert_L(x12,10,#32);
      x13 := Copy(FloatToStrF(DBText13.Field.AsFloat,ffCurrency,13,2),3,10); x13 := Insert_L(x13,10,#32);
      x14 := Copy(FloatToStrF(DBText14.Field.AsFloat,ffCurrency,13,2),3,10); x14 := Insert_L(x14,10,#32);
      x15 := Copy(FloatToStrF(DBText15.Field.AsFloat,ffCurrency,13,2),3,10); x15 := Insert_L(x15,10,#32);
      x16 := Copy(FloatToStrF(DBText16.Field.AsFloat,ffCurrency,13,2),3,10); x16 := Insert_L(x16,10,#32);
      x17 := Copy(FloatToStrF(DBText17.Field.AsFloat,ffCurrency,13,2),3,10); x17 := Insert_L(x17,10,#32);
      x18 := Copy(FloatToStrF(DBText18.Field.AsFloat,ffCurrency,13,2),3,10); x18 := Insert_L(x18,10,#32);
      x19 := Copy(FloatToStrF(DBText19.Field.AsFloat,ffCurrency,13,2),3,10); x19 := Insert_L(x19,10,#32);
      x20 := Copy(FloatToStrF(DBText20.Field.AsFloat,ffCurrency,13,2),3,10); x20 := Insert_L(x20,10,#32);

      x21 := Copy(DBText21.Caption,3,10); x21 := Insert_L(x21,10,#32);

      lb1 := Trim(Copy(Label_1.Caption,1,2)); // Nº DE DIAS APURADOS
      lb2 := Copy(Label_2.Caption,3,10); lb2:= Insert_L(lb2,10,#32); // MÉDIA BRUTA P/ DIA
      lb3 := Copy(Label_3.Caption,3,10); lb3:= Insert_L(lb3,10,#32); // MÉDIA LÍQUIDA P/ DIA

      Writeln(MyTXT,cb1); Writeln(MyTXT,cb2); Writeln(MyTXT,cb3);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'EXTRATO-PERIODO DE: '+dt1+' A '+dt2);
      Writeln(MyTXT,'============================================');
//                                                     1234567890
      Writeln(MyTXT,'TOTAL HORAS/PERNOITES/DIARIAS    +'+x01);
      Writeln(MyTXT,'TOTAL PEDIDOS                    +'+x02);
      Writeln(MyTXT,'TOTAL EXTRAS                     +'+x03);
      Writeln(MyTXT,'TOTAL DESCONTOS                  +'+x04);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL BRUTO                      ='+x05);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'RECEBIDO EM CARTAO               +'+x06);
      Writeln(MyTXT,'RECEBIDO EM DINHEIRO             +'+x07);
      Writeln(MyTXT,'TROCO DEVOLVIDO                  -'+x09);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL LIQUIDO RECEBIDO           ='+x11);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'COMISSOES PAGAS                  -'+x12);
      Writeln(MyTXT,'REPOSIÇÃO DE CAIXA               -'+x13);
      Writeln(MyTXT,'DIFERENÇA DE TROCO               -'+x14);
      Writeln(MyTXT,'COMPRAS/OUTRAS DESPESAS          -'+x15);
      Writeln(MyTXT,'VALES FUNCIONARIOS               -'+x16);
      Writeln(MyTXT,'VALE-TRANSPORTE                  -'+x17);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL DAS DESPESAS               ='+x18);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'RESUMO ('+dt1+' A '+dt2+') ');
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'NUMERO DE DIAS APURADOS: '+lb1+' DIAS');
      Writeln(MyTXT,'TOTAL LIQUIDO RECEBIDO           +'+x19);
      Writeln(MyTXT,'TOTAL DAS DESPESAS               -'+x20);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL LIQ.ENVIADO                ='+x21);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'RECEITA BRUTA/DIA               ->'+lb2);
      Writeln(MyTXT,'RECEITA LIQUIDA/DIA             ->'+lb3);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
  //  Writeln(MyTXT,#12); // ejeta a página
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');

      // fim de impressão
    end;
  end;

begin
  dt1 := DateToStr(dt_inicial.Date);
  dt2 := DateToStr(dt_final.Date)  ;
	if MsgDlg('Imprimir resumo ref. período de '+dt1+' a '+dt2+'??? ', mtConfirmation, mbYesNo) = mrYes then
  with dm_firedac do
  begin
    case T_empresaSAIDA_I.Value of
    1,5:{if MsgDlg('IMPRIMIR ESTE CAIXA?', mtConfirmation, mbYesNo) <> mrYes then EXIT else }
        begin
          // imprime em Arquivo
          AssignFile(MyTXT,T_empresaPATH_1.AsString+
          'EXTRATO '+Copy(dt1,1,2)+Copy(dt1,4,2)+Copy(dt1,7,4)+' A '+Copy(dt2,1,2)+Copy(dt2,4,2)+Copy(dt2,7,4)+'.TXT');
          Rewrite(MyTXT);
          impressao_resumodecaixa;
          CloseFile(MyTXT);
          // imprime em Generic Text Only
          if T_empresaSAIDA_I.Value = 5 then
          begin
            AssignFile(MyTXT,'LPT1');
            Rewrite(MyTXT);
	          impressao_resumodecaixa;
            CloseFile(MyTXT);
          end;
        end;
    7:  {PdtPrintDAT1.Print;}
    end;
  end;
end;

end.

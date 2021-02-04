unit md_fechamentodeponto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, DBCtrls, DB, Buttons, Printers, ExtCtrls, ShellAPI,
  Grids, DBGrids, ComCtrls, md_utilities,
  Gauges, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_fechamentodeponto = class(TForm)
    Label4: TLabel;
    ed_saida: TDBEdit;
    Label5: TLabel;
    ed_recepcao: TDBEdit;
    Label29: TLabel;
    ed_caixa: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ed_trocorecebido: TDBEdit;
    ed_trocodeixado: TDBEdit;
    ed_reposicaocaixa: TDBEdit;
    ed_despesas: TDBEdit;
    ed_vales: TDBEdit;
    ed_liquidoenviado: TDBEdit;
    ed_dinheiro: TDBEdit;
    ed_cartao: TDBEdit;
    ed_totalrecebido: TDBEdit;
    PageControl_1: TPageControl;
    TabSheet_1: TTabSheet;
    Label1: TLabel;
    ed_entrada: TDBEdit;
    ed_comissao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_metavendas: TDBEdit;
    ed_vrbruto: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ed_valetransporte: TDBEdit;
    Label10: TLabel;
    Bevel1: TBevel;
    ed_dif: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Bevel2: TBevel;
    Label_11: TLabel;
    Gauge_1: TGauge;
    bt_calculadora: TSpeedButton;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    ds_diarias: TDataSource;
    ds_caixa: TDataSource;
    query_diarias: TFDQuery;
    query_resumo: TFDQuery;
    Query_T1: TFDQuery;
    Query_T2: TFDQuery;
    Query_T3: TFDQuery;
    query_diariasFICHA: TFDAutoIncField;
    query_diariasCONTA: TStringField;
    query_diariasAP: TStringField;
    query_diariasTIPO: TStringField;
    query_diariasDS: TSmallintField;
    query_diariasDT_ENTRADA: TDateField;
    query_diariasDT_SAIDA: TDateField;
    query_diariasHR_ENTRADA: TTimeField;
    query_diariasHR_SAIDA: TTimeField;
    query_diariasRC_ENTRADA: TStringField;
    query_diariasRC_SAIDA: TStringField;
    query_diariasCX_ENTRADA: TStringField;
    query_diariasCX_SAIDA: TStringField;
    query_diariasHR_USO: TTimeField;
    query_diariasHR_FRANQUIA: TTimeField;
    query_diariasHR_EXCEDENTES: TTimeField;
    query_diariasVR_LOCACAO: TFloatField;
    query_diariasVR_HE: TFloatField;
    query_diariasVR_HORASEXCEDENTES: TFloatField;
    query_diariasVR_HORASUSO: TFloatField;
    query_diariasVR_PEDIDOS: TFloatField;
    query_diariasVR_EXTRAS: TFloatField;
    query_diariasVR_DESCONTO: TFloatField;
    query_diariasVR_TOTAL: TFloatField;
    query_diariasRC_CE: TFloatField;
    query_diariasRC_DE: TFloatField;
    query_diariasVR_ENTRADA: TFloatField;
    query_diariasRC_CS: TFloatField;
    query_diariasRC_DS: TFloatField;
    query_diariasVR_SAIDA: TFloatField;
    query_diariasRC_CARTAO: TFloatField;
    query_diariasRC_DINHEIRO: TFloatField;
    query_diariasVR_RECEBIDO: TFloatField;
    query_diariasVR_TROCO: TFloatField;
    query_diariasDF_TROCO: TFloatField;
    query_diariasCAIXA: TStringField;
    query_diariasCHECK_OUT: TStringField;
    query_diariasCHV: TStringField;
    Grid_1: TDBGrid;
    query_diariasVR_LIQ: TCurrencyField;

    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure atualiza_saldoliquido(Sender: TObject);
    procedure ed_trocodeixadoExit(Sender: TObject);
    procedure Grid_1DblClick(Sender: TObject);
    procedure bt_calculadoraClick(Sender: TObject);
    procedure query_diariasCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_fechamentodeponto: TF_fechamentodeponto;

  vr_cartao,vr_dinheiro,total_recebido,
	vr_meta,vr_bruto,taxa_comissao,vr_comissao,sobra,
  vr_trocodecaixa: Double;
	linha, chv: string;

implementation

uses
 md_diarias, md_detalhesdaconta, md_login, md_firedac;

{$R *.dfm}

procedure TF_fechamentodeponto.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
   	F_fechamentodeponto.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - FECHAR TURNO';
    chv := T_caixaCAIXA.Value;
    vr_cartao := 0; vr_dinheiro := 0; total_recebido := 0; vr_bruto := 0; vr_comissao:= 0;
    TabSheet_1.Caption := 'CAIXA Nº '+chv;

{   anotação:
    query_diarias.Params.ParamByName(chv).Value := T_caixaCAIXA.AsString;
    select * from t_diarias
    where CX_ENTRADA = :chv or CX_SAIDA = :chv
    order by CONTA  }

  	linha := 'SELECT * FROM t_diarias WHERE CX_ENTRADA = '+chv+' or CX_SAIDA = '+chv+' ORDER BY CONTA ';

    query_diarias.DisableControls;
    query_diarias.close;
    query_diarias.SQL.text := linha;
    query_diarias.Open;
    query_diarias.EnableControls;

    Grid_1.Refresh;

//  soma valores recebidos de contas abertas no turno anterior

    linha := 'SELECT sum(RC_CS),sum(RC_DS),sum(VR_TROCO) FROM t_diarias WHERE CX_ENTRADA <> '+chv+' AND CX_SAIDA = '+chv+' AND CHV = ''F'' ';

    Query_T1.DisableControls;
    Query_T1.close;
    Query_T1.SQL.text := linha;
    Query_T1.Open;
    Query_T1.EnableControls;

    if Query_T1.Fields[0].value <> NULL then vr_cartao   := vr_cartao + Query_T1.Fields[0].Value;
    if Query_T1.Fields[1].value <> NULL then vr_dinheiro := (vr_dinheiro + Query_T1.Fields[1].Value)-Query_T1.Fields[2].Value;

    // soma valores recebidos de contas abertas e fechadas no turno atual

    linha := 'SELECT sum(RC_CE),sum(RC_DE),sum(RC_CS),sum(RC_DS),sum(VR_TROCO) FROM t_diarias WHERE CX_ENTRADA = '+chv+' AND CX_SAIDA = '+chv+' AND CHV = ''F'' ';

    Query_T2.DisableControls;
    Query_T2.close;
    Query_T2.SQL.text := linha;
    Query_T2.Open;
    Query_T2.EnableControls;

    if Query_T2.Fields[0].value <> NULL then vr_cartao   := vr_cartao + Query_T2.Fields[0].Value;
    if Query_T2.Fields[1].value <> NULL then vr_dinheiro := vr_dinheiro + Query_T2.Fields[1].Value;
    if Query_T2.Fields[2].value <> NULL then vr_cartao   := vr_cartao + Query_T2.Fields[2].Value;
    if Query_T2.Fields[3].value <> NULL then vr_dinheiro :=(vr_dinheiro + Query_T2.Fields[3].Value)-Query_T2.Fields[4].Value;

    { apura valores recebidos de contas abertas meste turno que passam para o próximo turno }

    linha := 'SELECT sum(RC_CE),sum(RC_DE) FROM t_diarias WHERE CX_ENTRADA = '+chv+' AND CHV = ''A'' ';

    Query_T3.DisableControls;
    Query_T3.Close;
    Query_T3.SQL.text := linha;
    Query_T3.Open;
    Query_T3.EnableControls;

    if Query_T3.Fields[0].Value <> NULL then vr_cartao   := vr_cartao + Query_T3.Fields[0].Value;
    if Query_T3.Fields[1].Value <> NULL then vr_dinheiro := vr_dinheiro + Query_T3.Fields[1].Value;

    total_recebido := vr_dinheiro + vr_cartao;
{
    linha := 'SELECT sum(VR_TOTAL) FROM t_diarias WHERE CX_ENTRADA = '+chv+' or CX_SAIDA = '+chv+' ';

    Query_T1.DisableControls;
    Query_T1.close;
    Query_T1.SQL.text := linha;
    Query_T1.ExecSQL;
    Query_T1.EnableControls;

    if Query_T1.Fields[0].Value <> null then vr_bruto := Query_T1.Fields[0].Value;
}

    vr_bruto := total_recebido;

    linha :=
    'SELECT sum(VR_HORASUSO),sum(VR_HORASEXCEDENTES),sum(VR_PEDIDOS),sum(VR_EXTRAS),sum(VR_DESCONTO),sum(VR_TOTAL),sum(RC_CARTAO),sum(RC_DINHEIRO),sum(VR_RECEBIDO),sum(DF_TROCO) '+
    'FROM t_diarias WHERE CX_ENTRADA = '+chv+' or CX_SAIDA = '+chv;

    query_resumo.DisableControls;
    query_resumo.Close;
    query_resumo.SQL.text := linha;
    query_resumo.Open;
    query_resumo.EnableControls;    T_caixa.EDIT;

    if T_caixaCHV.Value = 'A' then
    begin
      T_caixaSAIDA.value	:= Now();
      if T_caixaT_CXAREC.Value <> NULL then
      T_caixaT_CXADEIXADO.Value := T_caixaT_CXAREC.Value;
      T_caixaT_DIARIAS.Value := 0;
      T_caixaT_PEDIDOS.Value := 0;
      T_caixaT_EXTRAS.Value  := 0;
    end;

    T_caixaT_META.Value := T_empresaVR_MINIMO.Value;
    T_caixaT_BRUTO.Value := vr_bruto;

    if query_resumo.Fields[0].Value <> NULL then T_caixaT_DIARIAS.Value   := query_resumo.Fields[0].Value;
    if query_resumo.Fields[1].Value <> NULL then T_caixaT_DIARIAS.Value   := T_caixaT_DIARIAS.Value + query_resumo.Fields[1].Value;
    if query_resumo.Fields[2].Value <> NULL then T_caixaT_PEDIDOS.Value   := query_resumo.Fields[2].Value else T_caixaT_PEDIDOS.Value := 0;
    if query_resumo.Fields[3].Value <> NULL then T_caixaT_EXTRAS.Value    := query_resumo.Fields[3].Value else T_caixaT_EXTRAS.Value := 0;
    if query_resumo.Fields[4].Value <> NULL then T_caixaT_DESCONTOS.Value := query_resumo.Fields[4].Value else T_caixaT_DESCONTOS.Value := 0;
    if query_resumo.Fields[6].Value <> NULL then T_caixaT_DINHEIRO.Value 	:= vr_dinheiro;
    if query_resumo.Fields[7].Value <> NULL then T_caixaT_CARTAO.Value   	:= vr_cartao;
    if query_resumo.Fields[8].Value <> NULL then T_caixaT_RECEBIDO.Value 	:= total_recebido;

//  if query_resumo.Fields[9].Value <> NULL then T_caixaT_DIF.Value       := query_resumo.Fields[9].Value else T_caixaT_DIF.Value := 0;

    vr_meta := T_empresaVR_MINIMO.Value;
    taxa_comissao := T_empresaTXA_CM.Value/100;
    vr_comissao := 0;

    if vr_bruto >= vr_meta then
    begin
      vr_comissao := vr_bruto * taxa_comissao;
      sobra := vr_comissao - trunc(vr_bruto * taxa_comissao);
      if sobra >= 0.50 then
      vr_comissao :=(trunc(vr_comissao)+1) else
      vr_comissao := trunc(vr_comissao);
      T_caixaT_COMISSAO.Value := vr_comissao;
    end else
    T_caixaT_COMISSAO.Value := 0;
	end;
  Label_11.Caption  := 'Fechamento de caixa/Conferência/Lançamentos';
  Gauge_1.Progress  := 0;
  PageControl_1.ActivePage := TabSheet_1; Grid_1.Refresh;
  ed_trocodeixado.SetFocus;
end;

procedure TF_fechamentodeponto.ed_trocodeixadoExit(Sender: TObject);
begin
  if ds_caixa.State in [dsEdit,dsInsert] then
  with dm_firedac do
  begin
    if T_caixaT_CXADEIXADO.Value > T_caixaT_CXAREC.Value then
    T_caixaT_REPCXA.Value := T_caixaT_CXADEIXADO.Value - T_caixaT_CXAREC.Value else
    T_caixaT_REPCXA.Value := 0;
  end;
  Label_11.Caption  := 'Troco de Caixa/Reposição...';
  Gauge_1.Progress  := 10;
end;

procedure TF_fechamentodeponto.atualiza_saldoliquido(Sender: TObject);
begin
  if ds_caixa.State in [dsEdit,dsInsert] then
	with dm_firedac do
  begin
    T_caixaT_LIQENV.Value := T_caixaT_DINHEIRO.Value - (T_caixaT_COMISSAO.Value +
    T_caixaT_REPCXA.Value + T_caixaT_DIF.Value + T_caixaT_DESPESAS.Value + T_caixaT_VALES.Value +
    T_caixaT_VALETRANSPORTE.Value);

    vr_trocodecaixa := T_caixaT_CXADEIXADO.Value;
    if T_caixaT_LIQENV.Value < 0 then
    begin
      T_caixaT_CXADEIXADO.Value := T_caixaT_CXADEIXADO.Value + T_caixaT_LIQENV.Value;
      T_caixaT_LIQENV.Value := 0;
    end else
    T_caixaT_CXADEIXADO.Value :=  vr_trocodecaixa;
		T_caixaT_REC.Value := 0;
  end;
  Label_11.Caption  := 'Atualizando saldo líquido a enviar...';
  Gauge_1.Progress  := 20;
end;

procedure TF_fechamentodeponto.bt_okClick(Sender: TObject);
var
  F,anexo,bkp: string;
begin
  if MsgDlg('Atenção! Confirma fechamento deste Caixa?', mtConfirmation, mbYesNo) = mrYes then
  with dm_firedac do
  begin
    Label_11.Caption  := 'Imprimindo caixa...';
    Gauge_1.Progress  := 30;

    case T_empresaSAIDA_I.Value of
    1,5:F_diarias.processo(20);
//  2:F_impresso_resumodecaixa.Print;
//  3:if mensagem_1('Imprimir Resumo de Caixa?') = SIM then F_impresso_resumodecaixa.Print;
//  4:F_impresso_resumodecaixa.Preview;
    end;

    if (T_caixaCHV.Value = 'A') and (T_caixaENVIO_OK.Value = '0') then
    begin
      Label_11.Caption  := 'Enviando arquivo...';
      Gauge_1.Progress  := 40;

      try
        F := 'CAIXA-'+T_caixaCAIXA.AsString+'.TXT'; anexo := Trim(T_empresaPATH_1.AsString+F);
        { método de envio por HTTP ativado }
        if (T_empresaENVIO_HTTP.AsString = '1') and (FileExists(anexo)) then
        SendFile_HTTP(anexo);
      except
        on e:exception do ShowMessage('Erro no envio do arquivo! Detalhes: '+e.Message);
      end;

      if T_empresaENVIO_BACKUP.AsString = '1' then
      begin
        Label_11.Caption  := 'Atualizando o Backup (cópia de segurança)...';
        Gauge_1.Progress  := 50;
        { inserir aqui diretiva de atualização do Backup - DB }
        try
          cmd := 'backup.bat';
          strpcopy(dir,GetCurrentDir);
          strpcopy(par,'');
          shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_hide);
        finally
          ShowMessage('Arquivo de Backup atualizado com sucesso!');
        end;
        Label_11.Caption  := 'Aguarde um momento! Enviando arquivo de Backup...';
        Gauge_1.Progress  := 70;
        try
          bkp := T_empresaPATH_APLICACAO.AsString+'backup\mybackup.sql';
          if (T_empresaENVIO_BACKUP.AsString = '1') and (FileExists(bkp)) then
          SendBKP_HTTP(bkp);
        finally
          Label_11.Caption  := 'Backup enviado com sucesso!';
          Gauge_1.Progress  := 90;
        end;
      end;

    end;

    Label_11.Caption  := 'Finalizando processo...';
    Gauge_1.Progress  := 99;

    T_caixa.Edit;
    T_caixaENVIO_OK.Value := '1';
    T_caixaENVIO_DT.Value := Now;
    T_caixaCHV.value := 'F';

    if T_caixa.State in [dsEdit,dsInsert] then T_caixa.POST;
    Gauge_1.Progress  := 100;
  end else
  begin
    if ds_caixa.State in [dsEdit,dsInsert] then
    dm_firedac.T_caixa.Cancel;
  end;
  CLOSE;
end;

procedure TF_fechamentodeponto.bt_cancelarClick(Sender: TObject);
begin
  if ds_caixa.State in [dsEdit,dsInsert] then
  dm_firedac.T_caixa.Cancel;
  CLOSE;
end;

procedure TF_fechamentodeponto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_fechamentodeponto.Grid_1DblClick(Sender: TObject);
begin
//  F_detalhesdaconta.chv := F_database.T_diariasCONTA.AsString;
  ShowModalForm(TF_detalhesdaconta, F_detalhesdaconta);
end;

procedure TF_fechamentodeponto.query_diariasCalcFields(DataSet: TDataSet);
begin
  query_diariasVR_LIQ.Value := query_diariasVR_RECEBIDO.Value - query_diariasDF_TROCO.Value;
end;

procedure TF_fechamentodeponto.bt_calculadoraClick(Sender: TObject);
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

procedure TF_fechamentodeponto.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_fechamentodeponto);
end;

end.


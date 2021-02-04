unit md_coletas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_coletas = class(TForm)
    Label1: TLabel;
    Label_1: TLabel;
    Label2: TLabel;
    ed_data: TDBEdit;
    Grid_1: TDBGrid;
    Label3: TLabel;
    ed_LC: TDBEdit;
    Label4: TLabel;
    ed_FR: TDBEdit;
    Label5: TLabel;
    ed_TB: TDBEdit;
    Label6: TLabel;
    ed_TR: TDBEdit;
    Label7: TLabel;
    ed_TP: TDBEdit;
    Label9: TLabel;
    ed_EC: TDBEdit;
    Label10: TLabel;
    ed_recepcao: TDBEdit;
    bt_conferir: TBitBtn;
    bt_romaneio: TBitBtn;
    DBNavigator_1: TDBNavigator;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    Query_T1: TFDQuery;
    ds_rouparia: TDataSource;
    ds_coletas: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure bt_conferirClick(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_romaneioClick(Sender: TObject);
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
  F_coletas: TF_coletas;

  linha,chv: string;
  ctd,x,y,pag: integer;

implementation

uses
  md_utilities, md_login, md_firedac;

{$R *.dfm}

procedure TF_coletas.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
  	F_coletas.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CONTROLE DE COLETAS (LAVANDERIA)';
		T_coletas.Last;

    chv := trim(IntToStr(T_coletasFICHA.value+1)); while length(chv) < 6 do chv := '0'+ chv;
		Label_1.caption := chv;

    T_coletas.INSERT;
    T_coletasCOLETA.value    := chv;
    T_coletasDH_COLETA.Value := Now();
    T_coletasRECEPCAO.value  := F_login.USR;
    T_coletasLC.value        := 0;
    T_coletasFR.value        := 0;
    T_coletasTB.value        := 0;
    T_coletasTR.value        := 0;
    T_coletasTP.value        := 0;
    T_coletasEC.value        := 0;
    T_coletasCHV.value       := 'C';
  end;
  bt_OK.Enabled := FALSE;
  bt_conferir.SetFocus;
end;

procedure TF_coletas.bt_conferirClick(Sender: TObject);
begin
	linha := 'select sum(LC),sum(FR),sum(TB),sum(TP),sum(TR),sum(EC) from t_rouparia where CHV = ''S'' ';

	with dm_firedac do
  begin
    Query_T1.DisableControls;
    Query_T1.Close;
    Query_T1.SQL.text := linha;
    Query_T1.Open;
    Query_T1.EnableControls;
  end;

  with dm_firedac do
  begin
    if T_coletas.state in [dsInsert,dsEdit] then
    begin
      if Query_T1.Fields[0].value = NULL then T_coletasLC.value := 0 else T_coletasLC.value  := Query_T1.Fields[0].value;
      if Query_T1.Fields[1].value = NULL then T_coletasFR.value := 0 else T_coletasFR.value  := Query_T1.Fields[1].value;
      if Query_T1.Fields[2].value = NULL then T_coletasTB.value := 0 else T_coletasTB.value  := Query_T1.Fields[2].value;
      if Query_T1.Fields[3].value = NULL then T_coletasTP.value := 0 else T_coletasTP.value  := Query_T1.Fields[3].value;
      if Query_T1.Fields[4].value = NULL then T_coletasTR.value := 0 else T_coletasTR.value  := Query_T1.Fields[4].value;
      if Query_T1.Fields[5].value = NULL then T_coletasEC.value := 0 else T_coletasEC.value  := Query_T1.Fields[5].value;
    end;
  end;
  bt_ok.Enabled := TRUE;
end;

procedure TF_coletas.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
    ctd := T_coletasLC.asInteger+T_coletasFR.asInteger+T_coletasTB.asInteger+
           T_coletasTP.asInteger+T_coletasTR.asInteger+T_coletasEC.asInteger;

    if ctd = 0 then
    begin
      ShowMessage('NÃO HÁ ROUPAS SUJAS PARA COLETAR');
      if T_coletas.state in [dsInsert,dsEdit] then T_coletas.CANCEL;
      bt_ok.Enabled := FALSE;
      bt_cancelar.SetFocus;
      EXIT;
    end else
    begin
      if T_rouparia.RecordCount = 0 then
      begin
        ShowMessage('Arquivo não contém dados!');
        EXIT;
      end else
      begin
        chv := T_coletasCOLETA.asString;
				linha := 'update t_rouparia set CHV = ''C'', COLETA = '+chv+' where CHV = ''S'' ';

        Query_T1.DisableControls;
        Query_T1.Close;
        Query_T1.SQL.text := linha;
        Query_T1.ExecSQL;
        Query_T1.EnableControls;
	    end;
  	end;
		if T_coletas.state in [dsInsert,dsEdit] then
  	T_coletas.ApplyUpdates;
  	CLOSE;
	end;
end;

procedure TF_coletas.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_coletas.state in [dsInsert,dsEdit] then
		T_coletas.CancelUpdates;
  end;
  CLOSE;
end;

procedure TF_coletas.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_coletas.bt_romaneioClick(Sender: TObject);
begin
	with dm_firedac do
  begin
    case T_empresaSAIDA_I.Value of
    1,5: ShowMessage('Impressão não disponível. Este módulo está em revisão!');
    end;
  end;
end;

procedure TF_coletas.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_coletas);
end;

end.

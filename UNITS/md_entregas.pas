unit md_entregas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls,
  Buttons, Mask;

type
  TF_entregas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ed_data: TDBEdit;
    Label4: TLabel;
    ed_recepcao: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Grid_2: TDBGrid;
    ed_coleta: TDBEdit;
    cf_LC: TDBEdit;
    cf_FR: TDBEdit;
    cf_TB: TDBEdit;
    cf_TP: TDBEdit;
    cf_TR: TDBEdit;
    cf_EC: TDBEdit;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    ds_coletas: TDataSource;
    DBNavigator_1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure cf_ECExit(Sender: TObject);
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
  F_entregas: TF_entregas;

  chv: string ;
  x,y,pag: integer;

implementation

uses
  md_login, md_utilities, md_firedac;

{$R *.dfm}

procedure TF_entregas.FormShow(Sender: TObject);
var
  LC,FR,TB,TR,TP,EC: Integer;
begin
	with dm_firedac do
  begin
  	F_entregas.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - ENTREGAS DA LAVANDERIA';
		T_coletas.LAST;

    chv := T_coletasCOLETA.value;
    LC  := T_coletasLC.AsInteger;
    FR  := T_coletasFR.AsInteger;
    TB  := T_coletasTB.AsInteger;
    TP  := T_coletasTP.AsInteger;
    TR  := T_coletasTR.AsInteger;
    EC  := T_coletasEC.AsInteger;

    T_coletas.INSERT;
    T_coletasCOLETA.value    := chv;
		T_coletasDH_COLETA.Value := Now();
    T_coletasRECEPCAO.value  := F_login.USR;
    T_coletasLC.value        := LC;
    T_coletasFR.value        := FR;
    T_coletasTB.value        := TB;
    T_coletasTP.value        := TP;
    T_coletasTR.value        := TR;
    T_coletasEC.value        := EC;
    T_coletasCHV.value       := 'E';
  end;
  bt_OK.Enabled := FALSE;
  cf_LC.SetFocus;
end;

procedure TF_entregas.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_entregas.cf_ECExit(Sender: TObject);
begin
  bt_OK.Enabled := TRUE;
end;

procedure TF_entregas.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_coletas.state in [dsInsert,dsEdit] then
		T_coletas.ApplyUpdates;
  end;
  CLOSE;
end;

procedure TF_entregas.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_coletas.state in [dsInsert,dsEdit] then
		T_coletas.CancelUpdates;
  end;
  CLOSE;
end;

procedure TF_entregas.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_entregas);
end;

end.

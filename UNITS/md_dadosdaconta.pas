unit md_dadosdaconta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TF_dadosdaconta = class(TForm)
    Label2: TLabel;
    ed_conta: TDBEdit;
    Label1: TLabel;
    ed_apto: TDBEdit;
    Label4: TLabel;
    ed_chv: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    ed_tipo: TDBEdit;
    ed_dtentrada: TDBEdit;
    ed_hrentrada: TDBEdit;
    ed_dtsaida: TDBEdit;
    ed_hrsaida: TDBEdit;
    Label3: TLabel;
    Label_HU: TStaticText;
    Label25: TLabel;
    ed_totalhorasuso: TDBEdit;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    Timer_HU: TTimer;
    bt_fechar: TBitBtn;
    ds_diarias: TDataSource;
    ds_pedidos: TDataSource;
    procedure Timer_HUTimer(Sender: TObject);
    procedure bt_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_dadosdaconta: TF_dadosdaconta;

implementation

{$R *.dfm}

uses md_firedac;

procedure TF_dadosdaconta.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_dadosdaconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - DADOS DA CONTA';
    bt_fechar.SetFocus;
  end;
end;

procedure TF_dadosdaconta.Timer_HUTimer(Sender: TObject);
begin
  with dm_firedac do
  begin
    if T_diariasCHV.value = 'A' then
    Label_HU.Caption := TimeToSTR(Now()-T_diariasHR_ENTRADA.Value) else
    if (T_diariasCHV.value = 'F') and (T_apartamentosCHV_D.Value = 'EM ARRUMAÇÃO') then
    Label_HU.Caption := TimeToSTR(Now()-T_diariasHR_SAIDA.Value) else
    if (T_diariasCHV.value = 'F') and (T_apartamentosCHV_D.Value = 'LIVRE') then
    Label_HU.Caption := '00:00:00';
  end;
end;

procedure TF_dadosdaconta.bt_fecharClick(Sender: TObject);
begin
  CLOSE;
end;

end.

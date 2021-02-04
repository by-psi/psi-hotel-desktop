unit md_detalhesdaconta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, Db, DBCtrls, DBGrids;

type
  TF_detalhesdaconta = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Bevel4: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    ed_caixa: TDBEdit;
    ed_conta: TDBEdit;
    ed_apto: TDBEdit;
    ed_tipo: TDBEdit;
    ed_vrlocacao: TDBEdit;
    ed_aptoliberado: TDBEdit;
    ed_situacao: TDBEdit;
    ed_dtentrada: TDBEdit;
    ed_hrentrada: TDBEdit;
    ed_recepcaoentrada: TDBEdit;
    ed_cxentrada: TDBEdit;
    ed_vrcartaoentrada: TDBEdit;
    ed_vrdinheiroentrada: TDBEdit;
    ed_vrrecebidoentrada: TDBEdit;
    ed_dtsaida: TDBEdit;
    ed_hrsaida: TDBEdit;
    ed_recepcaosaida: TDBEdit;
    ed_cxsaida: TDBEdit;
    ed_vrcartaosaida: TDBEdit;
    ed_vrdinheirosaida: TDBEdit;
    ed_vrrecebidosaida: TDBEdit;
    ed_horasuso: TDBEdit;
    ed_horasfranquia: TDBEdit;
    ed_vrhorasuso: TDBEdit;
    ed_vrpedidos: TDBEdit;
    ed_totalreccartao: TDBEdit;
    ed_vrdesconto: TDBEdit;
    ed_horasexcedentes: TDBEdit;
    ed_vrhoraexcedente: TDBEdit;
    ed_vrtotalhoraexcedentes: TDBEdit;
    ed_vrextras: TDBEdit;
    ed_totalrecdinheiro: TDBEdit;
    ed_vrtotal: TDBEdit;
    ed_vrtotalrecebido: TDBEdit;
    ed_vrtroco: TDBEdit;
    ed_vrtrocodevolvido: TDBEdit;
    bt_fechar: TBitBtn;
    ds_diarias: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    chv: string;
  end;

var
  F_detalhesdaconta: TF_detalhesdaconta;

implementation

uses md_utilities, md_fechamentodeponto, md_firedac;

{$R *.dfm}

procedure TF_detalhesdaconta.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
    F_detalhesdaconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - DETALHES DA CONTA: '+chv;
    chv := T_diariasCONTA.AsString;
  end;
  bt_fechar.SetFocus;
end;

procedure TF_detalhesdaconta.bt_fecharClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TF_detalhesdaconta.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_detalhesdaconta.FormCreate(Sender: TObject);
begin
  //F_AjustarTela(F_detalhesdaconta);
end;

end.

unit md_aberturadeponto;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, DBCtrls, DB, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TF_aberturadeponto = class(TForm)
    Label4: TLabel;
    ed_dhentrada: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    ed_trcxa: TDBEdit;
    ed_recepcao: TDBEdit;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    ds_caixa: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure ed_trcxaExit(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bt_okClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
		chv: string ;
    ctd: integer;
  end;

const
	dia_semana: array[1..9] of string = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado',
  'feriado','véspera de feriado');

var
  F_aberturadeponto: TF_aberturadeponto;

implementation

uses
	md_utilities, md_login, md_firedac;

{$R *.dfm}

procedure TF_aberturadeponto.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
  	F_aberturadeponto.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - ABRIR TURNO';
    T_caixa.LAST;
 		if T_caixa.RecordCount = 0 then chv := '1' else
    chv := trim(IntToStr((StrToInt(T_caixaCAIXA.value)+1)));
    while length(chv) < 6 do chv := '0'+ chv;

	  T_caixa.Insert;

		T_caixaCAIXA.value := chv;
    T_caixaENTRADA.Value := Now();
    T_caixaRECEPCAO.Value := F_login.USR;
    T_caixaT_CXAREC.value := 0 ;
    T_caixaT_CXADEIXADO.Value := 0 ;
    T_caixaT_DIARIAS.Value := 0;
    T_caixaT_PEDIDOS.Value := 0;
    T_caixaT_EXTRAS.Value := 0;
    T_caixaT_DESCONTOS.Value := 0;
    T_caixaT_BRUTO.Value := 0;
    T_caixaT_META.Value  := T_empresaVR_MINIMO.Value;
    T_caixaT_COMISSAO.Value := 0;
    T_caixaT_CARTAO.Value := 0;
    T_caixaT_DINHEIRO.Value := 0;
    T_caixaT_RECEBIDO.Value := 0;
    T_caixaT_REPCXA.Value := 0;
    T_caixaT_DESPESAS.Value := 0;
    T_caixaT_VALES.Value := 0;
    T_caixaT_VALETRANSPORTE.Value := 0;
    T_caixaT_LIQENV.Value := 0;
    T_caixaT_DIF.Value := 0;
    T_caixaT_REC.Value := 0;
    T_caixaENVIO_OK.Value := '0';
    T_caixaENVIO_DT.Value := Now();
    T_caixaCHV.value := 'A';

    ed_trcxa.SetFocus;
    bt_ok.Enabled := FALSE;
  end;
end;

procedure TF_aberturadeponto.ed_trcxaExit(Sender: TObject);
begin
  bt_OK.Enabled := TRUE;
  bt_OK.SetFocus;
end;

procedure TF_aberturadeponto.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
    if T_caixa.state in [dsInsert,dsEdit] then
    T_caixa.Post;
  end;
  CLOSE;
end;

procedure TF_aberturadeponto.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac do
  begin
    if T_caixa.state in [dsInsert,dsEdit] then
    T_caixa.Cancel;
  end;
  CLOSE;
end;

procedure TF_aberturadeponto.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_aberturadeponto.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_aberturadeponto);
end;

end.


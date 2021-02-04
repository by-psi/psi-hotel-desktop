unit md_rouparia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, DB, Buttons, ExtCtrls;

type
  TF_rouparia = class(TForm)
    Label1: TLabel;
    ed_diaria: TDBEdit;
    Label2: TLabel;
    ed_data: TDBEdit;
    Label6: TLabel;
    ed_LC: TDBEdit;
    Label7: TLabel;
    ed_FR: TDBEdit;
    Label3: TLabel;
    ed_TB: TDBEdit;
    Label4: TLabel;
    Label_1: TLabel;
    Label5: TLabel;
    ed_TP: TDBEdit;
    Label9: TLabel;
    ed_TR: TDBEdit;
    Label10: TLabel;
    ed_EC: TDBEdit;
    ed_TM: TDBEdit;
    Label8: TLabel;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    ds_rouparia: TDataSource;

    procedure FormShow(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  F_rouparia: TF_rouparia;

  chv: string;
  x,y,pag: integer;

implementation

uses md_utilities, md_firedac;

{$R *.dfm}

procedure TF_rouparia.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
   	F_rouparia.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CONTROLE DE ROUPARIA';
		T_rouparia.Last;
    chv := trim(T_roupariaFICHA.AsString); while length(chv) < 6 do chv := '0'+ chv;
		Label_1.caption := chv;

    T_rouparia.Insert;
    T_roupariaDIARIA.Value  := T_diariasCONTA.Value;
    T_roupariaDH_RETIRADA.Value := Now();
    T_roupariaLC.Value      := 1;
    T_roupariaFR.Value      := 2;
    T_roupariaTB.Value      := 2;
    T_roupariaTP.Value      := 0;
    T_roupariaTR.Value      := 0;
    T_roupariaTM.Value			:= 0;
    T_roupariaEC.Value      := 0;
    T_roupariaCOLETA.Value  := '';
    T_roupariaCHV.Value     := 'S';
  end;
  ed_LC.SetFocus
end;

procedure TF_rouparia.bt_okClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_rouparia.state in [dsInsert,dsEdit] then
    begin
    	T_diarias.Edit;
      T_diariasCHECK_OUT.Value := 'N';
      T_diarias.Post;
      T_apartamentos.Edit;
      T_apartamentosDIARIA.Value := '';
      T_apartamentosCHV_D.Value := 'LIVRE';
      T_apartamentos.Post;
			T_rouparia.Post;
    end;
	end;
  CLOSE;
end;

procedure TF_rouparia.bt_cancelarClick(Sender: TObject);
begin
  with dm_firedac do
  begin
		if T_rouparia.state in [dsInsert,dsEdit] then
		T_rouparia.Cancel;
  end;
  CLOSE;
end;

procedure TF_rouparia.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_rouparia.FormCreate(Sender: TObject);
begin
  // F_AjustarEscala(F_rouparia);
end;

end.

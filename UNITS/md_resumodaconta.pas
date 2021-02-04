unit md_resumodaconta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Winapi.ShellAPI;

type
  TF_resumodaconta = class(TForm)
    Timer_HU: TTimer;
    ds_diarias: TDataSource;
    ds_pedidos: TDataSource;
    Panel_1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label25: TLabel;
    Label15: TLabel;
    ed_conta: TDBEdit;
    ed_apto: TDBEdit;
    ed_chv: TDBEdit;
    ed_tipo: TDBEdit;
    ed_dtentrada: TDBEdit;
    ed_hrentrada: TDBEdit;
    ed_dtsaida: TDBEdit;
    ed_hrsaida: TDBEdit;
    Label_HU: TStaticText;
    ed_totalhorasuso: TDBEdit;
    Grid_1: TDBGrid;
    Label1: TLabel;
    ed_franquia: TDBEdit;
    Label2: TLabel;
    ed_totalpedidos: TDBEdit;
    bt_fechar: TSpeedButton;
    bt_pedidos: TSpeedButton;
    bt_imprimirticket: TSpeedButton;
    bt_imprimirconta: TSpeedButton;
    bt_calculadora: TSpeedButton;

    procedure Timer_HUTimer(Sender: TObject);
    procedure processar_evento(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_resumodaconta: TF_resumodaconta;

implementation

{$R *.dfm}

uses md_firedac, md_diarias;

procedure TF_resumodaconta.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_resumodaconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - RESUMO DA CONTA';
    q_pedidos.DisableControls;
    q_pedidos.Close;
    q_pedidos.SQL.Clear;
    q_pedidos.SQL.text := 'select * from T_pedidos where CONTA = "'+T_diariasCONTA.asString+'" order by COMANDA ';
    q_pedidos.Open;
    q_pedidos.EnableControls;

    q_apartamentos.DisableControls;
    q_apartamentos.Close;
    q_apartamentos.SQL.Clear;
    q_apartamentos.SQL.Add('select * from T_apartamentos where APTO = '+T_diariasAP.AsString);
    q_apartamentos.Open;
    q_apartamentos.EnableControls;

    if T_diariasCHV.Value = 'A' then
    ed_totalhorasuso.Visible := False else
    ed_totalhorasuso.Visible := True;
    Panel_1.SetFocus;
  end;
end;

procedure TF_resumodaconta.Timer_HUTimer(Sender: TObject);
begin
  with dm_firedac do
  begin
    if T_diariasCHV.value = 'A' then
    begin
      Label_HU.Caption := TimeToSTR(Now()-T_diariasHR_ENTRADA.Value);
      ed_chv.Font.Color := clBlack;
    end else
    begin
  		if NOT (query_login.IsEmpty) then
      begin
        if (T_diariasCHV.Value = 'F') and (q_apartamentosCHV_D.Value = 'EM ARRUMAÇÃO') then
        begin
          Label_HU.Caption  := TimeToSTR(Now()-T_diariasHR_SAIDA.Value);
          ed_chv.Font.Color := clRed;
        end else
        if (T_diariasCHV.Value = 'F') and (q_apartamentosCHV_D.Value = 'LIVRE') then
        begin
          Label_HU.Caption  := '00:00:00';
          ed_chv.Font.Color := clBlack;
        end;    
      end;
    end;   
  end;
end;

procedure TF_resumodaconta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with dm_firedac do
  begin
  	case Key of
    VK_F4: begin
            F_diarias.processo(04);
            q_pedidos.Refresh;
            end;
    VK_F5: F_diarias.processo(05);
    end;
  end;
end;

procedure TF_resumodaconta.processar_evento(Sender: TObject);
var
  cmd,par,dir: array[0..79] of char;
begin
  with dm_firedac do
  begin
    if Sender = bt_fechar then CLOSE else
    if Sender = bt_pedidos then
    begin
      F_diarias.processo(04);
      q_pedidos.Refresh;
    end else
    if Sender = bt_imprimirconta then F_diarias.processo(05) else
    if Sender = bt_imprimirticket then F_diarias.processo(22) else
    if Sender = bt_calculadora then
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
  end;
end;

procedure TF_resumodaconta.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

end.

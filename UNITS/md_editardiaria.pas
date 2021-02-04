unit md_editardiaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, StdCtrls, Mask, DateUtils,Variants, OleCtrls, ExtCtrls, Buttons,
  Db, DBCtrls, DBGrids, Printers, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_editardiaria = class(TForm)
    Label2: TLabel;
    ed_diaria: TDBEdit;
    Label3: TLabel;
    ed_apto: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ed_recepcao_entrada: TDBEdit;
    Label7: TLabel;
    ed_dtentrada: TDBEdit;
    Label8: TLabel;
    ed_recepcao_saida: TDBEdit;
    Label9: TLabel;
    ed_dtsaida: TDBEdit;
    Label10: TLabel;
    ed_hruso: TDBEdit;
    Label11: TLabel;
    ed_hrexcedentes: TDBEdit;
    Label12: TLabel;
    ed_vrhorasuso: TDBEdit;
    Label13: TLabel;
    ed_vrpedidos: TDBEdit;
    Label14: TLabel;
    ed_vrextras: TDBEdit;
    Label15: TLabel;
    ed_vrhsexc: TDBEdit;
    Label16: TLabel;
    ed_vrtotal: TDBEdit;
    Label17: TLabel;
    ed_rcce: TDBEdit;
    Label18: TLabel;
    ed_rcde: TDBEdit;
    Label19: TLabel;
    ed_vrrecebido: TDBEdit;
    Label20: TLabel;
    ed_vrtroco: TDBEdit;
    Label22: TLabel;
    ed_vrlocacao: TDBEdit;
    Label23: TLabel;
    ed_vrdesconto: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    ed_ds: TDBComboBox;
    ed_chv: TDBComboBox;
    ed_checkout: TDBComboBox;
    ed_tipo: TDBComboBox;
    Label1: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    ed_rccs: TDBEdit;
    Label30: TLabel;
    ed_rcds: TDBEdit;
    Label21: TLabel;
    ed_rccartao: TDBEdit;
    Label31: TLabel;
    ed_rcdinheiro: TDBEdit;
    ed_vrentrada: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    ed_vrsaida: TDBEdit;
    Label34: TLabel;
    ed_cxentrada: TDBEdit;
    Label35: TLabel;
    ed_cxsaida: TDBEdit;
    ed_hrentrada: TDBEdit;
    ed_hrsaida: TDBEdit;
    Label24: TLabel;
    ed_franquia: TDBEdit;
    Label36: TLabel;
    ed_dftroco: TDBEdit;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label37: TLabel;
    Label38: TLabel;
    ed_caixa: TDBEdit;
    DBNavigator_1: TDBNavigator;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_diarias: TDataSource;
    Query_T1: TFDQuery;
    Query_T2: TFDQuery;
    Query_T3: TFDQuery;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_diariasDataChange(Sender: TObject; Field: TField);
    procedure atualiza_totais(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_tipoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
	SIM = 1;
  NAO = 0;
	dia_semana: array[1..9] of string = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado',
  'feriado','véspera de feriado');

var
  F_editardiaria: TF_editardiaria;

  hu_d,hu_h,hu_m,fr_h,fr_m,he_h,
  chv,linha: string;
  entrada, saida, franquia, h_limite, h_uso: TDateTime;
  aa, mm, dd, hh, mi, ss, ms: word;
  T_dias, T_horas, T_minutos: real;
  ctd,x,y,pag,
  T_excedentes: integer;
  vr_locacao, vr_horasexcedentes: real;

implementation

uses
	md_utilities, md_diarias, md_firedac;

{$R *.dfm}

procedure TF_editardiaria.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
		F_editardiaria.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - REVISÃO DE CONTA';
    chv := T_diariasCONTA.Value;
  end;
  bt_status(0); ed_apto.SetFocus;
end;

procedure TF_editardiaria.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ;
 	end else
  if opcao = 1 then
  begin
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false;
  end;
end;

procedure TF_editardiaria.processo(opcao: byte);
begin
	case opcao of
  03: with dm_firedac do
  		begin
    		if T_diarias.state in [dsInsert,dsEdit] then T_diarias.Post;
        bt_status(0); ed_diaria.SetFocus;
	  	end;

	04:	with dm_firedac do
  		begin
    		if T_diarias.state in [dsInsert,dsEdit] then T_diarias.Cancel;
        bt_status(0); ed_diaria.SetFocus;
  		end;

  05: with dm_firedac do
  		begin
        case T_empresaSAIDA_I.Value of
        1,5: ShowMessage('Impressão não disponível. Este módulo está em revisão!');
      	end;
  		end;

	06:	with dm_firedac do
  		begin
        if MsgDlg('Deseja excluir esta conta? '+#10#13+
        'Este procedimento irá excluir a conta selecionada e todos os pedidos relacionados a ela.', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        if T_diariasCHV.value = 'A' then
        ShowMessage('Favor fechar esta conta antes de removê-la do sistema.') else
        begin
          chv := T_diariasCONTA.Value;

          // excluindo pedidos da DIARIA selecionada

          linha := 'delete from t_pedidos where CONTA = '+chv+' ';
          Query_T1.DisableControls;
          Query_T1.Close;
          Query_T1.SQL.text := linha;
          Query_T1.ExecSQL;
          Query_T1.EnableControls;

          // excluindo DIARIA selecionada

          linha := 'delete from t_diarias where CONTA = '+chv+' ';
          Query_T2.DisableControls;
          Query_T2.Close;
          Query_T2.SQL.text := linha;
          Query_T2.ExecSQL;
          Query_T2.EnableControls;

          T_diarias.Refresh; T_diarias.Last;
          T_pedidos.Refresh;
        end;
      end;

  07: with dm_firedac do
		  begin
        T_diarias.Edit;

        T_dias    := DaysBetween(T_diariasDT_SAIDA.value, T_diariasDT_ENTRADA.Value); vr_locacao := 0;
      	T_horas := 0; T_minutos := 0; franquia := 0; ctd := 0;

        entrada 			:= T_diariasHR_ENTRADA.Value;
        saida	 				:= T_diariasHR_SAIDA.Value;

        if entrada > saida then
        h_uso :=(86400-entrada)+saida else
        h_uso := saida - entrada;

        T_diariasHR_USO.Value := h_uso;

				DecodeDateTime(T_diariasHR_USO.Value, aa,mm,dd,hh,mi,ss,ms);

        // apuração do valor da franquia e horas excedentes }

{       2H P12 D12 D24 HC }

        if T_diariasTIPO.Value = 'HORA' then T_diariasHR_FRANQUIA.Value := StrToTime('01:00:00');

        if T_diariasHR_USO.value > T_diariasHR_FRANQUIA.Value then
        T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value else
        T_diariasHR_EXCEDENTES.Value := 0;
        DecodeDateTime(T_diariasHR_EXCEDENTES.Value, aa,mm,dd,hh,mi,ss,ms);
        T_excedentes := hh; if mi > T_empresaTOLERANCIA.Value then inc(T_excedentes);

        if T_diariasTIPO.Value = 'PERNOITE' then
        begin

        	h_limite := IncMinute(StrToTime('12:00:00'), T_empresaTOLERANCIA.Value);

          if (entrada > StrToTime('19:00:00')) and (saida < h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := (86400 - entrada) + h_limite;
            T_diariasHR_EXCEDENTES.Value := 0;
          end;
          if (entrada > StrToTime('19:00:00')) and (saida > h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := (86400-entrada) + h_limite;
            T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value;
          end;
          if (entrada < StrToTime('06:00:00')) and (saida < h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := (h_limite - entrada);
            T_diariasHR_EXCEDENTES.Value := 0;
          end;
          if (entrada < StrToTime('06:00:00')) and (saida > h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := (h_limite - entrada);
            T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value;
          end;
          if T_diariasHR_USO.value > T_diariasHR_FRANQUIA.Value then
          T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value else
          T_diariasHR_EXCEDENTES.Value := 0;
          DecodeDateTime(T_diariasHR_EXCEDENTES.Value, aa,mm,dd,hh,mi,ss,ms);
          T_excedentes := hh; if mi > T_empresaTOLERANCIA.Value then inc(T_excedentes);
        end;

        if T_diariasTIPO.Value = 'DIARIA' then
        begin

        	h_limite := IncMinute(StrToTime('17:00:00'), T_empresaTOLERANCIA.Value);

          if (entrada > StrToTime('06:00:00')) and (saida < h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := StrToTime('12:00:00');
            T_diariasHR_EXCEDENTES.Value := StrToTime('00:00:00');
          end;
          if (entrada < StrToTime('06:00:00')) and (saida < h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := StrToTime('12:00:00');
            T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value;
          end;
          if (entrada < StrToTime('06:00:00')) and (saida > h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value := StrToTime('12:00:00');
            T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value;
          end;
          if (entrada > StrToTime('06:00:00')) and (saida > h_limite) then
          begin
            T_diariasHR_FRANQUIA.Value   := (h_limite - entrada);
            T_diariasHR_EXCEDENTES.Value := (saida - h_limite);
          end;
          if T_diariasHR_USO.value > T_diariasHR_FRANQUIA.Value then
          T_diariasHR_EXCEDENTES.Value := T_diariasHR_USO.Value - T_diariasHR_FRANQUIA.Value else
          T_diariasHR_EXCEDENTES.Value := 0;
          DecodeDateTime(T_diariasHR_EXCEDENTES.Value, aa,mm,dd,hh,mi,ss,ms);
          T_excedentes := hh; if mi > T_empresaTOLERANCIA.Value then inc(T_excedentes);
        end;

        { apuração do valor de horas excedentes // verificar dia da semana }

        if T_excedentes > 0 then
        vr_horasexcedentes := T_excedentes * T_diariasVR_HE.Value else
        vr_horasexcedentes := 0;
        T_diariasVR_HORASEXCEDENTES.value := vr_horasexcedentes;

        vr_locacao := T_diariasVR_LOCACAO.Value;

        T_diariasVR_HORASUSO.value := vr_locacao + vr_horasexcedentes;
        T_diariasVR_TOTAL.Value    := (T_diariasVR_HORASUSO.Value+T_diariasVR_PEDIDOS.Value+T_diariasVR_EXTRAS.Value+T_diariasVR_DESCONTO.Value);
        T_diariasVR_ENTRADA.Value  := (T_diariasRC_CE.Value+T_diariasRC_DE.Value);
      	T_diariasVR_SAIDA.Value		 := (T_diariasRC_CS.Value+T_diariasRC_DS.Value);
        T_diariasRC_CARTAO.Value   := (T_diariasRC_CE.Value+T_diariasRC_CS.Value);
        T_diariasRC_DINHEIRO.Value := (T_diariasRC_DE.Value+T_diariasRC_DS.Value);
        T_diariasVR_TROCO.Value    := (T_diariasVR_RECEBIDO.Value-T_diariasVR_TOTAL.Value);
        T_diariasVR_RECEBIDO.Value := (T_diariasRC_CARTAO.Value+T_diariasRC_DINHEIRO.Value)-T_diariasDF_TROCO.Value;
        T_diarias.Post;

        if T_diariasVR_TROCO.value >= 0 then
        ed_vrtroco.Font.Color  := clBlack else
        ed_vrtroco.Font.Color  := clRed;
      end;

  08: CLOSE;
  end;
end;

procedure TF_editardiaria.processar_evento(Sender: TObject);
begin
  if Sender = bt_imprimir then processo(05) else
  if Sender = bt_excluir then processo(06) else
	if Sender = bt_ok then processo(03) else
	if Sender = bt_cancelar	then processo(04) else
	if Sender = bt_fechar	then processo(08);
end;

procedure TF_editardiaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F5 : processo(05);
  VK_F7 : processo(03);
  VK_F8 : processo(04);
  VK_F10: processo(08);
  end;
end;

procedure TF_editardiaria.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_editardiaria.ds_diariasDataChange(Sender: TObject;
  Field: TField);
begin
	bt_status(1);
end;

procedure TF_editardiaria.atualiza_totais(Sender: TObject);
begin
  processo(07);
end;

procedure TF_editardiaria.ed_tipoExit(Sender: TObject);
begin
  with dm_firedac do
  begin
  	if dm_firedac.T_diarias.state in [dsInsert,dsEdit] then
    case ed_tipo.ItemIndex of
    0:	begin
          if T_apartamentos.Locate('APTO',T_diariasAP.AsString,[]) then
          T_diariasHR_FRANQUIA.Value := T_apartamentosFRANQUIA.Value;
        end;
    1: 	begin
          if (entrada >= StrToTime('19:00:00')) and (entrada <= StrToTime('23:59:59')) then
          T_diariasHR_FRANQUIA.Value := (StrToTime('23:59:59') - Time) + StrToTime('12:00:00') else
          if (entrada >= StrToTime('00:00:00'))  and (entrada <= StrToTime('04:00:00')) then
          T_diariasHR_FRANQUIA.Value := (StrToTime('12:00:00') - Time);
        end;
    2:	begin
          if (entrada >= StrToTime('06:00:00')) and (entrada <= StrToTime('17:00:00')) then
          T_diariasHR_FRANQUIA.Value := (StrToTime('17:00:00') - Time);
        end;
    3: 	begin
          T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
        end;
    4:  begin
          T_diariasVR_LOCACAO.Value := 0;
          T_diariasHR_FRANQUIA.Value := StrToTime('00:00:00');
        end;

    end;

  end;
end;

procedure TF_editardiaria.FormCreate(Sender: TObject);
begin
//  F_AjustarEscala(F_editardiaria);
end;

end.

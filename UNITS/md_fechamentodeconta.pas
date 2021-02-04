unit md_fechamentodeconta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, StdCtrls, Mask, DateUtils,Variants, OleCtrls, ExtCtrls, Buttons,
  Db, DBCtrls, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_fechamentodeconta = class(TForm)
    Label7: TLabel;
    ed_tipo: TDBEdit;
    Label17: TLabel;
    ed_apto: TDBEdit;
    Label11: TLabel;
    Grid_1: TDBGrid;
    Label22: TLabel;
    ed_vrlocacao: TDBEdit;
    Label15: TLabel;
    ed_vrhorasexcedentes: TDBEdit;
    Label14: TLabel;
    ed_vrtotal: TDBEdit;
    Label2: TLabel;
    Label29: TLabel;
    ed_vrentrada: TDBEdit;
    Label10: TLabel;
    ed_vrpedidos: TDBEdit;
    Label1: TLabel;
    ed_vrextras: TDBEdit;
    Label19: TLabel;
    ed_vrdesconto: TDBEdit;
    Label5: TLabel;
    Label13: TLabel;
    ed_vrtroco: TDBEdit;
    Label6: TLabel;
    ed_rcds: TDBEdit;
    Label18: TLabel;
    ed_rccs: TDBEdit;
    ed_desctroco: TDBEdit;
    Label21: TLabel;
    Label30: TLabel;
    ed_vrsaida: TDBEdit;
    Bevel2: TBevel;
    Label31: TLabel;
    Label34: TLabel;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    ds_diarias: TDataSource;
    ds_pedidos: TDataSource;
    bt_pedidos: TSpeedButton;
    Query_T1: TFDQuery;
    Label4: TLabel;
    ed_conta: TDBEdit;
    Timer_HU: TTimer;

    procedure FormShow(Sender: TObject);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure calcula_tts(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ed_vrlocacaoExit(Sender: TObject);
    procedure Timer_HUTimer(Sender: TObject);

  private
    { Private declarations }
    entrada, saida, franquia, h_limite, h_uso, t_security: TDateTime;
    t_sec: string;
    aa, mm, dd, hh, mi, ss, ms: word;
    T_dias, T_horas, T_minutos: real;
    T_excedentes, ctd: integer;
    vr_locacao, vr_horasexcedentes: real;
  public
    { Public declarations }
  end;

const
	dia_semana: array[1..9] of string = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado',
  'feriado','véspera de feriado');

var
  F_fechamentodeconta: TF_fechamentodeconta;
  saida_loop: Boolean;
  hu_d,hu_h,hu_m,fr_h,fr_m,he_h,
	chv,linha: string ;

implementation

uses
	md_utilities, md_login, md_diarias, md_comandas, md_firedac;

{$R *.DFM}

procedure TF_fechamentodeconta.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_fechamentodeconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - FECHAMENTO DE CONTA';
    t_security := Time;

    T_diarias.Edit;

    T_diariasDT_SAIDA.value := Date;
    T_diariasHR_SAIDA.Value := Time;
    T_diariasRC_SAIDA.Value := F_login.USR;
		T_diariasCX_SAIDA.Value := T_caixaCAIXA.Value;

    T_dias    := DaysBetween(T_diariasDT_SAIDA.value, T_diariasDT_ENTRADA.Value); vr_locacao := 0;
    q_pedidos.DisableControls;
    q_pedidos.Close;
    q_pedidos.SQL.Clear;
    q_pedidos.SQL.text := 'select * from T_pedidos where CONTA = "'+T_diariasCONTA.asString+'" order by COMANDA ';
    q_pedidos.Open;
    q_pedidos.EnableControls;

    ed_vrpedidos.SetFocus;
    bt_ok.Enabled := FALSE;
    processo(02);
  end;
end;

procedure TF_fechamentodeconta.Timer_HUTimer(Sender: TObject);
begin
  with dm_firedac do
  begin
    t_sec := TimeToSTR(Now()-T_security);
    if t_sec = '00:03:00' then
    begin
//    ShowMessage('Tempo limite de encerramento excedido. Tente novamente!');
      if T_diarias.State in [dsInsert,dsEdit] then T_diarias.Cancel;
      if T_apartamentos.State in [dsInsert,dsEdit] then T_apartamentos.Cancel;
      CLOSE;
    end else
    F_fechamentodeconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - FECHAMENTO DE CONTA ('+t_sec+') ';
  end;
end;

procedure TF_fechamentodeconta.ed_vrlocacaoExit(Sender: TObject);
begin
  {
	with dm_firedac do
  begin
    if T_diarias.State in [dsInsert,dsEdit] then
    begin
      if T_diariasTIPO.Value = '24HS' then
      begin
		    T_dias := DaysBetween(T_diariasDT_SAIDA.value, T_diariasDT_ENTRADA.Value); vr_locacao := 0;
  	    if T_dias >= 1 then
    	  T_diariasVR_HORASUSO.Value := T_diariasVR_LOCACAO.Value * (T_dias+1) else
      	T_diariasVR_HORASUSO.Value := T_diariasVR_LOCACAO.Value * 1;
      end;
    end;
  end;
  }
end;

procedure TF_fechamentodeconta.processo(opcao: byte);
begin
	T_horas := 0; T_minutos := 0; franquia := 0; ctd := 0;
	case opcao of
  02: with dm_firedac do
      begin
        if T_feriados.Locate('DT_EVENTO',DateToStr(date+1),[]) then ctd := 9 else
        if T_feriados.Locate('DT_EVENTO',DateToStr(date), []) then  ctd := 8 else
        ctd := DayOfWeek(date);

        chv := T_diariasCONTA.Value;

        entrada := T_diariasHR_ENTRADA.Value;
        saida	 	:= T_diariasHR_SAIDA.Value;

        if entrada > saida then
        h_uso :=(86400-entrada)+saida else
        h_uso := saida - entrada;

        T_diariasHR_USO.Value := h_uso;

				DecodeDateTime(T_diariasHR_USO.Value, aa,mm,dd,hh,mi,ss,ms);

        // apuração do valor da franquia e horas excedentes }

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

        	h_limite := IncMinute(StrToTime('18:00:00'), T_empresaTOLERANCIA.Value);

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

        if T_apartamentosCHV_D.Value = 'MANUTENÇÃO' then EXIT else
        begin
          if T_excedentes > 0 then
          vr_horasexcedentes := T_excedentes * T_diariasVR_HE.Value else
          vr_horasexcedentes := 0;
          T_diariasVR_HORASEXCEDENTES.value := vr_horasexcedentes;

          vr_locacao := T_diariasVR_LOCACAO.Value;

          T_diariasVR_HORASUSO.value := vr_locacao + vr_horasexcedentes;

          { soma dos itens/produtos consumidos }

          chv := trim(T_diariasCONTA.value);
          linha := 'select sum(VR_TOTAL) from t_pedidos where CONTA = '+chv+' ';
          Query_T1.DisableControls;
          Query_T1.Close;
          Query_T1.SQL.text := linha;
          Query_T1.Open;
          Query_T1.EnableControls;

          if Query_T1.Fields[0].value <> NULL then
          T_diariasVR_PEDIDOS.value  := Query_T1.Fields[0].value else
          T_diariasVR_PEDIDOS.value  := 0;

          T_diariasVR_TOTAL.value :=
          T_diariasVR_HORASUSO.value+T_diariasVR_PEDIDOS.value+T_diariasVR_EXTRAS.value+
          T_diariasVR_DESCONTO.Value;
        end;
        T_diariasRC_CS.Value := 0;
        T_diariasRC_DS.Value := 0;
        T_diariasVR_SAIDA.Value := 0;
      end;

  04: begin
	  		ShowModalForm(TF_comandas, F_comandas);
        with dm_firedac do
        begin
          chv := trim(T_diariasCONTA.asString);

          q_pedidos.DisableControls;
          q_pedidos.Close;
          q_pedidos.SQL.Clear;
          q_pedidos.SQL.text := 'select * from T_pedidos where CONTA = "'+chv+'" order by COMANDA ';
          q_pedidos.Open;
          q_pedidos.EnableControls;

          Query_T1.DisableControls;
          Query_T1.Close;
          Query_T1.SQL.text := 'select sum(VR_TOTAL) from t_pedidos where CONTA = '+chv+' ';
          Query_T1.Open;
          Query_T1.EnableControls;

          if Query_T1.Fields[0].value <> NULL then

          T_diariasVR_PEDIDOS.value  := Query_T1.Fields[0].value else
          T_diariasVR_PEDIDOS.value  := 0;
          T_diariasRC_CS.Value := 0;
          T_diariasRC_DS.Value := 0;
        end;
        ed_vrpedidos.SetFocus;
      end;

  05: with dm_firedac do
      begin
        if T_diarias.state in [dsInsert,dsEdit] then
        begin
          // if T_diariasTIPO.Value <> '24HS' then (???)
          T_diariasVR_HORASUSO.Value := (T_diariasVR_LOCACAO.Value+T_diariasVR_HORASEXCEDENTES.Value);
          T_diariasVR_TOTAL.Value    := (T_diariasVR_HORASUSO.Value+T_diariasVR_PEDIDOS.Value+T_diariasVR_EXTRAS.Value-T_diariasVR_DESCONTO.Value);
          T_diariasVR_ENTRADA.Value  := (T_diariasRC_CE.Value+T_diariasRC_DE.Value);
          T_diariasVR_SAIDA.Value		 := (T_diariasVR_TROCO.Value+T_diariasRC_CS.Value+T_diariasRC_DS.Value)-T_diariasDF_TROCO.Value;
          T_diariasRC_CARTAO.Value   := (T_diariasRC_CE.Value+T_diariasRC_CS.Value);
          T_diariasRC_DINHEIRO.Value := (T_diariasRC_DE.Value+T_diariasRC_DS.Value);
          T_diariasVR_RECEBIDO.Value := (T_diariasRC_CARTAO.Value+T_diariasRC_DINHEIRO.Value);
          T_diariasVR_TROCO.Value    := (T_diariasVR_RECEBIDO.Value-T_diariasVR_TOTAL.Value);

          if T_diariasVR_TROCO.value > 0 then
          ed_vrtroco.Font.Color  := clRed else
          ed_vrtroco.Font.Color  := clBlack;
        end;
        bt_ok.Enabled := TRUE;
      end;

  08: with dm_firedac do
      begin
        if T_diarias.state in [dsInsert,dsEdit] then
        begin
          if ((T_diariasVR_TROCO.Value < 0) and (T_diariasVR_RECEBIDO.Value <> abs(T_diariasVR_TROCO.Value))) then
          begin
            ShowMessage('ATENÇÃO!'+#10#13+
            'Favor receber o valor informado com DIF. A RECEBER e digitar corretamente os valores nos campos'+#10#13+
            'DINHEIRO e/ou CARTÃO!');
            ed_rcds.SetFocus;
          end else
          if ((T_diariasVR_TROCO.Value > 0) and (T_diariasDF_TROCO.Value <> T_diariasVR_TROCO.Value)) then
          begin
            ShowMessage('ATENÇÃO!'+#10#13+
            'Favor devolver o TROCO informado (em vermelho) e digitar corretamente o valor no campo'+#10#13+
            'TROCO A DEVOLVER!');
            ed_rcds.SetFocus;
          end else
          if T_diarias.state in [dsInsert,dsEdit] then
          begin
            chv := T_diariasAP.Value;
            if T_apartamentos.State in [dsEdit, dsInsert] then T_apartamentos.Edit;
            if T_apartamentos.Locate('APTO',chv,[]) then
            begin
              T_apartamentos.Edit;
              if (T_diariasTIPO.AsString = 'VENDA AVULSA') or (T_diariasTIPO.AsString = 'MANUTENÇÃO') then
              begin
                T_apartamentosCHV_D.value := 'LIVRE';
                T_apartamentosDIARIA.Value := '';
                T_diariasCHECK_OUT.value := 'N';
              end else
              begin
                T_apartamentosCHV_D.value := 'EM ARRUMAÇÃO';
                T_apartamentosDIARIA.Value := T_diariasCONTA.Value;
                T_diariasCHECK_OUT.value := 'S';
              end;
              T_apartamentos.Post;
              T_diariasCHV.value := 'F';
              T_diarias.Post;
            end;
            case T_empresaSAIDA_I.Value of
            1,5:F_diarias.processo(05);
            end;
            CLOSE;
          end;
        end;
      end;

  09: with dm_firedac do
      begin
        if T_diarias.State in [dsInsert,dsEdit] then T_diarias.Cancel;
        if T_apartamentos.State in [dsInsert,dsEdit] then T_apartamentos.Cancel;
				CLOSE;
      end;

	end;
end;

procedure TF_fechamentodeconta.processar_evento(Sender: TObject);
begin
  if Sender = bt_pedidos then processo(04) else
  if Sender = bt_ok	then processo(08) else
  if Sender = bt_cancelar	then processo(09);
end;

procedure TF_fechamentodeconta.calcula_tts(Sender: TObject);
begin
  processo(05);
end;

procedure TF_fechamentodeconta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
  VK_F4	:	processo(04);
  VK_F8 :	processo(08);
  VK_F9 : processo(09);
  end;
end;

procedure TF_fechamentodeconta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_fechamentodeconta.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_fechamentodeconta);
end;

end.

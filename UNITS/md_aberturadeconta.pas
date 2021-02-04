unit md_aberturadeconta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, Db, DBCtrls, OleCtrls,
  jpeg, DateUtils;

type
  TF_aberturadeconta = class(TForm)
    ed_apto: TDBEdit;
    ed_vrlocacao: TDBEdit;
    ed_vrentrada: TDBEdit;
    Label8: TLabel;
    Label6: TLabel;
    ed_rcde: TDBEdit;
    Label9: TLabel;
    ed_rcce: TDBEdit;
    ed_tipo: TDBRadioGroup;
    Bevel1: TBevel;
    Label2: TLabel;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    ds_diarias: TDataSource;
    Label4: TLabel;
    ed_conta: TDBEdit;
    Label5: TLabel;
    ed_franquia: TDBEdit;

    procedure FormShow(Sender: TObject);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure ed_tipoExit(Sender: TObject);
    procedure calcula_tts(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

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
  F_aberturadeconta: TF_aberturadeconta;

  entrada: TDateTime;
  tolerancia : Integer;
  VALOR_HR, VALOR_HE, VALOR_P, VALOR_D,
  VALOR_24H: double;

implementation

uses
	md_utilities, md_diarias, md_login, md_firedac;

{$R *.DFM}

procedure TF_aberturadeconta.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_aberturadeconta.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - ABERTURA DE CONTA';
    processo(02);
    bt_OK.Enabled := FALSE;
    ed_tipo.ItemIndex := 0;
    ed_tipo.SetFocus;
  end;
end;

procedure TF_aberturadeconta.processo(opcao: byte);
begin
	case opcao of
	02: with dm_firedac do
      begin
        T_diarias.Last;
        if T_diarias.RecordCount = 0 then str(T_empresaULTIMA_C.asInteger+1,chv) else
        chv := trim(IntToStr((StrToInt(T_diariasCONTA.value)+1)));
        while length(chv) < 6 do chv := '0'+ chv;

        { abre uma nova conta em T_diarias }

        T_diarias.Insert;

        T_diariasCONTA.Value 	:= chv;
        T_diariasAP.Value 		:= T_apartamentosAPTO.value;
        T_diariasTIPO.Value 	:= 'HORA';
        T_diariasCAIXA.Value := T_caixaCAIXA.Value;
        T_diariasCHECK_OUT.Value := 'N';
        T_diariasCHV.Value := 'A';

        if T_feriados.Locate('DT_EVENTO',DateToStr(date+1),[]) then
        begin
          T_diariasDS.value := 9;
          ctd := T_diariasDS.asInteger;
        end else
        if T_feriados.Locate('DT_EVENTO',DateToStr(date), []) then
        begin
          T_diariasDS.value := 8;
          ctd := T_diariasDS.asInteger
        end else
        begin
          T_diariasDS.value := DayOfWeek(date);
          ctd := T_diariasDS.asInteger;
        end;

        { inicializa valores da nova conta em T_diarias}

        T_diariasDT_ENTRADA.Value := date;
        T_diariasDT_SAIDA.Value   := date;
        T_diariasHR_ENTRADA.Value := time;
        T_diariasHR_SAIDA.Value   := 0;
        T_diariasRC_ENTRADA.Value := F_login.USR;
        T_diariasRC_SAIDA.Value   := '';
				T_diariasCX_ENTRADA.Value := T_caixaCAIXA.Value;
        T_diariasCX_SAIDA.Value   := '';
        T_diariasCAIXA.Value      := T_caixaCAIXA.Value;

        T_diariasHR_USO.Value := StrToTime('00:00:00');
        T_diariasHR_FRANQUIA.Value := StrToTime('00:00:00');
        T_diariasHR_EXCEDENTES.Value := StrToTime('00:00:00');
        T_diariasVR_LOCACAO.Value := 0;
        T_diariasVR_HORASEXCEDENTES.Value := 0;
        T_diariasVR_HORASUSO.Value := 0;
        T_diariasVR_PEDIDOS.Value := 0;
        T_diariasVR_EXTRAS.Value := 0;
        T_diariasVR_DESCONTO.Value := 0;
        T_diariasVR_TOTAL.Value := 0;
        T_diariasRC_CE.Value := 0;
        T_diariasRC_DE.Value := 0;
        T_diariasVR_ENTRADA.Value := 0;
        T_diariasRC_CS.Value := 0;
        T_diariasRC_DS.Value := 0;
        T_diariasVR_SAIDA.Value := 0;
        T_diariasRC_CARTAO.Value := 0;
        T_diariasRC_DINHEIRO.Value := 0;
        T_diariasVR_RECEBIDO.Value := 0;
        T_diariasVR_TROCO.Value := 0;
        T_diariasDF_TROCO.Value := 0;
      end;

  03: with dm_firedac do
      begin
        entrada := Time;  VALOR_HR := 0; VALOR_HE := 0; VALOR_P := 0; VALOR_D := 0; VALOR_24H := 0;
        ctd := T_diariasDS.asInteger;

        if T_diariasTIPO.Value = 'PERNOITE' then
        begin
          if T_apartamentosTABELA.Value = '1' then
          begin
            if (entrada >= StrToTime('06:00:00')) and (entrada <= StrToTime('18:59:59')) then
            begin
              ShowMessage(
              'Atenção! Entradas de Pernoites somente a partir das 19h até 06h.'+#10#13+
              'Selecione 2HS, DIÁRIA ou 24HS (O valor da locação 24HS poderá ser pré-combinado). '+#10#13+
              'Desconto somente com autorização da Gerência e justificado no verso da conta.');
              ed_tipo.SetFocus;
            end;
          end else
          begin
            if (entrada >= StrToTime('04:00:00')) and (entrada <= StrToTime('18:59:59')) then
            begin
              ShowMessage('Atenção! Entradas de Pernoites somente a partir das 19h até 04h.'+#10#13+
              'Selecione 2HS, DIÁRIA ou 24HS (O valor da locação 24HS poderá ser pré-combinado). '+#10#13+
              'Desconto somente com autorização da Gerência e justificado no verso da conta.');
              ed_tipo.SetFocus;
            end;
          end;
        end;

        if T_diariasTIPO.Value = 'DIARIA' then
        begin
          if T_apartamentosTABELA.Value = '1' then
          begin
   					if (entrada >= StrToTime('17:00:00')) or (entrada <= StrToTime('05:59:59')) then
            begin
              ShowMessage(
              'Atenção! Entradas de Diárias somente a partir das 06h até 17h.'+#10#13+
              'Selecione 2HS, PERNOITE ou 24HS (O valor da locação 24HS poderá ser pré-combinado). '+#10#13+
              'Desconto somente com autorização da Gerência e justificado no verso da conta.');
              ed_tipo.SetFocus;
            end;
          end else
          begin
  					if (entrada >= StrToTime('14:00:00')) or (entrada <= StrToTime('03:59:59')) then
            begin
              ShowMessage(
  						'Atenção! Entradas de Diárias somente a partir das 04h até 17h.'+#10#13+
              'Selecione 2HS, PERNOITE ou 24HS (O valor da locação 24HS poderá ser pré-combinado). '+#10#13+
              'Desconto somente com autorização da Gerência e justificado no verso da conta.');
              ed_tipo.SetFocus;
            end;
          end;
        end;

        { apura valores 2HS, HE, VALOR_P(PERNOITE) e VALOR_D(DIARIA) de acordo com o dia da semana
        em que a conta está sendo gerada, e compara data atual com a tabela de feriados}

        if T_apartamentosTABELA.Value = '1' then
        begin
          if ctd in [2,3,4,5] then
          begin { se estiver contida na faixa de segunda a quinta - tarifa A até 23:59 hs}
            VALOR_HR  := T_apartamentosVALOR_HR1.Value;
            VALOR_HE  := T_apartamentosVALOR_HE1.Value;
            VALOR_P   := T_apartamentosVALOR_P1.Value ;
            VALOR_D   := T_apartamentosVALOR_D1.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H1.Value;
          end else
          if ctd in [6,7,8,9] then
          begin   { se for sexta, sábado, feriado ou véspera de feriado - Tarifa B }
            VALOR_HR  := T_apartamentosVALOR_HR2.Value;
            VALOR_HE  := T_apartamentosVALOR_HE2.Value;
            VALOR_P   := T_apartamentosVALOR_P2.Value ;
            VALOR_D   := T_apartamentosVALOR_D2.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H2.Value;
          end;
          if (ctd = 1) and (entrada <= StrToTime('06:00:00')) then
          begin { se for domingo até 06:00 hs da manhã - Tarifa B}
            VALOR_HR  := T_apartamentosVALOR_HR2.Value;
            VALOR_HE  := T_apartamentosVALOR_HE2.Value;
            VALOR_P   := T_apartamentosVALOR_P2.Value ;
            VALOR_D   := T_apartamentosVALOR_D2.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H2.Value;
          end;
          if (ctd = 1) and (entrada >= StrToTime('06:00:01')) then
          begin {se for domingo após 6:00hs da manhã - Tarifa A }
            VALOR_HR  := T_apartamentosVALOR_HR1.Value;
            VALOR_HE  := T_apartamentosVALOR_HE1.Value;
            VALOR_P   := T_apartamentosVALOR_P1.Value ;
            VALOR_D   := T_apartamentosVALOR_D1.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H1.Value;
          end;
        end else
        if T_apartamentosTABELA.Value = '2' then
        begin
          if ctd in [2,3,4,5] then
          begin { se estiver contida na faixa de segunda a quinta - Tarifa A}
            VALOR_HR  :=	T_apartamentosVALOR_HR1.Value;
            VALOR_HE  := T_apartamentosVALOR_HE1.Value;
            VALOR_P := T_apartamentosVALOR_P1.Value ;
            VALOR_D := T_apartamentosVALOR_D1.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H1.Value;
          end else
          if ctd in [6,7,1,8,9] then
          begin   { se for sexta, sábado, domingo, feriado ou véspera de feriado - Tarifa B }
            VALOR_HR :=	T_apartamentosVALOR_HR2.Value;
            VALOR_HE := T_apartamentosVALOR_HE2.Value;
            VALOR_P   := T_apartamentosVALOR_P2.Value ;
            VALOR_D   := T_apartamentosVALOR_D2.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H2.Value;
          end;
          { se for segunda até 4:00hs da manhã - Tarifa B}
          if (ctd = 2) and (entrada <= StrToTime('04:00:00')) then
          begin
            VALOR_HR :=	T_apartamentosVALOR_HR2.Value;
            VALOR_HE := T_apartamentosVALOR_HE2.Value;
            VALOR_P := T_apartamentosVALOR_P2.Value ;
            VALOR_D := T_apartamentosVALOR_D2.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H2.Value;
          end;
         { se for sexta-feira até antes das 4:00hs da manhã - Tarifa A }
          if (ctd = 6) and (entrada <= StrToTime('04:00:00')) then
          begin
            VALOR_HR :=	T_apartamentosVALOR_HR1.Value;
            VALOR_HE := T_apartamentosVALOR_HE1.Value;
            VALOR_P := T_apartamentosVALOR_P1.Value ;
            VALOR_D := T_apartamentosVALOR_D1.Value ;
            VALOR_24H := T_apartamentosDIARIA_24H1.Value;
          end;

        end;

        { VR_LOCACAO recebe conforme o tipo de locação selecionada por ed_tipo }

        if T_apartamentosTABELA.Value = '1' then
        begin
          case ed_tipo.ItemIndex of
          0:	begin
                T_diariasVR_LOCACAO.Value := VALOR_HR;
                T_diariasHR_FRANQUIA.Value := T_apartamentosFRANQUIA.Value;
              end;
          1: 	begin
                T_diariasVR_LOCACAO.Value := VALOR_P;
                if (entrada >= StrToTime('19:00:00')) and (entrada <= StrToTime('23:59:59')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('23:59:59') - Time) + StrToTime('12:00:00') else
                if (entrada >= StrToTime('00:00:00'))  and (entrada <= StrToTime('06:00:00')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('12:00:00') - Time);
              end;
          2:	begin
                 T_diariasVR_LOCACAO.Value := VALOR_D;
                if (entrada >= StrToTime('06:00:00')) and (entrada <= StrToTime('17:00:00')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('17:00:00') - Time);
              end;
          3: 	begin
                T_diariasVR_LOCACAO.Value := VALOR_24H;
                T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
              end;
          4:  begin
                T_diariasVR_LOCACAO.Value := 0;
                T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
              end;
          end;
        end else
        if T_apartamentosTABELA.Value = '2' then
        begin
          case ed_tipo.ItemIndex of
          0:	begin
                T_diariasVR_LOCACAO.Value := VALOR_HR;
                T_diariasHR_FRANQUIA.Value := T_apartamentosFRANQUIA.Value;
              end;
          1: 	begin
                T_diariasVR_LOCACAO.Value := VALOR_P;
                if (entrada >= StrToTime('19:00:00')) and (entrada <= StrToTime('23:59:59')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('23:59:59') - Time) + StrToTime('12:00:00') else
                if (entrada >= StrToTime('00:00:00'))  and (entrada <= StrToTime('04:00:00')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('12:00:00') - Time);
                // T_empresaFRANQUIA_P.Value;
              end;
          2:	begin
                 T_diariasVR_LOCACAO.Value := VALOR_D;
                if (entrada >= StrToTime('04:00:00')) and (entrada <= StrToTime('17:00:00')) then
                T_diariasHR_FRANQUIA.Value := (StrToTime('17:00:00') - Time);
                // T_empresaFRANQUIA_D.Value;
              end;
          3: 	begin
                T_diariasVR_LOCACAO.Value := VALOR_24H;
                T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
                // T_empresaFRANQUIA_24H.Value;
              end;
          4:  begin
                T_diariasVR_LOCACAO.Value := 0;
                T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
              end;
          end;
        end;
				T_diariasVR_HE.Value := VALOR_HE;
        T_diariasDT_ENTRADA.Value := date;
	      T_diariasHR_ENTRADA.Value := time;
        if ed_tipo.ItemIndex = 3 then
        begin
          ed_vrlocacao.Color := clWhite;
          ed_vrlocacao.Font.Color := clBlack;
          ed_vrlocacao.ReadOnly := FALSE;
          ed_vrlocacao.SetFocus;
        end else
        if ed_tipo.ItemIndex in [4,5] then EXIT else
        begin
          ed_vrlocacao.Color := clBlack;
          ed_vrlocacao.Font.Color := clWhite;
          ed_vrlocacao.ReadOnly := TRUE;
          ed_rcde.SetFocus;
        end;
      end;

  05: with dm_firedac do
      begin
        if T_diarias.state in [dsInsert,dsEdit] then
        begin
          T_diariasRC_CARTAO.Value    := T_diariasRC_CE.Value;
          T_diariasRC_DINHEIRO.Value  := T_diariasRC_DE.Value;
          T_diariasVR_ENTRADA.Value   := T_diariasRC_CE.Value + T_diariasRC_DE.Value;
          T_diariasVR_RECEBIDO.Value  := T_diariasRC_CARTAO.Value + T_diariasRC_DINHEIRO.value;
        end;
        bt_ok.Enabled := TRUE;
      end;

  08:	with dm_firedac do
      begin
        if (T_diariasVR_ENTRADA.Value = 0) and (T_diariasTIPO.Value = 'DIARIA') then
        begin
          ShowMessage(
          'Atenção! DIÁRIAS deverão ser cobradas antecipadamente!'+#10#13+
          'Favor RECEBER e INFORMAR o valor pago em DINHEIRO e/ou CARTÃO para continuar.');
          ed_tipo.SetFocus;
        end else
        if (T_diariasVR_ENTRADA.Value = 0) and (T_diariasTIPO.Value = 'PERNOITE') then
        begin
          ShowMessage(
          'Atenção! PERNOITES deverão ser cobradas antecipadamente.'+#10#13+
          'Favor RECEBER e INFORMAR o valor pago em DINHEIRO e/ou CARTÃO para continuar.');
          ed_tipo.SetFocus;
        end else
        begin
          if T_diarias.State in [dsInsert,dsEdit] then T_diarias.Post;

          T_apartamentos.Edit;
          T_apartamentosCHV_D.value  := T_diariasTIPO.Value;
          T_apartamentosDIARIA.value := T_diariasCONTA.value;
          T_apartamentos.Post;

          case T_empresaSAIDA_I.Value of
          1,5: F_diarias.processo(22);
          end;
          CLOSE;
        end;
      end;

  09: with dm_firedac do
      begin
        if T_diarias.State in [dsInsert,dsEdit] then T_diarias.Cancel;
        CLOSE;
      end;

	end;
end;

procedure TF_aberturadeconta.processar_evento(Sender: TObject);
begin
	if Sender = bt_ok	then processo(08) else
  if Sender = bt_cancelar	then processo(09);
end;

procedure TF_aberturadeconta.ed_tipoExit(Sender: TObject);
begin
	processo(03);
end;

procedure TF_aberturadeconta.calcula_tts(Sender: TObject);
begin
	processo(05);
end;

procedure TF_aberturadeconta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
  VK_F8 :	processo(08);
  VK_F9 : processo(09);
  end;
end;

procedure TF_aberturadeconta.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_aberturadeconta.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_aberturadeconta);
end;

end.


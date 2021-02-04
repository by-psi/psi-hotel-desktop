unit md_transferenciadeconta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, DB;

type
  TF_transferenciadeconta = class(TForm)
    Label16: TLabel;
    ed_conta: TDBEdit;
    Label4: TLabel;
    ed_dhentrada: TDBEdit;
    Label5: TLabel;
    ed_recepcao: TDBEdit;
    Label7: TLabel;
    Label_DS: TLabel;
    Label2: TLabel;
    ed_apto: TDBEdit;
    ed_tipo: TDBRadioGroup;
    Grid_1: TDBGrid;
    ed_hrentrada: TDBEdit;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    bt_cancelar: TBitBtn;
    bt_ok: TBitBtn;
    ds_diarias: TDataSource;
    ds_apartamentos: TDataSource;

    procedure FormShow(Sender: TObject);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
	dia_semana: array[1..9] of string = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado',
  'feriado','véspera de feriado');

var
  F_transferenciadeconta: TF_transferenciadeconta;
	apto_origem, apto_destino: string;
  entrada: TDateTime;
  tolerancia : Integer;
  HORA, VALOR_HR, VALOR_HE, VALOR_P, VALOR_D,
  VALOR_24H: double;

implementation

uses
	md_utilities, md_diarias, md_firedac;

{$R *.dfm}

procedure TF_transferenciadeconta.FormShow(Sender: TObject);
begin
	F_transferenciadeconta.Caption := 'PSI-HOTEL v'+dm_firedac.T_empresaVERSAO.Value+' - TRANSFERÊNCIA DE CONTA';
  bt_OK.Enabled := FALSE;
  ed_apto.SetFocus;
end;

procedure TF_transferenciadeconta.processo(opcao: byte);
begin
	case opcao of
  02: with dm_firedac do
			begin
        if T_apartamentosCHV_D.Value <> 'LIVRE' then
        begin
          ShowMessage('Atenção! Apto não disponível para transferência. '+#10#13+
          'Selecione outro Apto ou cancele esta transferência');
          bt_cancelar.SetFocus;
          EXIT;
        end;

        if MsgDlg('Confirma transferência para apto selecionado?', mtConfirmation, mbYesNo) <> mrYes then
        begin
          bt_cancelar.SetFocus;
	        EXIT;
        end else
        begin
        	apto_origem := T_diariasAP.Value;

          T_diarias.Edit;
  	      T_diariasAP.Value := T_apartamentosAPTO.Value;
					T_diarias.Post;

          apto_destino := T_diariasAP.Value;

					{ libera o apto de origem }

	        if T_apartamentos.Locate('APTO', apto_origem, []) then
  	      begin
            T_apartamentos.Edit;
      	    T_apartamentosDIARIA.Value := '' ;
        	  T_apartamentosCHV_D.Value :='LIVRE';
						T_apartamentos.Post;
	        end;

          { marca ocupação no apto de destino }

          if T_apartamentos.Locate('APTO', apto_destino, []) then
          begin
            T_apartamentos.Edit;
  	        T_apartamentosDIARIA.Value := T_diariasCONTA.Value;
    	      T_apartamentosCHV_D.Value := T_diariasTIPO.Value;
						T_apartamentos.Post;

            { apura valores 2HS, HE, VALOR_P(PERNOITE) e VALOR_D(DIARIA) de acordo com o dia da semana
            em que a conta está sendo gerada, e compara data atual com a tabela de feriados}

		        entrada := Time;  HORA := 0; VALOR_HE := 0; VALOR_P := 0; VALOR_D := 0; VALOR_24H := 0;
		        ctd := T_diariasDS.asInteger;

            if ctd in [2,3,4,5] then
            begin { se estiver contida na faixa de segunda a quinta - Tarifa A}
              VALOR_HR  := T_apartamentosVALOR_HR1.Value;
              VALOR_HE  := T_apartamentosVALOR_HE1.Value;
              VALOR_P   := T_apartamentosVALOR_P1.Value ;
              VALOR_D   := T_apartamentosVALOR_D1.Value ;
              VALOR_24H := T_apartamentosDIARIA_24H1.Value;
            end else
            if ctd in [6,7,1,8,9] then
            begin   { se for sexta, sábado, domingo, feriado ou véspera de feriado - Tarifa B }
              VALOR_HR  := T_apartamentosVALOR_HR2.Value;
              VALOR_HE  := T_apartamentosVALOR_HE2.Value;
              VALOR_P   := T_apartamentosVALOR_P2.Value ;
              VALOR_D   := T_apartamentosVALOR_D2.Value ;
              VALOR_24H := T_apartamentosDIARIA_24H2.Value;
            end else { se for segunda até 4:00hs da manhã - Tarifa B}
            if (ctd = 2) and (entrada <= StrToTime('04:00:00')) then
            begin
              VALOR_HR :=	T_apartamentosVALOR_HR2.Value;
              VALOR_HE := T_apartamentosVALOR_HE2.Value;
              VALOR_P := T_apartamentosVALOR_P2.Value ;
              VALOR_D := T_apartamentosVALOR_D2.Value ;
              VALOR_24H := T_apartamentosDIARIA_24H2.Value;
            end else  { se for sexta até 4:00hs da manhã - Tarifa A }
            if (ctd = 5) and (entrada <= StrToTime('04:00:00')) then
            begin
              VALOR_HR :=	T_apartamentosVALOR_HR1.Value;
              VALOR_HE := T_apartamentosVALOR_HE1.Value;
              VALOR_P := T_apartamentosVALOR_P1.Value ;
              VALOR_D := T_apartamentosVALOR_D1.Value ;
              VALOR_24H := T_apartamentosDIARIA_24H1.Value;
            end;

            { VR_LOCACAO recebe conforme o tipo de locação selecionada por ed_tipo }

            T_diarias.Edit;
            case ed_tipo.ItemIndex of
            0:	begin
                  T_diariasVR_LOCACAO.Value := VALOR_HR;
                  T_diariasHR_FRANQUIA.Value := StrToTime('01:00:00');
                end;
            1: 	begin
                  T_diariasVR_LOCACAO.Value := VALOR_P;
                  if (entrada >= StrToTime('19:00:00')) and (entrada <= StrToTime('23:59:59')) then
                  T_diariasHR_FRANQUIA.Value := (StrToTime('23:59:59') - Time) + StrToTime('12:00:00') else
                  if (entrada >= StrToTime('00:00:00'))  and (entrada <= StrToTime('04:00:00')) then
                  T_diariasHR_FRANQUIA.Value := (StrToTime('12:00:00') - Time);
                end;
            2:	begin
                   T_diariasVR_LOCACAO.Value := VALOR_D;
                  if (entrada >= StrToTime('04:00:00')) and (entrada <= StrToTime('17:00:00')) then
                  T_diariasHR_FRANQUIA.Value := (StrToTime('17:00:00') - Time);
                end;
            3: 	begin
                  T_diariasVR_LOCACAO.Value := VALOR_24H;
                  T_diariasHR_FRANQUIA.Value := StrToTime('23:59:59');
                end;
            end;
            T_diariasVR_HE.Value := VALOR_HE;
            T_diarias.Post;
        	end;
	        bt_ok.Enabled := TRUE;
  	      bt_ok.SetFocus;
        end;
      end;

  08: with dm_firedac do
  		begin
        T_diarias.Edit;
   	    T_diariasCHV.value := 'T';
        case T_empresaSAIDA_I.Value of
        1,5: F_diarias.processo(22);
        end;
        T_diariasCHV.value := 'A';
        T_diarias.Post;
        CLOSE;
      end;

  09: with dm_firedac do
      begin
        if T_diarias.State in [dsInsert,dsEdit] then T_diarias.Cancel;
        CLOSE;
      end;
  end;
end;

procedure TF_transferenciadeconta.processar_evento(Sender: TObject);
begin
	if Sender = bt_ok	then processo(08) else
  if Sender = bt_cancelar	then processo(09);
end;

procedure TF_transferenciadeconta.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	case Key of
  VK_F8 :	processo(08);
  VK_F9 : processo(09);
  end;
end;

procedure TF_transferenciadeconta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_transferenciadeconta.Grid_1CellClick(Column: TColumn);
begin
	processo(02)
end;

procedure TF_transferenciadeconta.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_transferenciadeconta);
end;

end.

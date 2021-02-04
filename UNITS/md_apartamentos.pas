unit md_apartamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Db,
  Printers, OleCtrls;

type
  TF_apartamentos = class(TForm)
    Label2: TLabel;
    ed_apto: TDBEdit;
    Label3: TLabel;
    ed_descricao: TDBMemo;
    Label13: TLabel;
    ed_HoraExcedenteA: TDBEdit;
    Label4: TLabel;
    ed_pernoiteA: TDBEdit;
    Label10: TLabel;
    ed_diariaA: TDBEdit;
    Label11: TLabel;
    ed_disponibilidade: TDBComboBox;
    Grid_1: TDBGrid;
    ed_contaemaberto: TDBEdit;
    Label12: TLabel;
    Label6: TLabel;
    ed_2horasA: TDBEdit;
    Label1: TLabel;
    ed_24horasA: TDBEdit;
    ed_HoraExcedenteB: TDBEdit;
    ed_2horasB: TDBEdit;
    ed_pernoiteB: TDBEdit;
    ed_diariaB: TDBEdit;
    ed_24horasB: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    ed_tabela: TDBRadioGroup;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    DBNavigator_1: TDBNavigator;
    bt_ok: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_fechar: TBitBtn;
    ds_apartamentos: TDataSource;
    Label8: TLabel;
    ed_franquia: TDBEdit;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_apartamentosDataChange(Sender: TObject; Field: TField);
    procedure ed_disponibilidadeExit(Sender: TObject);
    procedure Grid_1TitleClick(Column: TColumn);
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
  F_apartamentos: TF_apartamentos;

  chv,nrg: string;
  x,y: integer;

implementation

uses
	md_utilities, md_firedac;

{$R *.DFM}

procedure TF_apartamentos.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
	  F_apartamentos.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - CADASTRO DE APARTAMENTOS';
  	T_apartamentos.First;
  end;
  bt_status(0); Grid_1.SetFocus;
end;

procedure TF_apartamentos.bt_status(opcao: byte);
begin
	if opcao = 0 then
  begin
    bt_incluir.enabled	 	:= true ;
    bt_excluir.enabled 		:= true ;
    bt_imprimir.enabled 	:= true ;
	  bt_ok.enabled 		    := FALSE;
  	bt_cancelar.enabled		:= FALSE;
    bt_fechar.enabled 		:= true ;
 	end else
  if opcao = 1 then
  begin
    bt_incluir.enabled  	:= false;
    bt_excluir.enabled  	:= false;
    bt_imprimir.enabled 	:= false;
	  bt_ok.enabled   	    := TRUE	;
  	bt_cancelar.enabled 	:= TRUE ;
    bt_fechar.enabled			:= false;
  end;
end;

procedure TF_apartamentos.Processo(opcao: byte);
var
  x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,
  TC1,TC2,TC3: string;
  VR_HR1, VR_P1,VR_D1,VR_24H1, VR_HE1,
  VR_HR2, VR_P2,VR_D2,VR_24H2, VR_HE2: double;
  dsc,linha,chv: string;
  MyTXT: TextFile;

  procedure listagem_aptos;
  begin
    with dm_firedac do
    begin
      TC1 := T_empresaEMPRESA.Value;
      TC2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      TC3 := 'CONTROLE DE DIARIAS - v'+trim(T_empresaVERSAO.Value);

      Writeln(MyTXT,TC1); Writeln(MyTXT,TC2); Writeln(MyTXT,TC3);
      Writeln(MyTXT,'LISTAGEM DE APARTAMENTOS');

			T_apartamentos.FIRST; y := 8;

		  while not T_apartamentos.EOF do
	  	begin
        x01	:= T_apartamentosAPTO.Value;
        x02 := FloatToStrF(T_apartamentosVALOR_HR1.Value,   ffCurrency,6,2);
        x03 := FloatToStrF(T_apartamentosVALOR_HR2.Value,   ffCurrency,6,2);
        x04 := FloatToStrF(T_apartamentosVALOR_P1.Value,    ffCurrency,6,2);
        x05 := FloatToStrF(T_apartamentosVALOR_P2.Value,    ffCurrency,6,2);
        x06 := FloatToStrF(T_apartamentosVALOR_D1.Value,    ffCurrency,6,2);
        x07 := FloatToStrF(T_apartamentosVALOR_D2.Value,    ffCurrency,6,2);
        x08 := FloatToStrF(T_apartamentosDIARIA_24H1.Value, ffCurrency,6,2);
        x09 := FloatToStrF(T_apartamentosDIARIA_24H2.Value, ffCurrency,6,2);
        x10 := FloatToStrF(T_apartamentosVALOR_HE1.Value,   ffCurrency,6,2);
        x11 := FloatToStrF(T_apartamentosVALOR_HE2.Value,   ffCurrency,6,2);

        Writeln(MyTXT,'Apto '+x01+' | ');
//                    R$ 00,00   R$ 00,00   R$ 00,00   R$ 00,00   R$ 00,00
        Writeln(MyTXT,'HORA     | PERNOITE | DIARIA   | 24HS     | H.EXCED. ');
	 			Writeln(MyTXT,x02+' | '+x04+' | '+x06+' | '+x08+' | '+x10);
        Writeln(MyTXT,x03+' | '+x05+' | '+x07+' | '+x09+' | '+x11);

    		T_apartamentos.NEXT;
      end;

      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
  //  Writeln(MyTXT,#15); // modo impressão condensado
  //  Writeln(MyTXT,#18); // modo impressão normal
  //  Writeln(MyTXT,#12); // ejeta a página
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');

      // fim de impressão - caixa
      T_apartamentos.FIRST;
    end;
  end;

begin
	case opcao of
  01:	with dm_firedac do
  		begin
        T_apartamentos.IndexFieldNames := 'APTO';
        T_apartamentos.LAST;
        if T_apartamentos.RecordCount = 0 then chv:='1' else chv:=trim(IntToStr((StrToInt(T_apartamentosAPTO.Value)+1)));
        while length(chv) < 2 do chv := '0'+ chv;

        VR_HR1  := T_apartamentosVALOR_HR1.Value;
        VR_HR2  := T_apartamentosVALOR_HR2.Value;
  	    VR_P1   := T_apartamentosVALOR_P1.Value;
				VR_P2   := T_apartamentosVALOR_P2.Value;
  	    VR_D1   := T_apartamentosVALOR_D1.Value;
				VR_D2   := T_apartamentosVALOR_D2.Value;
        VR_24H1 := T_apartamentosDIARIA_24H1.Value;
        VR_24H2	:= T_apartamentosDIARIA_24H2.Value;
  	    VR_HE1  := T_apartamentosVALOR_HE1.Value;
        VR_HE2	:= T_apartamentosVALOR_HE2.Value;
        dsc     := T_apartamentosDESCRICAO.Value;

        T_apartamentos.Insert;
        T_apartamentosAPTO.asString 		:= chv;

        T_apartamentosVALOR_HR1.Value   := VR_HR1;
        T_apartamentosVALOR_HR2.Value   := VR_HR2;
        T_apartamentosVALOR_P1.Value    := VR_P1;
        T_apartamentosVALOR_P2.Value    := VR_P2;
        T_apartamentosVALOR_D1.Value    := VR_D1;
        T_apartamentosVALOR_D2.Value    := VR_D2;
        T_apartamentosDIARIA_24H1.Value := VR_24H1;
        T_apartamentosDIARIA_24H2.Value := VR_24H2;
  	    T_apartamentosVALOR_HE1.Value   := VR_HE1;
        T_apartamentosVALOR_HE2.Value   := VR_HE2;

        T_apartamentosDESCRICAO.Value 	:= dsc;
    	  T_apartamentosCHV_D.Value 			:= 'LIVRE';
        T_apartamentosDIARIA.Value 			:= '';
        bt_status(1);
        ed_apto.SetFocus;
	    end;

  02:	with dm_firedac do
  		begin
        if MsgDlg('Deseja excluir este Apartamento?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
        if T_apartamentos.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
          Grid_1.SetFocus;
        end else
        begin
	        T_apartamentos.Delete;
  	      Grid_1.SetFocus;
        end;
	  	end;

  03:	with dm_firedac do
  		begin
				T_apartamentos.Post;
        bt_status(0); Grid_1.SetFocus;
	  	end;

	04:	with dm_firedac do
  		begin
				T_apartamentos.Cancel;
        bt_status(0); Grid_1.SetFocus;
  		end;

  05:	with dm_firedac do
  		begin
        if MsgDlg('Imprimir listabem de Apartamentos?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
        begin
          AssignFile(MyTXT, T_empresaPATH_1.AsString+'TABELA DE PREÇOS - APARTAMENTOS.TXT');
          Rewrite(MyTXT);
          listagem_aptos;
          CloseFile(MyTXT);
          // imprime em Generic Text Only
          if T_empresaSAIDA_I.Value = 5 then
          begin
            AssignFile(MyTXT,'LPT1');
            Rewrite(MyTXT);
            listagem_aptos;
            CloseFile(MyTXT);
          end;
          Grid_1.SetFocus;
        end;
  		end;

  07:	CLOSE;

  end;
end;

procedure TF_apartamentos.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir		then processo(01) else
	if Sender = bt_excluir		then processo(02) else
  if Sender = bt_imprimir		then processo(05) else
	if Sender = bt_ok   			then processo(03) else
	if Sender = bt_cancelar		then processo(04) else
	if Sender = bt_fechar	 		then processo(07);
end;

procedure TF_apartamentos.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_F2 : Processo(01);
  VK_F3 : Processo(02);
  VK_F5 : Processo(05);
  VK_F7 : Processo(03);
  VK_F8 : Processo(04);
  VK_F10: Processo(07);
  end;
end;

procedure TF_apartamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_apartamentos.ed_disponibilidadeExit(Sender: TObject);
begin
  with dm_firedac do
  begin
    if T_apartamentos.state in [dsInsert,dsEdit] then
    begin
      if T_apartamentosCHV_D.Value = 'LIVRE' then
      T_apartamentosDIARIA.Value := '' ;
    end;
  end;
end;

procedure TF_apartamentos.Grid_1TitleClick(Column: TColumn);
begin
  dm_firedac.T_apartamentos.IndexFieldNames := Column.FieldName;
end;

procedure TF_apartamentos.ds_apartamentosDataChange(Sender: TObject; Field: TField);
begin
  if ds_apartamentos.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_apartamentos.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_apartamentos);
end;

end.


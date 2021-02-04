unit md_feriados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  Grids, DBGrids, Mask, Printers, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TF_feriados = class(TForm)
    Label13: TLabel;
    ed_data: TDBEdit;
    Label2: TLabel;
    ed_evento: TDBEdit;
    Grid_1: TDBGrid;
    DBNavigator_1: TDBNavigator;
    bt_incluir: TSpeedButton;
    bt_excluir: TSpeedButton;
    bt_imprimir: TSpeedButton;
    bt_ok: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_fechar: TSpeedButton;
    ds_feriados: TDataSource;
    bt_atualizar: TSpeedButton;
    Calendar_1: TMonthCalendar;

    procedure FormShow(Sender: TObject);
    procedure bt_status(opcao: byte);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_feriadosDataChange(Sender: TObject; Field: TField);
    procedure Grid_1TitleClick(Column: TColumn);
    procedure bt_atualizarClick(Sender: TObject);
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
  F_feriados: TF_feriados;

	linha,chv: string;
  x,y: integer;

implementation

uses
	md_utilities, md_firedac;

{$R *.dfm}

procedure TF_feriados.FormShow(Sender: TObject);
begin
	with dm_firedac do
  begin
   	F_feriados.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.AsString+' - TABELA DE FERIADOS';
  	T_feriados.First;
    Calendar_1.Date := now;
  end;
  bt_status(0); Grid_1.SetFocus;
end;

procedure TF_feriados.bt_status(opcao: byte);
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

procedure TF_feriados.processo(opcao: byte);
var
	x01: string[05]; { DATA    }
  x02: string[28]; { FERIADO }

  cb_1,cb_2,cb_3: string;

	procedure xy(x,y: integer; s: string);
	begin
    Printer.Canvas.TextOut(x*10,y*32,s); { Para teste em arquivo (video) ajustar p/ y*120, valor default: y*20}
  end;

  procedure imprime_cb;
  begin
		with dm_firedac do
    begin
      cb_1 := T_empresaEMPRESA.value;
      cb_2 := T_empresaENDERECO.value;
      cb_3 := 'CONTROLE DE DIARIAS - v'+T_empresaVERSAO.value;
      xy(1,1,cb_1); xy(1,2,cb_2); xy(1,3,cb_3);
      xy(1,4,'========================================');
		end;
  end;

begin
	case opcao of
  01:	with dm_firedac do
  		begin
				T_feriados.IndexFieldNames := 'DATA';
		    T_feriados.Insert;
        T_feriadosDT_EVENTO.value := date;
        T_feriadosFERIADO.value := '';
        T_feriadosCHV.value := 'A';
        T_feriados.Post;
        ed_data.SetFocus;
	    end;

  02:	with dm_firedac do
  		begin
        if MsgDlg('Deseja excluir esta Data?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        if T_feriados.RecordCount = 0 then
        begin
          ShowMessage('Arquivo não contém dados!');
          Grid_1.SetFocus;
        end else
        begin
	        T_feriados.Delete;
  	      Grid_1.SetFocus;
        end;
	  	end;

  03:	with dm_firedac do
  		begin
				T_feriados.Post;
        bt_status(0); Grid_1.SetFocus;
	  	end;

	04:	with dm_firedac do
  		begin
				T_feriados.Cancel;
        bt_status(0); Grid_1.SetFocus;
  		end;

  05:	with dm_firedac do
  		begin
        if MsgDlg('Imprimir listagem de Feriados?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        begin
					Printer.Orientation:=poPortrait;
			    Printer.Canvas.Font.Name := 'Draft 12cpi';
          Printer.BeginDoc;

					imprime_cb;

				  xy(1,06,'LISTAGEM - FERIADOS NACIONAIS');
          xy(1,08,'DATA       FERIADO');

					T_feriados.FIRST; y := 10;

				  while T_feriados.EOF = False do
			  	begin
				 		x01	:= T_feriadosDT_EVENTO.asstring;
         		x02	:= T_feriadosFERIADO.value;
	 					xy(1,y,x01); xy(12,y,x02);
    				T_feriados.NEXT; y := y + 1;
				  end;

				  xy(1,y+1,'========================================');
          xy(1,y+2,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');

				 	Printer.EndDoc; T_feriados.FIRST;
          Grid_1.SetFocus;
        end;
  		end;

  07: CLOSE;

  end;
end;

procedure TF_feriados.processar_evento(Sender: TObject);
begin
	if Sender = bt_incluir		then processo(01) else
	if Sender = bt_excluir		then processo(02) else
  if Sender = bt_imprimir		then processo(05) else
	if Sender = bt_ok   			then processo(03) else
	if Sender = bt_cancelar		then processo(04) else
	if Sender = bt_fechar	 		then processo(07);
end;

procedure TF_feriados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TF_feriados.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_feriados.Grid_1TitleClick(Column: TColumn);
begin
	dm_firedac.T_feriados.IndexFieldNames := Column.FieldName;
end;

procedure TF_feriados.bt_atualizarClick(Sender: TObject);
var
	ano_atual: string;
begin
  if MsgDlg('Confirma atualização do ano corrente na Tabela de Feriados?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
  begin
    ano_atual := IntToStr(YearOf(Now()));
    linha := 'UPDATE T_FERIADOS SET DT_EVENTO = CONCAT('''+ano_atual+'-'', date_format(DT_EVENTO, ''%m-%d''))';
    with dm_firedac do
    begin
      q_feriados.DisableControls;
      q_feriados.Close;
      q_feriados.SQL.text := linha;
      q_feriados.ExecSQL;
      q_feriados.EnableControls;
    end;
    ShowMessage('Tabela de Feriados atualizada para '+ano_atual);
    Grid_1.Refresh; Grid_1.SetFocus;
  end;
end;

procedure TF_feriados.ds_feriadosDataChange(Sender: TObject; Field: TField);
begin
  if ds_feriados.State in [dsInsert,dsEdit] then
  bt_status(1);
end;

procedure TF_feriados.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_feriados);
end;

end.

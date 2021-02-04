unit md_diarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Db,
  Printers, Menus, ShellAPI, jpeg, Tabs, OleCtrls, DateUtils, Gauges,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_diarias = class(TForm)
    Timer_DH: TTimer;
    Panel_C: TPanel;
    Label18: TLabel;
    PageControl_1: TPageControl;
    TabSheet_1: TTabSheet;
    TabSheet_2: TTabSheet;
    Panel_2: TPanel;
    DBNavigator_2: TDBNavigator;
    ed_buscar: TMaskEdit;
    bt_buscarconta: TBitBtn;
    TabSheet_3: TTabSheet;
    Panel_3: TPanel;
    bt_imprimirresumodecaixa: TBitBtn;
    DBNavigator_3: TDBNavigator;
    bt_revisarcaixa: TBitBtn;
    Grid_3: TDBGrid;
    bt_enviararquivo: TBitBtn;
    bt_relatorio: TBitBtn;
    Label_OP: TStaticText;
    Grid_2: TDBGrid;
    Timer_HU: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    bt_login: TSpeedButton;
    bt_abrirturno: TSpeedButton;
    bt_estoque: TSpeedButton;
    Label2: TLabel;
    bt_coletas: TSpeedButton;
    bt_entregas: TSpeedButton;
    Label1: TLabel;
    bt_fecharturno: TSpeedButton;
    Label3: TLabel;
    background_tarde: TImage;
    background_noite: TImage;
    ds_diarias: TDataSource;
    ds_pedidos: TDataSource;
    ds_caixa: TDataSource;
    ds_empresa: TDataSource;
    ds_apartamentos: TDataSource;
    query_diarias: TFDQuery;
    Query_T1: TFDQuery;
    Query_T2: TFDQuery;
    query_diariasFICHA: TFDAutoIncField;
    query_diariasCONTA: TStringField;
    query_diariasAP: TStringField;
    query_diariasTIPO: TStringField;
    query_diariasDS: TSmallintField;
    query_diariasDT_ENTRADA: TDateField;
    query_diariasDT_SAIDA: TDateField;
    query_diariasHR_ENTRADA: TTimeField;
    query_diariasHR_SAIDA: TTimeField;
    query_diariasRC_ENTRADA: TStringField;
    query_diariasRC_SAIDA: TStringField;
    query_diariasCX_ENTRADA: TStringField;
    query_diariasCX_SAIDA: TStringField;
    query_diariasHR_USO: TTimeField;
    query_diariasHR_FRANQUIA: TTimeField;
    query_diariasHR_EXCEDENTES: TTimeField;
    query_diariasVR_LOCACAO: TFloatField;
    query_diariasVR_HE: TFloatField;
    query_diariasVR_HORASEXCEDENTES: TFloatField;
    query_diariasVR_HORASUSO: TFloatField;
    query_diariasVR_PEDIDOS: TFloatField;
    query_diariasVR_EXTRAS: TFloatField;
    query_diariasVR_DESCONTO: TFloatField;
    query_diariasVR_TOTAL: TFloatField;
    query_diariasRC_CE: TFloatField;
    query_diariasRC_DE: TFloatField;
    query_diariasVR_ENTRADA: TFloatField;
    query_diariasRC_CS: TFloatField;
    query_diariasRC_DS: TFloatField;
    query_diariasVR_SAIDA: TFloatField;
    query_diariasRC_CARTAO: TFloatField;
    query_diariasRC_DINHEIRO: TFloatField;
    query_diariasVR_RECEBIDO: TFloatField;
    query_diariasVR_TROCO: TFloatField;
    query_diariasDF_TROCO: TFloatField;
    query_diariasCAIXA: TStringField;
    query_diariasCHECK_OUT: TStringField;
    query_diariasCHV: TStringField;
    Calendar_1: TMonthCalendar;
    Label_DH: TLabel;
    Label_DS: TLabel;
    Label_US: TLabel;
    Label_DT: TLabel;
    background_dia: TImage;
    bt_copa: TSpeedButton;
    bt_ejetar: TSpeedButton;
    bt_atualizarbackup: TSpeedButton;
    bt_suporte: TSpeedButton;
    Panel_1: TPanel;
    Grid_1: TDBGrid;
    bt_abrirconta: TSpeedButton;
    bt_fecharconta: TSpeedButton;
    bt_transferir: TSpeedButton;
    bt_liberar: TSpeedButton;
    bt_revisarconta: TSpeedButton;
    bt_excluirconta: TSpeedButton;
    DBNavigator_1: TDBNavigator;
    bt_fechar: TSpeedButton;
    Label4: TLabel;

    procedure FormShow(Sender: TObject);
    procedure atualiza_background;
    procedure atualiza_mostradores;
    procedure atualiza_backup;
    procedure Timer_DHTimer(Sender: TObject);
		procedure processo(opcao: byte);
    procedure processar_evento(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure PageControl_1Change(Sender: TObject);
    procedure Grid_3DblClick(Sender: TObject);
    procedure Grid_3TitleClick(Column: TColumn);
    procedure Grid_2TitleClick(Column: TColumn);
    procedure bt_calculadoraClick(Sender: TObject);
    procedure Grid_1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Grid_2DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid_1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
	  USR,acesso: string;
    IDC: byte;
  end;

const
	SIM = 1;
  NAO = 0;

	dia_semana: array[1..9] of string = (
  'Domingo','Segunda-feira','Terça-feira',  'Quarta-feira','Quinta-feira','Sexta-feira',
  'Sábado','Feriado: ','Véspera de Feriado: ');

var
  F_diarias	: TF_diarias;
  T_dias, T_horas, T_minutos: real;
	T_uso: TTime;
  aa, mm, dd, hh, mi, ss, ms: word;
  ctd,x,y,pag,I: integer;
  cmd,par,dir: array[0..79] of char;
  q1,q2,q3,
  linha,chv: string;
  MyTXT: TextFile;

implementation

uses
  md_utilities, md_login,
  md_aberturadeponto, md_fechamentodeponto,
  md_aberturadeconta, md_fechamentodeconta, md_transferenciadeconta, md_comandas, md_editardiaria, md_resumodaconta,
  md_rouparia, md_coletas, md_entregas, md_resumodecaixa,
  md_firedac;

{$R *.DFM}

procedure TF_diarias.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_diarias.Caption := 'PSI-HOTEL v'+trim(T_empresaVERSAO.Value)+' - '+T_empresaEMPRESA.Value;
    T_diarias.IndexFieldNames := 'CONTA';
    T_diarias.Last;
    T_caixa.Last;
    T_apartamentos.First;
    PageControl_1.ActivePage := TabSheet_1;
    TabSheet_2.Visible := False;
    TabSheet_3.Visible := False;
    Label_US.Caption := 'USUÁRIO LOGADO: '+F_login.USR+' - ACESSO: '+acesso;
    Calendar_1.Date := Now;
    atualiza_mostradores;
    atualiza_background;
    Panel_1.Left := (Screen.Width-Panel_1.Width) - 50;
    Panel_1.Top  := ((Screen.Height-Panel_1.Height)-Panel_C.Height-20) div 2;
    Grid_1.SetFocus;
	end;
end;

procedure TF_diarias.atualiza_background;
var
  HH, MM, SS, MS: Word;
begin
  DecodeTime(Now, HH, MM, SS, MS);
  if HH in [6,7,8,9,10,11,12,14,15] then
  begin
    Label_DH.Font.Color := clBlack;
    Label_DS.Font.Color := clBlack;
    Label_US.Font.Color := clBlack;
    background_dia.Visible    := True;
    background_tarde.Visible  := False;
    background_noite.Visible  := False;
  end;
  if HH in [15,16,17,18,19] then
  begin
    Label_DH.Font.Color := clLime;
    Label_DS.Font.Color := clAqua;
    Label_US.Font.Color := clAqua;
    background_dia.Visible    := False;
    background_tarde.Visible  := True;
    background_noite.Visible  := False;
  end;
  if HH in [19,20,21,22,23,0,1,2,3,4,5] then
  begin
    Label_DH.Font.Color := clYellow;
    Label_DS.Font.Color := clWhite;
    Label_US.Font.Color := clWhite;
    background_dia.Visible    := False;
    background_tarde.Visible  := False;
    background_noite.Visible  := True;
  end;
  F_diarias.Refresh;
end;

procedure TF_diarias.atualiza_mostradores;
begin
	with dm_firedac do
  begin
    if T_feriados.Locate('DT_EVENTO',DateToStr(date+1),[loPartialKey]) then
    Label_DS.Caption := dia_semana[9]+' '+T_feriadosFERIADO.Value else
    if T_feriados.Locate('DT_EVENTO',DateToStr(date), [loPartialKey]) then
    Label_DS.Caption := dia_semana[8]+' '+T_feriadosFERIADO.Value else
    Label_DS.Caption := dia_semana[DayOfWeek(date)];
  end;

  Label_DT.Caption := DateToStr(date());

  case F_login.IDC of
  0:acesso := 'LIMITADO';
  1:acesso := 'OPERACIONAL';
  3:acesso := 'RESTRITO';
  7:acesso := 'GERÊNCIA';
  9:acesso := 'ADMINISTRADOR';
  end;

  Label_US.Caption := 'USUÁRIO: '+F_login.USR+' - ACESSO: '+acesso;
  Label_OP.Caption := F_login.USR;
  Calendar_1.Date := Now;
  F_diarias.Refresh;
end;

procedure TF_diarias.atualiza_backup;
begin
  try
    chv:=DateTimeToStr(Now); chv:=Extract_N(chv); chv:=copy(chv,1,8)+'-'+copy(chv,9,4);
    AssignFile(MyTXT,'backup.bat');
    Rewrite(MyTXT);
    Writeln(MyTXT,'@ECHO OFF');
    Writeln(MyTXT,'mysql\mysqlcheck -uroot psihotel_vip --auto-repair');
    Writeln(MyTXT,'mysql\mysqldump -uroot psihotel_vip > backup\'+chv+'.sql');
    Writeln(MyTXT,'dir backup\');
    Writeln(MyTXT,'ver');
    CloseFile(MyTXT);

    cmd := 'backup.bat';
    strpcopy(dir,GetCurrentDir);
    strpcopy(par,'');
    shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_hide);
  finally
//  ShowMessage('Arquivo de Backup atualizado com sucesso!');
  end;
end;

procedure TF_diarias.Timer_DHTimer(Sender: TObject);
var
  myDT: TDateTime;
  formattedDT: string;
begin
  myDT := Now;
	DateTimeToString(formattedDT, 'dd/mm/yyyy hh:nn:ss', myDT);
  Label_DT.Caption := copy(formattedDT,1,10);
  Label_DH.Caption := copy(formattedDT,12,9);
  if Label_DH.Caption = '00:00:00' then atualiza_mostradores;
  if Label_DH.Caption = '07:00:00' then
  begin
    atualiza_background;
    atualiza_backup;
  end;
  if Label_DH.Caption = '15:00:00' then
  begin
    atualiza_background;
    atualiza_backup;
  end;
  if Label_DH.Caption = '23:00:00' then
  begin
    atualiza_background;
    atualiza_backup;
  end;
end;

procedure TF_diarias.processo(opcao: byte);
var
	x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,
  x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,
  x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,
  dte,dts,rce,rcs,vrc,trc: string;
  soma_d,soma_c,dif_d,dif_c,t_recebido, t_liq: Double;
  TC1,TC2,TC3: string[42];
  F,anexo: string;

	procedure xy(x,y: integer; s: string);
	begin
    case dm_firedac.T_empresaSAIDA_I.value of
    1:Printer.Canvas.TextOut(x*10,y*10,s); { matricial }
    5:Printer.Canvas.TextOut(x*10,y*01,s); { genérica }
    end;
  end;

  procedure impressao_canhoto;
  begin
    with dm_firedac do
    begin
      // variáveis de impressão
      TC1 := T_empresaEMPRESA.Value;
      TC2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      TC3 := 'CONTROLE DE DIARIAS - v7.0';

      x01	:= T_diariasCONTA.AsString			; x01 := Insert_L(x01,10,#32);
      x02	:= T_diariasAP.AsString					; x02 := Insert_L(x02,10,#32);
      rce	:= T_diariasRC_ENTRADA.AsString	; rce := Insert_L(rce,10,#32);
      dte	:= T_diariasDT_ENTRADA.AsString	; dte := Insert_L(dte,10,#32);
      x05	:= T_diariasHR_ENTRADA.AsString	; x05 := Insert_L(x05,10,#32);
      if T_diariasCHV.AsString = 'A' then x07 := 'ABERTA' else
      if T_diariasCHV.AsString = 'F' then x07 := 'FECHADA' else
      if T_diariasCHV.AsString = 'T' then x07 := 'TRF'; x07 := Insert_L(x07,10,#32);
      x10 := T_diariasTIPO.AsString 			; x10 := Insert_L(x10,10,#32);
      x11 := Copy(FloatToStrF(T_diariasVR_LOCACAO.Value,ffCurrency,10,2),3,7); x11 := Insert_L(x11,7,#32);
      x12 := Copy(FloatToStrF(T_diariasRC_DE.Value,			ffCurrency,10,2),3,7); x12 := Insert_L(x12,7,#32);
      x13 := Copy(FloatToStrF(T_diariasRC_CE.Value,			ffCurrency,10,2),3,7); x13 := Insert_L(x13,7,#32);
      x14 := Copy(FloatToStrF(T_diariasVR_ENTRADA.Value,ffCurrency,10,2),3,7); x14 := Insert_L(x14,7,#32);

      Writeln(MyTXT,TC1); Writeln(MyTXT,TC2); Writeln(MyTXT,TC3);
      Writeln(MyTXT,'CONTA N.                       : '+x01);
      Writeln(MyTXT,'QUARTO/SUITE                   : '+x02);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'DATA DE ENTRADA                : '+dte);
      Writeln(MyTXT,'HORARIO DE ENTRADA             : '+x05);
      Writeln(MyTXT,'RECEPCAO                       : '+rce);
      Writeln(MyTXT,'SITUACAO DA CONTA              : '+x07);
      Writeln(MyTXT,'TIPO DE LOCACAO                : '+x10);
      Writeln(MyTXT,'VALOR DA LOCACAO               : R$ '+x11);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'VALOR RECEBIDO EM DINHEIRO     : R$ '+x12);
      Writeln(MyTXT,'VALOR RECEBIDO EM CARTAO       : R$ '+x13);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL RECEBIDO NA ENTRADA      : R$ '+x14);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
  //  Writeln(MyTXT,#12); // ejeta a página
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');

      // fim de impressão
    end;
  end;

  procedure impressao_conta;
  var
    I: Integer;
  begin
    with dm_firedac do
    begin
      // variáveis de impressão

      TC1 := T_empresaEMPRESA.Value;
      TC2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      TC3 := 'CONTROLE DE DIARIAS - v'+trim(T_empresaVERSAO.Value);
      x01	:= T_diariasCONTA.value		  		  ; x01 := Insert_L(x01,10,#32);
      x02	:= T_diariasAP.value						  ; x02 := Insert_L(x02,10,#32);
      rce	:= T_diariasRC_ENTRADA.value 		  ; rce := Insert_L(rce,10,#32);
      dte	:= T_diariasDT_ENTRADA.asstring	  ; dte := Insert_L(dte,10,#32);
      x03	:= T_diariasHR_ENTRADA.asstring	  ; x03 := Insert_L(x03,10,#32);
      rcs	:= T_diariasRC_SAIDA.value   		  ; rcs := Insert_L(rcs,10,#32);
      dts	:= T_diariasDT_SAIDA.asstring 	  ; dts := Insert_L(dts,10,#32);
      x04	:= T_diariasHR_SAIDA.asstring		  ; x04 := Insert_L(x04,10,#32);
      x05 := T_diariasHR_USO.asstring			  ; x05 := Insert_L(x05,10,#32);
      x06 := T_diariasHR_EXCEDENTES.AsString; x06 := Insert_L(x06,10,#32);
      x07 := T_diariasTIPO.value					  ; x07 := Insert_L(x07,10,#32);
      x16 := Copy(FloatToStrF(T_diariasVR_LOCACAO.Value,ffCurrency , 10,2),3,7); x16 := Insert_L(x16,7,#32);
      x09 := Copy(FloatToStrF(T_diariasVR_HORASEXCEDENTES.Value,ffCurrency,10,2),3,7); x09 := Insert_L(x09,7,#32);
      x08 := Copy(FloatToStrF(T_diariasVR_HORASUSO.Value,ffCurrency, 10,2),3,7); x08 := Insert_L(x08,7,#32);
      x10 := Copy(FloatToStrF(T_diariasVR_EXTRAS.value,ffCurrency  , 10,2),3,7); x10 := Insert_L(x10,7,#32);
      x11 := Copy(FloatToStrF(T_diariasVR_DESCONTO.Value,ffCurrency, 10,2),3,7); x11 := Insert_L(x11,7,#32);
      x12 := Copy(FloatToStrF(T_diariasVR_PEDIDOS.value,ffCurrency , 10,2),3,7); x12 := Insert_L(x12,7,#32);
      x13 := Copy(FloatToStrF(T_diariasVR_TOTAL.value,ffCurrency   , 10,2),3,7); x13 := Insert_L(x13,7,#32);
      vrc := Copy(FloatToStrF(T_diariasVR_RECEBIDO.value,ffCurrency, 10,2),3,7); vrc := Insert_L(vrc,7,#32);
      trc := Copy(FloatToStrF(T_diariasDF_TROCO.Value,ffCurrency   , 10,2),3,7); trc := Insert_L(trc,7,#32);
      x14 := Copy(FloatToStrF(T_diariasRC_DINHEIRO.Value,ffCurrency, 10,2),3,7); x14 := Insert_L(x14,7,#32);
      x15 := Copy(FloatToStrF(T_diariasRC_CARTAO.Value,ffCurrency  , 10,2),3,7); x15 := Insert_L(x15,7,#32);

      // corpo da impressão - conta

      Writeln(MyTXT,TC1); Writeln(MyTXT,TC2); Writeln(MyTXT,TC3);
      Writeln(MyTXT,'RESUMO DA CONTA N.             : '+x01);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'QUARTO/SUITE                   : '+x02);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'DATA DE ENTRADA                : '+dte);
      Writeln(MyTXT,'HORARIO DE ENTRADA             : '+x03);
      Writeln(MyTXT,'RECEPCAO                       : '+rce);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'DATA DE SAIDA                  : '+dts);
      Writeln(MyTXT,'HORARIO DE SAIDA               : '+x04);
      Writeln(MyTXT,'RECEPCAO                       : '+rcs);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TIPO LOCACAO                   : '+x07);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'HORAS FRANQUIA (LOCACAO)       : '+x05);
      Writeln(MyTXT,'HORAS EXCEDENTES               : '+x06);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'QTD PEDIDO                            VALOR ');
      Writeln(MyTXT,' ');

      T_pedidos.FIRST; y := 19;

      while not T_pedidos.EOF do
      begin
        if T_pedidosCONTA.value =
           T_diariasCONTA.value then
        begin
          x21 := T_pedidosQTD.asstring ; while length(x21)<3 do x21:='0'+x21;
          x22 := Trim(Copy(T_pedidosPRODUTO.value,1,28)); for I := 1 to length(x22) do x22[I]:=upcase(x22[I]); Insert_R(x22,28,#32);
          x23 := Copy(FloatToStrF(T_pedidosVR_TOTAL.value,ffCurrency,10,2),3,7); Insert_L(x23,7,#32); x23:='R$ '+x23;
          Writeln(MyTXT,x21+' '+x22+' '+x23);
        end;
        T_pedidos.next;
      end;
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'TOTAL                            R$ '+x12);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'VALOR HORAS FRANQUIA (LOCACAO) : R$ '+x16);
      Writeln(MyTXT,'VALOR HORAS EXCEDENTES         : R$ '+x09);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL HORAS USO (FRANQUIA+H.E) : R$ '+x08);
      Writeln(MyTXT,'TOTAL DE PEDIDOS               : R$ '+x12);
      Writeln(MyTXT,'EXTRAS/OUTROS SERVICOS         : R$ '+x10);
      Writeln(MyTXT,'DESCONTOS                      : R$ '+x11);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'VALOR TOTAL DA CONTA           : R$ '+x13);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'VR.RECEBIDO EM DINHEIRO        : R$ '+x14);
      Writeln(MyTXT,'VR.RECEBIDO EM CARTAO          : R$ '+x15);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TROCO A DEVOLVER               : R$ '+trc);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
  //  Writeln(MyTXT,#12); // ejeta a página
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');
      Writeln(MyTXT,'');

      // fim de impressão
    end;
  end;

  procedure impressao_caixa;
  begin
    with dm_firedac do
    begin
      // variáveis de impressão

      TC1 := T_empresaEMPRESA.Value;
      TC2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      TC3 := 'CONTROLE DE DIARIAS - v'+trim(T_empresaVERSAO.Value);

      x01	:= T_caixaCAIXA.AsString; //x01 := Insert_L(x01,10,#32);
      x02	:= T_caixaRECEPCAO.AsString; //x02 := Insert_L(x02,10,#32);
      x03	:= T_caixaENTRADA.AsString;
      x04	:= T_caixaSAIDA.AsString;

      x05 := Copy(FloatToStrF(T_caixaT_DINHEIRO.Value,ffCurrency,  10,2),3,7); x05 := Insert_L(x05,7,#32);
      x06 := Copy(FloatToStrF(T_caixaT_CARTAO.Value,ffCurrency,    10,2),3,7); x06 := Insert_L(x06,7,#32);
      x07 := Copy(FloatToStrF(T_caixaT_RECEBIDO.Value,ffCurrency,  10,2),3,7); x07 := Insert_L(x07,7,#32);
      x10 := Copy(FloatToStrF(T_caixaT_COMISSAO.Value,ffCurrency,  10,2),3,7); x10 := Insert_L(x10,7,#32);
      x11 := Copy(FloatToStrF(T_caixaT_CXAREC.Value,ffCurrency,    10,2),3,7); x11 := Insert_L(x11,7,#32);
      x12 := Copy(FloatToStrF(T_caixaT_CXADEIXADO.Value,ffCurrency,10,2),3,7); x12 := Insert_L(x12,7,#32);
      x13 := Copy(FloatToStrF(T_caixaT_REPCXA.Value,ffCurrency,    10,2),3,7); x13 := Insert_L(x13,7,#32);
      x09 := Copy(FloatToStrF(T_caixaT_DIF.Value,ffCurrency,       10,2),3,7); x09 := Insert_L(x09,7,#32);
      x14 := Copy(FloatToStrF(T_caixaT_DESPESAS.Value,ffCurrency,  10,2),3,7); x14 := Insert_L(x14,7,#32);
      x15 := Copy(FloatToStrF(T_caixaT_VALES.Value,ffCurrency,     10,2),3,7); x15 := Insert_L(x15,7,#32);
      x16 := Copy(FloatToStrF(T_caixaT_VALETRANSPORTE.Value,ffCurrency,10,2),3,7); x16 := Insert_L(x16,7,#32);
      x17 := Copy(FloatToStrF(T_caixaT_LIQENV.Value,ffCurrency,    10,2),3,7); x17 := Insert_L(x17,7,#32);

      // saída de impressão - caixa

      Writeln(MyTXT,TC1); Writeln(MyTXT,TC2); Writeln(MyTXT,TC3);
      Writeln(MyTXT,'RESUMO DA CAIXA N.  : '+x01);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'FUNCIONARIO/RECEPCAO: '+x02);
      Writeln(MyTXT,'DATA/HORA (ENTRADA) : '+x03);
      Writeln(MyTXT,'DATA/HORA (SAIDA  ) : '+x04);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'1. CONTAS RECEBIDAS TURNO ANTERIOR          ');
      Writeln(MyTXT,' ');
      //             123456-12--12345678--12-12345678-1234567890
      Writeln(MyTXT,'CONTA  AP  TIPO      ST RECEPCAO TOTAL      ');
      Writeln(MyTXT,'--------------------------------------------');

      chv := T_caixaCAIXA.AsString;
      linha := 'SELECT * FROM t_diarias WHERE (CX_ENTRADA <> '+chv+' AND CX_SAIDA = '+chv+') AND CHV = ''F'' ORDER BY CONTA ';

      query_diarias.DisableControls;
      query_diarias.Close;
      query_diarias.SQL.text := linha;
      query_diarias.Open;
      query_diarias.EnableControls;

      query_diarias.FIRST;
      while not query_diarias.EOF do
      begin
        x18 := query_diariasCONTA.AsString; // CONTA
        x19 := query_diariasAP.AsString   ; // APTO
        x20 := Trim(query_diariasTIPO.AsString); Insert_R(x20,8,#32);
        x21 := query_diariasCHV.AsString  ; // SITUACAO
        x22 := Copy(query_diariasRC_ENTRADA.AsString,1,8); x22 := Insert_R(x22,8,#32); // CAIXA (ENTRADA)
        x23 := Copy(query_diariasRC_SAIDA.AsString,1,8); x23 := Insert_R(x23,8,#32); // CAIXA (SAIDA)
        t_recebido := query_diariasRC_CS.Value + query_diariasRC_DS.Value;
        x24 := Copy(FloatToStrF(t_recebido,ffCurrency,10,2),3,7); x24 := Insert_R(x24,7,#32); // VR. TOTAL
        Writeln(MyTXT,x18+' '+x19+'  '+x20+'  '+x21+'  '+x22+' R$ '+x24);
        query_diarias.Next;
      end;
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'2. CONTAS FECHADAS E RECEBIDAS TURNO ATUAL  ');
      Writeln(MyTXT,' ');
      //             123456-12--12345678--12-12345678-1234567890
      Writeln(MyTXT,'CONTA  AP  TIPO      ST RECEPCAO TOTAL      ');
      Writeln(MyTXT,'--------------------------------------------');

      chv := T_caixaCAIXA.AsString;
      linha := 'SELECT * FROM t_diarias WHERE CX_ENTRADA = '+chv+' AND CHV = ''F'' ORDER BY CONTA ';

      query_diarias.DisableControls;
      query_diarias.Close;
      query_diarias.SQL.text := linha;
      query_diarias.Open;
      query_diarias.EnableControls;

      query_diarias.FIRST;
      while not query_diarias.EOF do
      begin
        x18 := query_diariasCONTA.AsString; // CONTA
        x19 := query_diariasAP.AsString   ; // APTO
        x20 := Trim(query_diariasTIPO.AsString); Insert_R(x20,8,#32);
        x21 := query_diariasCHV.AsString  ; // SITUACAO
        x22 := Copy(query_diariasRC_ENTRADA.AsString,1,8); while length(x22) < 8 do x22:=x22+' '; // CAIXA (ENTRADA)
        x23 := Copy(query_diariasRC_SAIDA.AsString,1,8);   while Length(x23) < 8 do x23:=x23+' '; // CAIXA (SAIDA)
        x24 := Copy(FloatToStrF(query_diariasVR_TOTAL.Value,ffCurrency,10,2),3,7); while length(x24) < 7 do x24:=' '+x24; // VR. TOTAL
        Writeln(MyTXT,x18+' '+x19+'  '+x20+'  '+x21+'  '+x22+' R$ '+x24);
        query_diarias.Next;
      end;

      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'3. CONTAS EM ABERTO TURNO ATUAL             ');
      Writeln(MyTXT,' ');
      //             123456-12--12345678--12-12345678-1234567890
      Writeln(MyTXT,'CONTA  AP  TIPO      ST RECEPCAO TOTAL      ');
      Writeln(MyTXT,'--------------------------------------------');

      chv := T_caixaCAIXA.AsString; linha := 'SELECT * FROM t_diarias WHERE CHV = ''A'' ORDER BY CONTA ';

      query_diarias.DisableControls;
      query_diarias.Close;
      query_diarias.SQL.text := linha;
      query_diarias.Open;
      query_diarias.EnableControls;

      query_diarias.FIRST;
      while not query_diarias.EOF do
      begin
        x18 := query_diariasCONTA.AsString; // CONTA
        x19 := query_diariasAP.AsString   ; // APTO
        x20 := Trim(query_diariasTIPO.AsString); Insert_R(x20,8,#32);
        x21 := query_diariasCHV.AsString  ; // SITUACAO
        x22 := Copy(query_diariasRC_ENTRADA.AsString,1,8); while length(x22) < 8 do x22:=x22+' '; // CAIXA (ENTRADA)
        x23 := Copy(query_diariasRC_SAIDA.AsString,1,8);   while Length(x23) < 8 do x23:=x23+' '; // CAIXA (SAIDA)
        t_recebido := query_diariasRC_DE.Value + query_diariasRC_CE.Value;
        x24 := Copy(FloatToStrF(t_recebido,ffCurrency,10,2),3,7); while length(x24) < 7 do x24:=' '+x24; // VR. TOTAL
        Writeln(MyTXT,x18+' '+x19+'  '+x20+'  '+x21+'  '+x22+' R$ '+x24);
        query_diarias.Next;
      end;
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'VALOR RECEBIDO EM CARTAO       : R$ '+x06);
      Writeln(MyTXT,'VALOR RECEBIDO EM DINHEIRO     : R$ '+x05);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'TOTAL RECEBIDO CARTAO+DINHEIRO : R$ '+x07);
      Writeln(MyTXT,'TROCO DE CAIXA RECEBIDO        : R$ '+x11);
      Writeln(MyTXT,'TROCO DE CAIXA DEIXADO         : R$ '+x12);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'RESUMO P/ENVIO VALOR LIQUIDO EM DINHEIRO    ');
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'+ CAIXA RECEBIDO EM DINHEIRO   : R$ '+x05);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'- COMISSAO S/ VENDAS           : R$ '+x10);
      Writeln(MyTXT,'- REPOSICAO P/ TROCO DE CAIXA  : R$ '+x13);
      Writeln(MyTXT,'- DIF.OU DEVOLUÇÃO DE TROCO    : R$ '+x09);
      Writeln(MyTXT,'- DESPESAS CONF.NOTAS DIVERSAS : R$ '+x14);
      Writeln(MyTXT,'- VALES/RETIRADAS FUNCIONARIOS : R$ '+x15);
      Writeln(MyTXT,'- VALE TRANSPORTE              : R$ '+X16);
      Writeln(MyTXT,'--------------------------------------------');
      Writeln(MyTXT,'+ VALOR LIQ.P/ENVIAR (DINHEIRO): R$ '+x17);
      Writeln(MyTXT,'+ RECEBIDO EM CARTÃO (DEB/CRED): R$ '+x06);
      Writeln(MyTXT,'--------------------------------------------');
      t_recebido := T_caixaT_CARTAO.Value + T_caixaT_LIQENV.Value;
      x25 := Copy(FloatToStrF(t_recebido,ffCurrency,10,2),3,7); while length(x25) < 7 do x25:=' '+x25; // VR.LIQ.TOTAL
      Writeln(MyTXT,'= TOTAL LIQUIDO DESTE CAIXA    : R$ '+x25);
      Writeln(MyTXT,'============================================');
      Writeln(MyTXT,'VISTO/ASSINATURA DO FUNCIONARIO: ');
      Writeln(MyTXT,' ');
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'--------------------------------------------');
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
    end;
  end;

  procedure impressao_copa;
  begin
    with dm_firedac do
    begin
      // variáveis de impressão

      TC1 := T_empresaEMPRESA.Value;
      TC2 := Trim(T_empresaENDERECO.Value)+' - '+T_empresaTELEFONE.Value;
      TC3 := 'CONTROLE DE DIARIAS - v'+trim(T_empresaVERSAO.Value);
      x03 := T_caixaRECEPCAO.AsString;

      // corpo da impressão - copa

      Writeln(MyTXT,TC1); Writeln(MyTXT,TC2); Writeln(MyTXT,TC3);
      Writeln(MyTXT,'------------------------------------------------');
      Writeln(MyTXT,'LISTAGEM DA COPA - '+x03);
      Writeln(MyTXT,' ');
      Writeln(MyTXT,'COD  PRODUTO');
      Writeln(MyTXT,' ');

      T_produtos.FIRST;

      while not T_produtos.EOF do
      begin
        x01	:= T_produtosID_PRODUTO.value;
        x02	:= Trim(copy(T_produtosPRODUTO.AsString,1,35)); while length(x02)<35 do x02:=x02+' ';
        Writeln(MyTXT,x01+'  '+x02);
        Writeln(MyTXT,'------------------------------------------------');
        T_produtos.NEXT;
      end;

      Writeln(MyTXT,'IMPRESSO EM '+DateToStr(date)+'  ('+TimeToStr(time)+')');
      Writeln(MyTXT,''); Writeln(MyTXT,#12); // ejeta a página

      // fim de impressão - copa
    end;
  end;

begin
	case opcao of
  02:	with dm_firedac do
      begin
        T_caixa.Last;
        if (T_caixaCHV.value = 'F') or (T_caixa.RecordCount = 0) then
        begin
          ShowMessage('Turno se encontra fechado! Favor abrir Turno antes de fazer seus lançamentos.');
          EXIT;
        end else
        begin
          if T_apartamentosCHV_D.value = 'LIVRE' then
          begin
            ShowModalForm(TF_aberturadeconta, F_aberturadeconta);
			    	PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
          end else
					begin
          	ShowMessage('Quarto não está disponível!');
			    	PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
          end;
        end;
  		end;

  03: with dm_firedac do
      begin
        T_caixa.Last;
        if T_caixaCHV.value = 'F' then
        begin
          ShowMessage('Turno se encontra fechado! Favor abrir Turno antes de fazer seus lançamentos.');
          EXIT;
        end else
        begin
          if NOT (T_diarias.Locate('CONTA',T_apartamentosDIARIA.Value,[])) and (T_diariasCHV.Value = 'A') then Exit else
          begin
            if (T_apartamentosCHV_D.AsString = 'MANUTENÇÃO') and (F_login.IDC in [0,1]) then
            begin
              ShowMessage('Atenção!'+#10#13+
              'ACESSO NÃO AUTORIZADO!'+#10#13+
              'Liberação somente pela Gerência.');
              EXIT;
            end else
            if (T_apartamentosDIARIA.Value <> '') and (T_diariasCHV.value = 'A') then
            begin
              ShowModalForm(TF_fechamentodeconta, F_fechamentodeconta);
              PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
            end else
            begin
              ShowMessage('Esta Conta já foi devidamente fechada!');
              EXIT;
            end;
          end;
        end;
      end;

  04: with dm_firedac do
      begin
        T_caixa.LAST;
        if T_caixaCHV.value = 'F' then
        begin
          ShowMessage('Turno se encontra fechado! Favor abrir Turno antes de fazer seus lançamentos.');
          EXIT;
        end else
        begin
          if T_apartamentosDIARIA.Value = '' then Exit else

          if T_diariasCHV.value = 'A' then
          begin
            ShowModalForm(TF_comandas, F_comandas);
            chv := trim(T_apartamentosDIARIA.Value);
            linha := 'select sum(VR_TOTAL) from t_pedidos where CONTA = '+chv+' ';
            Query_T1.DisableControls;
            Query_T1.Close;
            Query_T1.SQL.text := linha;
            Query_T1.Open;
            Query_T1.EnableControls;

            T_diarias.Edit;
            if Query_T1.Fields[0].value <> NULL then
            T_diariasVR_PEDIDOS.value  := Query_T1.Fields[0].value else
            T_diariasVR_PEDIDOS.value  := 0;
            T_diarias.Post;
            PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
          end else
          begin
            ShowMessage('Esta Conta já foi devidamente fechada!');
            EXIT;
          end;
        end;
      end;

  05:	with dm_firedac do
  		begin
        case T_empresaSAIDA_I.Value of
        1,5:{if MsgDlg('Imprimir essa Conta?', mtConfirmation, mbYesNo) <> mrYes then EXIT else }
            if (F_login.IDC <> 9) and (T_diariasCHV.value = 'A') then
            begin
              ShowMessage('DIARIA SE ENCONTRA EM ABERTO, PORTANTO NÃO PODERÁ SER IMPRESSA AINDA.');
              EXIT
            end else
            begin
              // imprime em Arquivo
              AssignFile(MyTXT, T_empresaPATH_3.AsString+'CONTA-'+T_diariasCONTA.AsString+'.TXT');
              Rewrite(MyTXT);
              impressao_conta;
              CloseFile(MyTXT);
              // imprime em Generic Text Only
              if T_empresaSAIDA_I.Value = 5 then
              begin
                AssignFile(MyTXT,'LPT1');
                Rewrite(MyTXT);
                impressao_conta;
                CloseFile(MyTXT);
              end;
            end;
      	end;
  		end;

  06: with dm_firedac do
  		begin
        if F_login.IDC in [0,1] then
        begin
          ShowMessage('Atenção!'+#10#13+
          'Usuário não autorizado p/ excluir pedidos!');
          EXIT;
        end else
        begin
          if MsgDlg('Atenção!'+#10#13+'Deseja excluir pedido?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
          begin
          	// excluindo comanda selecionada

            chv := T_pedidosCOMANDA.Value;
            linha := 'delete from t_pedidos where COMANDA = '+chv+' ';
            Query_T1.DisableControls;
            Query_T1.Close;
            Query_T1.SQL.text := linha;
            Query_T1.ExecSQL;
            Query_T1.EnableControls;

            // recalculando total dos pedidos

            chv := trim(T_diariasCONTA.value);
            linha := 'select sum(VR_TOTAL) from t_pedidos where CONTA = '+chv+' ';
            Query_T1.DisableControls;
            Query_T1.Close;
            Query_T1.SQL.text := linha;
            Query_T1.Open;
            Query_T1.EnableControls;

            T_diarias.Edit;
            if Query_T1.Fields[0].value <> NULL then
            T_diariasVR_PEDIDOS.value  := Query_T1.Fields[0].value else
            T_diariasVR_PEDIDOS.value  := 0;
            T_pedidos.Refresh;
            T_diarias.Refresh;
          end;
        end;
			  PageControl_1.ActivePage := TabSheet_1;
        Grid_1.SetFocus;
	  	end;

  07: with dm_firedac do
  		begin
        if F_login.IDC in [0,1] then
        begin
          ShowMessage('Atenção!'+#10#13+
          'Usuário não autorizado p/ excluir contas!');
          EXIT;
        end else
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
      end;

	12: if F_login.IDC in [0,1] then
      begin
        ShowMessage('Atenção!'+#10#13+'Usuário não está autorizado fechar esta seção!');
        PageControl_1.ActivePage := TabSheet_1; Grid_1.SetFocus;
      end else
			CLOSE;

	13: with dm_firedac do
      begin
        ShowModalForm(TF_login, F_login); str(F_login.IDC,chv);
        USR := F_login.USR;
        IDC := F_login.IDC;
        Label_OP.Caption := USR;

        if F_login.IDC = 3 then
        ShowMessage('Atenção!'+#10#13+'Acesso negado! Usuário e/ou Senha não conferem.');

        atualiza_mostradores;

        if F_login.IDC in [7,9] then
        begin
          TabSheet_2.Enabled := True;
          TabSheet_3.Enabled := True;
        end else
        begin
          TabSheet_2.Enabled := False;
          TabSheet_3.Enabled := False;
        end;
        PageControl_1.ActivePage := TabSheet_1;
      end;

	14:	with dm_firedac do
      begin
        T_caixa.LAST;
        if T_caixaCHV.value = 'A' then
        begin
          ShowMessage('Atenção!'+#10#13+'Turno se encontra aberto c/ '+T_caixaRECEPCAO.value);
          EXIT;
        end else
        begin
          ShowModalForm(TF_aberturadeponto, F_aberturadeponto);
          PageControl_1.ActivePage := TabSheet_1;
          Grid_1.SetFocus;
        end;
			end;

  15:	with dm_firedac do
  		begin
        if T_caixaCHV.value = 'F' then
        begin
          ShowMessage('Atenção!'+#10#13+'Turno já foi fechado por '+T_caixaRECEPCAO.value);
          EXIT;
        end else
        begin
        	T_caixa.Last;
          ShowModalForm(TF_fechamentodeponto, F_fechamentodeponto);
          PageControl_1.ActivePage := TabSheet_1;
          Grid_1.SetFocus;
          processo(13);
        end;
      end;

  16:	begin
{       if F_login.IDC in [0,1] then
        begin
          ShowMessage('ATENÇÃO! USUÁRIO NÃO ESTÁ AUTORIZADO ACESSAR ESTA OPÇÃO!');
          EXIT
        end else
        ShowModalForm(TF_estoque, F_estoque);}
			end;

  17:	begin
  			ShowModalForm(TF_coletas, F_coletas);
  		end;

  18:	begin
  			ShowModalForm(TF_entregas, F_entregas);
  		end;

  19: begin
        if MsgDlg('Atenção! '+#13#10+
        'Este processo poderá alterar valores já informados anteriormente.'+#13#10+
        'Continuar?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        ShowModalForm(TF_fechamentodeponto, F_fechamentodeponto);
  		end;

  20: with dm_firedac do
      begin
        case T_empresaSAIDA_I.Value of
        1,5:{if MsgDlg('Imprimir este Caixa?', mtConfirmation, mbYesNo) <> mrYes then EXIT else }
            begin
              // imprime em Arquivo
              AssignFile(MyTXT,T_empresaPATH_1.AsString + 'CAIXA-'+T_caixaCAIXA.AsString+'.TXT');
              Rewrite(MyTXT);
              impressao_caixa;
              CloseFile(MyTXT);
              // imprime em Generic Text Only
              if T_empresaSAIDA_I.Value = 5 then
              begin
                AssignFile(MyTXT,'LPT1');
                Rewrite(MyTXT);
                impressao_caixa;
                CloseFile(MyTXT);
              end;
            end;
        end;
      end;

  21: if F_login.IDC in [7,9] then ShowModalForm(TF_editardiaria, F_editardiaria) else
      begin
        ShowMessage('ATENÇÃO! USUÁRIO NÃO ESTÁ AUTORIZADO ACESSAR ESTA OPÇÃO!');
        EXIT
      end;

	22:	with dm_firedac do
      begin
        case T_empresaSAIDA_I.Value of
        1,5:if MsgDlg('Imprimir o Ticket (controle de entrada)?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
            begin
              // imprime em Arquivo
              AssignFile(MyTXT,T_empresaPATH_2.AsString + 'CANHOTO-'+T_diariasCONTA.AsString+'.TXT');
              Rewrite(MyTXT);
              impressao_canhoto;
              CloseFile(MyTXT);
              // imprime em Generic Text Only
              if T_empresaSAIDA_I.Value = 5 then
              begin
                AssignFile(MyTXT,'LPT1');
                Rewrite(MyTXT);
                impressao_canhoto;
                CloseFile(MyTXT);
              end;
            end;
        end;
	    end;

	23: with dm_firedac do
      begin
        T_caixa.LAST;
        if T_caixaCHV.value = 'F' then
        begin
          ShowMessage('Turno se encontra fechado! Favor abrir Turno antes de fazer seus lançamentos.');
          EXIT;
        end else
        begin
          if T_diariasCHV.value = 'A' then
          begin
            DecodeTime(Now()-T_diariasHR_ENTRADA.Value, hh, mi, ss, ms);
            T_minutos := (hh * 60) + mi; {total horas uso/minutos}
            if T_minutos <= T_empresaTOLERANCIA.AsInteger then
            begin
              ShowModalForm(TF_transferenciadeconta, F_transferenciadeconta);
            end else
            ShowMessage('Não é possível transferir Conta acima da tolerância permitida de '+
            IntToStr(T_empresaTOLERANCIA.AsInteger)+' minutos!');
          end else
          ShowMessage('Esta conta já foi devidamente fechada!');
        end;
        PageControl_1.ActivePage := TabSheet_1;
        Grid_1.SetFocus;
      end;

  24: begin
        with dm_firedac do
        begin
          chv := T_apartamentosDIARIA.Value;
          if (T_diarias.Locate('CONTA',chv,[])) and (T_diariasCHV.Value <> 'A') then
          begin
            if (T_diariasCHV.Value = 'F') and (T_diariasCHECK_OUT.Value = 'S') then
            begin
              ShowModalForm(TF_rouparia, F_rouparia);
              Grid_1.Refresh;
            end;
          end else
          ShowMessage('Esta Conta se encontra em aberto ainda!');
        end;
        Grid_1.SetFocus;
    	end;

  25: with dm_firedac do
  		begin
        chv := trim(ed_buscar.Text); chv := Insert_L(chv,6,'0');
//      T_diarias.DisableControls;
        T_diarias.First;
        if T_diarias.Locate('CONTA',chv,[loPartialKey]) then
        if MsgDlg('Deseja revisar esta Conta', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        ShowModalForm(TF_editardiaria, F_editardiaria) else
        T_diarias.Last;
//      T_diarias.EnableControls;
  		end;

  26: if MsgDlg('Imprimir Listagem da Copa?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
      with dm_firedac do
      begin
        if T_empresaSAIDA_I.Value = 1 then
        AssignFile(MyTXT, 'COPA.TXT') else
        AssignFile(MyTXT, 'LPT1');
        Rewrite(MyTXT);
        impressao_copa;
        CloseFile(MyTXT);
      end;

  27: with dm_firedac do
      begin
        F := 'CAIXA-'+T_caixaCAIXA.AsString+'.TXT'; anexo := Trim(T_empresaPATH_1.AsString+F);
        if MsgDlg('Enviar arquivo '+F+' para: '+#13#10+
        T_empresaEMAIL.AsString+' via : '+T_empresaLOCAL_SERV.AsString+'?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        begin
          if (T_empresaENVIO_HTTP.AsString = '1') and (FileExists(anexo)) then
          begin
            try
              SendFile_HTTP(anexo);
            finally
              ShowMessage('Arquivo enviado com sucesso!');
            end;
          end;
        end;
        DBNavigator_3.SetFocus;
      end;

  28: if MsgDlg('Atenção! Atualizar arquivo de Backup?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
      begin
        try
          chv := 'mybackup';
//        chv:=DateTimeToStr(Now); chv:=Extract_N(chv); chv:=copy(chv,1,8)+'-'+copy(chv,9,4);

          AssignFile(MyTXT,'backup.bat');
          Rewrite(MyTXT);
          Writeln(MyTXT,'@ECHO OFF');
          Writeln(MyTXT,'mysql\mysqlcheck -uroot -pmasterkey psihotel_vip --auto-repair');
          Writeln(MyTXT,'mysql\mysqldump -uroot -pmasterkey psihotel_vip > backup\'+chv+'.sql');
          Writeln(MyTXT,'dir backup\');
          Writeln(MyTXT,'ver');
          CloseFile(MyTXT);

          cmd := 'backup.bat';
          strpcopy(dir,GetCurrentDir);
          strpcopy(par,'');
          shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_hide);
        finally
          ShowMessage('Arquivo de Backup atualizado com sucesso!');
        end;
      end;

	29:	begin
        if MsgDlg('Ejetar impressão?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        begin
          if dm_firedac.T_empresaSAIDA_I.Value = 5 then
          begin
            AssignFile(MyTXT, 'LPT1');
            Rewrite(MyTXT);
            Writeln(MyTXT,''); Writeln(MyTXT,#12); // ejeta a página
            CloseFile(MyTXT);
          end;
        end;
	    end;
  30: with dm_firedac do
      begin   { rotina para checar e encerrar diárias abertas (HORA, PERNOITE e/ou DIÁRIA) c/ tempo limite esgotado! }
        if T_apartamentosCHV_D.Value <> 'LIVRE' then
        begin
          chv := T_apartamentosDIARIA.value;
          if T_diarias.Locate('CONTA',chv,[]) then
          begin
            if T_diariasCHV.Value = 'A' then
            begin
              if T_diariasDT_ENTRADA.Value <> date then
              T_uso := time + (StrToTime('23:59:59')-T_diariasHR_ENTRADA.Value) else
              T_uso := time - T_diariasHR_ENTRADA.Value;

              if (T_diariasTIPO.Value <> '24HS') and (T_uso > StrToTime('22:59:59')) then
              begin
                if T_diariasTIPO.Value = 'MANUTENÇÃO' then EXIT else
                begin
                  ShowMessage('Favor encerrar esta conta! Tempo limite de horas excedido.');
                  processo(03);
                end;
              end;
            end;
          end;
        end;
      end;

  10:	begin
				ShowModalForm(TF_relatoriodecaixa, F_relatoriodecaixa);
		  end;

  31: begin
        if MsgDlg('Abrir o Suporte Remoto (TeamViewer)?', mtConfirmation, mbYesNo) <> mrYes then EXIT else
        try
          StrPCopy(cmd,'TeamViewer.exe'); // cmd := 'TeamViewer.exe';
          StrPCopy(dir,'C:\Program Files\TeamViewer\'); // dir := 'C:\Program Files (x86)\TeamViewer\';
          StrPCopy(par,'');
          shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_normal);
        except
          ShowMessage('Não foi possível abrir o Suporte Remoto.'+#10#13+
          'Verifique e tente novamente!');
        end;
      end;

  end;
  PageControl_1.ActivePage := TabSheet_1;
  Grid_1.SetFocus;
end;

procedure TF_diarias.processar_evento(Sender: TObject);
begin
	if Sender = bt_abrirconta	then processo(02) else
  if Sender = bt_fecharconta then processo(03) else
//if Sender = bt_pedidos then processo(04) else
//if Sender = bt_imprimirconta then processo(05) else
//if Sender = bt_excluirpedido then processo(06) else
  if Sender = bt_excluirconta then processo(07) else
  if Sender = bt_fechar then processo(12) else
  if Sender = bt_login then   processo(13) else
  if Sender = bt_abrirturno then processo(14) else
  if Sender = bt_fecharturno then processo(15) else
  if Sender = bt_estoque then processo(16) else
  if Sender = bt_coletas then processo(17) else
  if Sender = bt_entregas then processo(18) else
  if Sender = bt_revisarcaixa then processo(19) else
  if Sender = bt_imprimirresumodecaixa then processo(20) else
  if Sender = bt_revisarconta then processo(21) else
//if Sender = bt_imprimirticket then processo(22) else
  if Sender = bt_transferir then processo(23) else
  if Sender = bt_liberar then processo(24) else
  if Sender = bt_buscarconta then processo(25) else
  if Sender = bt_copa then processo(26) else
  if Sender = bt_enviararquivo then processo(27) else
  if Sender = bt_atualizarbackup then processo(28) else
  if Sender = bt_ejetar then processo(29) else
  if Sender = bt_relatorio then processo(10) else
  if Sender = bt_suporte then processo(31);
end;

procedure TF_diarias.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	case Key of
  VK_F2	:	processo(02);
  VK_F3	:	processo(03);
  VK_F4	:	processo(04);
  VK_F5 :	processo(05);
  VK_F6 : processo(23);
  VK_F7 : processo(07);
  VK_F9 : processo(22);
  VK_F10: processo(24);
  VK_F12:	processo(12);
  end;
end;

procedure TF_diarias.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
		Key := #0;
	end;
end;

procedure TF_diarias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  processo(12);
end;

procedure TF_diarias.PageControl_1Change(Sender: TObject);
begin
  case F_login.IDC of
  7,9:begin
        TabSheet_2.Visible    := TRUE;
        TabSheet_3.Visible    := TRUE;
  		end;
  1,0:begin
		    TabSheet_2.Visible    := FALSE;
    		TabSheet_3.Visible    := FALSE;
		  end;
  end;
end;

procedure TF_diarias.Grid_3DblClick(Sender: TObject);
begin
	processo(19);
end;

procedure TF_diarias.Grid_3TitleClick(Column: TColumn);
begin
	dm_firedac.T_caixa.IndexFieldNames := Column.FieldName;
end;

procedure TF_diarias.Grid_2TitleClick(Column: TColumn);
begin
	dm_firedac.T_diarias.IndexFieldNames := Column.FieldName;
end;

procedure TF_diarias.Grid_2DblClick(Sender: TObject);
begin
  ShowModalForm(TF_resumodaconta, F_resumodaconta);
end;

procedure TF_diarias.Grid_1DblClick(Sender: TObject);
begin
  with dm_firedac do
  begin
    chv := T_apartamentosDIARIA.value;
    if chv <> '' then
    begin
      if T_diarias.Locate('CONTA',chv,[]) then ShowModalForm(TF_resumodaconta, F_resumodaconta) else
      ShowMessage('Conta não localizada');
    end;
  end;
end;

procedure TF_diarias.Grid_1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dm_firedac do
  begin
    if T_apartamentosCHV_D.AsString = 'LIVRE' then
    Grid_1.Canvas.Font.Color := clGreen else
    if T_apartamentosCHV_D.AsString = 'MANUTENÇÃO' then
    Grid_1.Canvas.Font.Color := clBlack else
    Grid_1.Canvas.Font.Color := clRed;
    Grid_1.Canvas.FillRect(Rect);
    Grid_1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TF_diarias.bt_calculadoraClick(Sender: TObject);
var
  cmd,par,dir: array[0..79] of char;
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

procedure TF_diarias.FormCreate(Sender: TObject);
begin
//F_AjustarTela(F_diarias);
end;

end.

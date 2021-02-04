unit md_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls, ShellApi, Vcl.Imaging.pngimage;

type
  TF_principal = class(TForm)
    Label_DT: TLabel;
    Label_DH: TLabel;
    Label_DS: TLabel;
    Label_1: TLabel;
    Label_2: TLabel;
    Label_3: TLabel;
    bt_controledediarias: TSpeedButton;
    bt_apartamentos: TSpeedButton;
    bt_imrpressora: TSpeedButton;
    bt_backup: TSpeedButton;
    bt_restaurarbackup: TSpeedButton;
    bt_dadosempresa: TSpeedButton;
    bt_login: TSpeedButton;
    bt_fecharsistema: TSpeedButton;
    Calendar_1: TMonthCalendar;
    Label_5: TLabel;
    m_principal: TMainMenu;
    m_sistema: TMenuItem;
    m_empresa: TMenuItem;
    m_usuarios: TMenuItem;
    m_apartamentos: TMenuItem;
    m_feriados: TMenuItem;
    m_cadastrodefuncionarios: TMenuItem;
    N3: TMenuItem;
    m_diarias: TMenuItem;
    m_resumodecaixa: TMenuItem;
    N2: TMenuItem;
    m_logindeusuario: TMenuItem;
    m_fecharsistema: TMenuItem;
    Rouparia1: TMenuItem;
    m_coletas: TMenuItem;
    m_entregas: TMenuItem;
    RomaneiodeRoupas1: TMenuItem;
    m_romaneioderoupas: TMenuItem;
    m_estoque: TMenuItem;
    m_fornecedores: TMenuItem;
    m_grupos: TMenuItem;
    m_produtos: TMenuItem;
    N5: TMenuItem;
    m_entradassaidas: TMenuItem;
    m_resumodacopa: TMenuItem;
    m_financeiro: TMenuItem;
    m_cadastrodecontas: TMenuItem;
    m_contasapagarreceber: TMenuItem;
    m_livrocaixa: TMenuItem;
    N4: TMenuItem;
    m_balancete: TMenuItem;
    m_ajuda: TMenuItem;
    m_impressora: TMenuItem;
    m_backup: TMenuItem;
    m_restaurarbackup: TMenuItem;
    m_configdb: TMenuItem;
    N1: TMenuItem;
    m_versaodosistema: TMenuItem;
    p_setup: TPrinterSetupDialog;
    Time_DH: TTimer;
    Image_1: TImage;
    background: TImage;

	  procedure FormShow(Sender: TObject);
    procedure atualiza_mostradores;
    procedure Time_DHTimer(Sender: TObject);

    procedure m_impressoraClick(Sender: TObject);
    procedure m_backupClick(Sender: TObject);
    procedure m_empresaClick(Sender: TObject);
    procedure m_usuariosClick(Sender: TObject);
    procedure m_apartamentosClick(Sender: TObject);
    procedure m_feriadosClick(Sender: TObject);
    procedure m_diariasClick(Sender: TObject);
    procedure m_gruposClick(Sender: TObject);
    procedure m_produtosClick(Sender: TObject);
    procedure m_fornecedoresClick(Sender: TObject);

    procedure m_logindeusuarioClick(Sender: TObject);
    procedure m_fecharsistemaClick(Sender: TObject);
    procedure m_versaodosistemaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure m_configdbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure m_restaurarbackupClick(Sender: TObject);
    procedure m_cadastrodefuncionariosClick(Sender: TObject);
    procedure m_resumodecaixaClick(Sender: TObject);
    procedure m_coletasClick(Sender: TObject);
    procedure m_entregasClick(Sender: TObject);
    procedure m_romaneioderoupasClick(Sender: TObject);
    procedure m_entradassaidasClick(Sender: TObject);
    procedure m_resumodacopaClick(Sender: TObject);
    procedure m_cadastrodecontasClick(Sender: TObject);
    procedure m_balanceteClick(Sender: TObject);
    procedure m_contasapagarreceberClick(Sender: TObject);
    procedure m_livrocaixaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
	  USR,acesso: string;
    IDC: byte;
  end;

var
  F_principal: TF_principal;
  cmd,par,dir: array[0..79] of char;
  chv,bkp: string;

const
//dia_semana: array[1..9] of string = (
//'Domingo','Segunda-feira','Terça-feira',  'Quarta-feira','Quinta-feira','Sexta-feira',
//'Sábado','Feriado: ','Véspera de Feriado: ');
  SIM	= 1;
  NAO	= 0;

implementation

{$R *.dfm}

uses
	md_utilities,
  md_login, md_empresa, md_usuarios, md_dadosdousuario,
  md_apartamentos, md_feriados, md_fornecedores, md_grupos, md_produtos,
  md_diarias, md_configdb, md_versaodosistema,
  md_firedac;

procedure TF_principal.FormShow(Sender: TObject);
begin
  F_login.IDC := 3; ShowModalForm(TF_login, F_login);
  if F_login.IDC = 3 then CLOSE else
  begin
    with dm_firedac do
    begin
      F_principal.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.AsString;
      Label_1.Caption := UpperCase(T_empresaEMPRESA.AsString);
      Label_2.Caption := UpperCase(T_empresaENDERECO.AsString);
      Label_3.Caption := UpperCase(T_empresaTELEFONE.AsString);
    end;
    case F_login.IDC of
    0:acesso := 'LIMITADO';
    1:acesso := 'OPERACIONAL';
	  3:acesso := 'RESTRITO';
    7:acesso := 'GERÊNCIA';
    9:acesso := 'ADMINISTRADOR (ACESSO TOTAL)';
    end;
    Label_5.Caption := 'USUÁRIO LOGADO: '+F_login.USR+' - ACESSO: '+acesso;
    atualiza_mostradores;
  end;
  F_principal.Refresh;
end;


procedure TF_principal.atualiza_mostradores;
begin
	with dm_firedac do
  begin
    if T_feriados.Locate('DT_EVENTO',DateToStr(date+1),[]) then
    Label_DS.Caption := dia_semana[9]+' '+T_feriadosFERIADO.AsString else
    if T_feriados.Locate('DT_EVENTO',DateToStr(date),[]) then
    Label_DS.Caption := dia_semana[8]+' '+T_feriadosFERIADO.AsString else
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
  Label_5.Caption := 'USUÁRIO: '+F_login.USR+' - ACESSO: '+acesso;
  Calendar_1.Date := Now;
  F_principal.Refresh;
end;

procedure TF_principal.Time_DHTimer(Sender: TObject);
var
  myDT: TDateTime;
  formattedDT: string;
begin
  myDT := Now;
	DateTimeToString(formattedDT, 'dd/mm/yyyy hh:nn:ss', myDT);
  Label_DT.Caption := copy(formattedDT,1,10);
  Label_DH.Caption := copy(formattedDT,12,9);
  if Label_DH.Caption = '00:00:00' then atualiza_mostradores;
end;

procedure TF_principal.m_empresaClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
 	ShowModalForm(TF_empresa, F_empresa) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_usuariosClick(Sender: TObject);
begin
	if F_login.IDC <> 9 then
	ShowMessage('ACESSO PERMITIDO SOMENTE A ADMINISTRAÇÃO E/OU SUPORTE DO SISTEMA! ') else
	ShowModalForm(TF_usuarios, F_usuarios);
end;

procedure TF_principal.m_apartamentosClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
  ShowModalForm(TF_apartamentos, F_apartamentos) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_feriadosClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
	ShowModalForm(TF_feriados, F_feriados) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_diariasClick(Sender: TObject);
begin
	if F_login.IDC in [0,1,7,9] then
	ShowModalForm(TF_diarias, F_diarias) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
  atualiza_mostradores;
end;

procedure TF_principal.m_fornecedoresClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
	ShowModalForm(TF_fornecedores, F_fornecedores) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_gruposClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
	ShowModalForm(TF_grupos, F_grupos) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_produtosClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then
	ShowModalForm(TF_produtos, F_produtos) else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_logindeusuarioClick(Sender: TObject);
begin
	ShowModalForm(TF_login, F_login);
  atualiza_mostradores;
end;

procedure TF_principal.m_impressoraClick(Sender: TObject);
begin
	if F_login.IDC in [0,1,7,9] then p_setup.execute else
	ShowMessage('ACESSO NÃO AUTORIZADO! ');
end;

procedure TF_principal.m_backupClick(Sender: TObject);
begin
	if F_login.IDC = 9 then
	begin
//  mysqldump -uUser -pPassword psi_hotel > backup\mybackup.sql
    if MsgDlg('Atenção! Atualizar arquivo de Backup?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
    try
      chv := 'mybackup';
//    chv:=DateTimeToStr(Now); chv:=Extract_N(chv); chv:=copy(chv,1,8)+'-'+copy(chv,9,4);
      AssignFile(MyTXT,'backup.bat');
      Rewrite(MyTXT);
      Writeln(MyTXT,'@ECHO OFF');
      Writeln(MyTXT,'mysql\mysqlcheck -uroot -pmasterkey psi_hotel --auto-repair');
      Writeln(MyTXT,'mysql\mysqldump  -uroot -pmasterkey psi_hotel > backup\'+chv+'.sql');
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

    if MsgDlg('Enviar arquivo de Backup?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
    try
      bkp := dm_firedac.T_empresaPATH_APLICACAO.AsString+'backup\mybackup.sql';
      if FileExists(bkp) then SendBKP_HTTP(bkp);
    except
      on e:exception do ShowMessage('Erro no envio do arquivo! Detalhes: '+e.Message);
    end;
	end else
	ShowMessage('ACESSO PERMITIDO SOMENTE A ADMINISTRAÇÃO E/OU SUPORTE DO SISTEMA! ');
end;

procedure TF_principal.m_restaurarbackupClick(Sender: TObject);
begin
	if F_login.IDC = 9 then
	begin
//  mysql -uUser -pPassword psi_hotel < backup\mybackup.sql
    if MsgDlg('Atenção! Restaurar arquivo de Backup?', mtConfirmation, mbYesNoCancel) <> mrYes then EXIT else
	  with dm_firedac do
    begin
      T_empresa.Close;
      T_usuarios.Close;
      T_apartamentos.Close;
      T_feriados.Close;
      T_fornecedores.Close;
      T_grupos.Close;
      T_produtos.Close;
      T_estoque.Close;
      T_diarias.Close;
      T_pedidos.Close;
      T_caixa.Close;
      T_rouparia.Close;
      T_coletas.Close;

      Connection_1.Connected := False;

      try
        cmd := 'backup-restore.bat';
        strpcopy(dir,GetCurrentDir);
        strpcopy(par,'');
        shellexecute(Application.MainForm.Handle,NIL,cmd,par,dir,sw_hide);
      finally
        ShowMessage('Arquivo de backup restaurado com sucesso! O sistema será fechado p/ atualizar os dados.'+#10#13+
        'Clique em OK para continuar...');
        Connection_1.Free;
       	CLOSE;
    	end;

    end;
  end else
	ShowMessage('ACESSO PERMITIDO SOMENTE A ADMINISTRAÇÃO E/OU SUPORTE DO SISTEMA! ');
end;

procedure TF_principal.m_versaodosistemaClick(Sender: TObject);
begin
	ShowModalForm(TF_versaodosistema, F_versaodosistema);
end;

procedure TF_principal.m_fecharsistemaClick(Sender: TObject);
begin
	if F_login.IDC in [7,9] then CLOSE else
	ShowMessage('ACESSO PERMITIDO SOMENTE A ADMINISTRAÇÃO E/OU SUPORTE DO SISTEMA! ');
end;

procedure TF_principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dm_firedac do
  begin
    T_empresa.Close;
    T_usuarios.Close;
    T_apartamentos.Close;
    T_feriados.Close;
    T_fornecedores.Close;
    T_grupos.Close;
    T_produtos.Close;
    T_estoque.Close;
    T_diarias.Close;
    T_pedidos.Close;
    T_caixa.Close;
    T_rouparia.Close;
    T_coletas.Close;
	end;
end;

procedure TF_principal.m_configdbClick(Sender: TObject);
begin
	if F_login.IDC = 9 then
	ShowModalForm(TF_configdb, F_configdb) else
	ShowMessage('ACESSO PERMITIDO SOMENTE A ADMINISTRAÇÃO E/OU SUPORTE DO SISTEMA! ');
end;

procedure TF_principal.m_livrocaixaClick(Sender: TObject);
begin
  // livro caixa
end;

procedure TF_principal.m_cadastrodefuncionariosClick(Sender: TObject);
begin
// cadastro de funcionarios
end;

procedure TF_principal.m_resumodacopaClick(Sender: TObject);
begin
// resumo da copa
end;

procedure TF_principal.m_resumodecaixaClick(Sender: TObject);
begin
// resumo de caixa
end;

procedure TF_principal.m_balanceteClick(Sender: TObject);
begin
// balancete financeiro
end;

procedure TF_principal.m_entradassaidasClick(Sender: TObject);
begin
//  entradas e saídas estoque
end;

procedure TF_principal.m_coletasClick(Sender: TObject);
begin
// coletas da lavanderia
end;

procedure TF_principal.m_entregasClick(Sender: TObject);
begin
// entregas - lavanderia
end;

procedure TF_principal.m_romaneioderoupasClick(Sender: TObject);
begin
// romaneios de roupas - lavanderia
end;

procedure TF_principal.m_cadastrodecontasClick(Sender: TObject);
begin
// cadastro de contas - financeiro
end;

procedure TF_principal.m_contasapagarreceberClick(Sender: TObject);
begin
  // contas a pagar / receber
end;

procedure TF_principal.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_principal);
end;

end.

unit dm_psihotel;

interface

uses
  System.SysUtils, System.Classes,IniFiles,ShellApi,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, MemDS, DBAccess;

type
  TF_database = class(TDataModule)
    psi_connection: TMyConnection;
    T_empresa: TMyTable;
    T_usuarios: TMyTable;
    T_feriados: TMyTable;
    T_apartamentos: TMyTable;
    T_fornecedores: TMyTable;
    T_grupos: TMyTable;
    T_produtos: TMyTable;
    T_estoque: TMyTable;
    T_rouparia: TMyTable;
    T_coletas: TMyTable;
    T_diarias: TMyTable;
    T_pedidos: TMyTable;
    T_empresaFICHA: TIntegerField;
    T_empresaEMPRESA: TStringField;
    T_empresaCNPJ: TStringField;
    T_empresaINSCRICAO: TStringField;
    T_empresaBAIRRO: TStringField;
    T_empresaUF: TStringField;
    T_empresaCEP: TStringField;
    T_empresaRESPONSAVEL: TStringField;
    T_empresaEMAIL: TStringField;
    T_empresaSMTP_HOST: TStringField;
    T_empresaSMTP_USER: TStringField;
    T_empresaSMTP_PASSWORD: TStringField;
    T_empresaSMTP_PORT: TIntegerField;
    T_empresaVERSAO: TStringField;
    T_empresaDT_ULTRV: TDateField;
    T_empresaSAIDA_I: TIntegerField;
    T_empresaSC_SIZE: TIntegerField;
    T_empresaULTIMA_C: TStringField;
    T_empresaTXA_CM: TFloatField;
    T_empresaTOLERANCIA: TIntegerField;
    T_empresaLOGOMARCA: TBlobField;
    T_empresaAVISO: TMemoField;
    T_empresaTIPO_ACESSO: TStringField;
    T_empresaLOCAL_SERV: TStringField;
    T_empresaLOCAL_USER: TStringField;
    T_empresaLOCAL_PASSWORD: TStringField;
    T_empresaLOCAL_DB: TStringField;
    T_empresaWEB_USER: TStringField;
    T_empresaWEB_DB: TStringField;
    T_empresaPATH_APLICACAO: TStringField;
    T_empresaENVIO_BACKUP: TStringField;
    T_empresaENVIO_SMTP: TStringField;
    T_empresaENVIO_HTTP: TStringField;
    T_empresaPATH_1: TStringField;
    T_empresaPATH_2: TStringField;
    T_empresaPATH_3: TStringField;
    T_usuariosFICHA: TIntegerField;
    T_usuariosID: TStringField;
    T_usuariosUSUARIO: TStringField;
    T_usuariosSENHA: TStringField;
    T_usuariosHR_ENTRADA: TTimeField;
    T_usuariosHR_SAIDA: TTimeField;
    T_usuariosIDC: TIntegerField;
    T_feriadosFICHA: TIntegerField;
    T_feriadosDT_EVENTO: TDateField;
    T_feriadosDATA: TDateField;
    T_feriadosFERIADO: TStringField;
    T_feriadosCHV: TStringField;
    T_apartamentosFICHA: TIntegerField;
    T_apartamentosAPTO: TStringField;
    T_apartamentosDESCRICAO: TStringField;
    T_apartamentosTABELA: TStringField;
    T_apartamentosVALOR_HR1: TFloatField;
    T_apartamentosVALOR_HR2: TFloatField;
    T_apartamentosVALOR_HE1: TFloatField;
    T_apartamentosVALOR_HE2: TFloatField;
    T_apartamentosVALOR_P1: TFloatField;
    T_apartamentosVALOR_P2: TFloatField;
    T_apartamentosVALOR_D1: TFloatField;
    T_apartamentosVALOR_D2: TFloatField;
    T_apartamentosDIARIA_24H1: TFloatField;
    T_apartamentosDIARIA_24H2: TFloatField;
    T_apartamentosDIARIA: TStringField;
    T_apartamentosCHV_D: TStringField;
    T_fornecedoresFICHA: TIntegerField;
    T_fornecedoresID_FORNEC: TStringField;
    T_fornecedoresENDERECO: TStringField;
    T_fornecedoresBAIRRO: TStringField;
    T_fornecedoresCIDADE: TStringField;
    T_fornecedoresUF: TStringField;
    T_fornecedoresCEP: TStringField;
    T_fornecedoresCNPJ: TStringField;
    T_fornecedoresCONTATO: TStringField;
    T_fornecedoresEMAIL: TStringField;
    T_gruposFICHA: TIntegerField;
    T_gruposID_GRUPO: TStringField;
    T_gruposGRUPO: TStringField;
    T_gruposCHV: TStringField;
    T_produtosFICHA: TIntegerField;
    T_produtosID_GRUPO: TStringField;
    T_produtosID_PRODUTO: TStringField;
    T_produtosPRODUTO: TStringField;
    T_produtosUNIDADE: TStringField;
    T_produtosVR_CUSTO: TFloatField;
    T_produtosVR_VENDA: TFloatField;
    T_produtosENTRADAS: TIntegerField;
    T_produtosSAIDAS: TIntegerField;
    T_produtosSD_ATUAL: TIntegerField;
    T_produtosCHV: TStringField;
    T_estoqueFICHA: TIntegerField;
    T_estoqueDH_LANCAMENTO: TDateTimeField;
    T_estoqueID_GRUPO: TStringField;
    T_estoqueHISTORICO: TStringField;
    T_estoqueUNIDADE: TStringField;
    T_estoqueSD_ANTERIOR: TIntegerField;
    T_estoqueENTRADAS: TIntegerField;
    T_estoqueSAIDAS: TIntegerField;
    T_estoqueSD_ATUAL: TIntegerField;
    T_caixaCAIXA: TStringField;
    T_caixaENTRADA: TDateTimeField;
    T_caixaSAIDA: TDateTimeField;
    T_caixaRECEPCAO: TStringField;
    T_caixaT_CXADEIXADO: TFloatField;
    T_caixaT_DIARIAS: TFloatField;
    T_caixaT_PEDIDOS: TFloatField;
    T_caixaT_EXTRAS: TFloatField;
    T_caixaT_DESCONTOS: TFloatField;
    T_caixaT_BRUTO: TFloatField;
    T_caixaT_META: TFloatField;
    T_caixaT_COMISSAO: TFloatField;
    T_caixaT_CARTAO: TFloatField;
    T_caixaT_DINHEIRO: TFloatField;
    T_caixaT_RECEBIDO: TFloatField;
    T_caixaT_REPCXA: TFloatField;
    T_caixaT_DESPESAS: TFloatField;
    T_caixaT_LIQENV: TFloatField;
    T_caixaT_DIF: TFloatField;
    T_caixaT_REC: TFloatField;
    T_caixaENVIO_OK: TStringField;
    T_caixaENVIO_DT: TDateTimeField;
    T_caixaCHV: TStringField;
    T_roupariaFICHA: TIntegerField;
    T_roupariaDIARIA: TStringField;
    T_roupariaDH_RETIRADA: TDateTimeField;
    T_roupariaLC: TIntegerField;
    T_roupariaFR: TIntegerField;
    T_roupariaTB: TIntegerField;
    T_roupariaTR: TIntegerField;
    T_roupariaTP: TIntegerField;
    T_roupariaTM: TIntegerField;
    T_roupariaEC: TIntegerField;
    T_roupariaCOLETA: TStringField;
    T_roupariaCHV: TStringField;
    T_coletasFICHA: TIntegerField;
    T_coletasDH_COLETA: TDateTimeField;
    T_coletasRECEPCAO: TStringField;
    T_coletasLC: TIntegerField;
    T_coletasFR: TIntegerField;
    T_coletasTB: TIntegerField;
    T_coletasTR: TIntegerField;
    T_coletasTP: TIntegerField;
    T_coletasEC: TIntegerField;
    T_coletasCOLETA: TStringField;
    T_coletasCHV: TStringField;
    T_diariasFICHA: TIntegerField;
    T_diariasCONTA: TStringField;
    T_diariasAP: TStringField;
    T_diariasDS: TSmallintField;
    T_diariasDT_ENTRADA: TDateField;
    T_diariasDT_SAIDA: TDateField;
    T_diariasHR_ENTRADA: TTimeField;
    T_diariasHR_SAIDA: TTimeField;
    T_diariasRC_ENTRADA: TStringField;
    T_diariasRC_SAIDA: TStringField;
    T_diariasCX_ENTRADA: TStringField;
    T_diariasCX_SAIDA: TStringField;
    T_diariasHR_USO: TTimeField;
    T_diariasHR_FRANQUIA: TTimeField;
    T_diariasHR_EXCEDENTES: TTimeField;
    T_diariasVR_LOCACAO: TFloatField;
    T_diariasVR_HE: TFloatField;
    T_diariasVR_HORASEXCEDENTES: TFloatField;
    T_diariasVR_PEDIDOS: TFloatField;
    T_diariasVR_DESCONTO: TFloatField;
    T_diariasVR_TOTAL: TFloatField;
    T_diariasRC_CE: TFloatField;
    T_diariasRC_DE: TFloatField;
    T_diariasVR_ENTRADA: TFloatField;
    T_diariasRC_CS: TFloatField;
    T_diariasRC_DS: TFloatField;
    T_diariasVR_SAIDA: TFloatField;
    T_diariasRC_CARTAO: TFloatField;
    T_diariasRC_DINHEIRO: TFloatField;
    T_diariasVR_TROCO: TFloatField;
    T_diariasDF_TROCO: TFloatField;
    T_diariasCAIXA: TStringField;
    T_diariasCHECK_OUT: TStringField;
    T_diariasCHV: TStringField;
    T_pedidosFICHA: TIntegerField;
    T_pedidosCOMANDA: TStringField;
    T_pedidosCONTA: TStringField;
    T_pedidosDH_LANCAMENTO: TDateTimeField;
    T_pedidosID_PRODUTO: TStringField;
    T_pedidosPRODUTO: TStringField;
    T_pedidosQTD: TIntegerField;
    T_pedidosVR_UN: TFloatField;
    T_pedidosCHV: TStringField;
    datasource_1: TMyDataSource;
    T_empresaFAX: TStringField;
    T_empresaCELULAR: TStringField;
    T_fornecedoresTELEFONE: TStringField;
    T_fornecedoresFAX: TStringField;
    T_fornecedoresCELULAR: TStringField;
    datasource_2: TMyDataSource;
    T_idc: TMyTable;

    procedure DataModuleCreate(Sender: TObject);
    procedure T_ApplyUpdates(DataSet: TDataSet);
    procedure psi_connectionBeforeConnect(Sender: TObject);

  private
    { Private declarations }
    FDatabase: string;
    FServer: string;
    FUser: string;
    FPassword: string;
  public
    { Public declarations }
  end;

var
  F_database: TF_database;
	ArqINI: TIniFile;
	FileName: string;
  S,chv: string;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses md_utilities;

{$R *.dfm}

procedure TF_database.DataModuleCreate(Sender: TObject);
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
	ArqINI := TIniFile.Create(FileName);

  if not FileExists(FileName) then
  begin
	  ArqINI.WriteString('DB', 'server', 'localhost');
	  ArqINI.WriteString('DB', 'database', 'psi_hotel');
  	ArqINI.WriteString('DB', 'user', 'root');
	  ArqINI.WriteString('DB', 'password', 'masterkey');
    ArqINI.UpdateFile;
  end;

	FServer := ArqINI.ReadString('DB', 'server', chv);
	FDatabase := ArqINI.ReadString('DB' , 'database', chv);
	FUser := ArqINI.ReadString('DB', 'user', chv);
  FPassword := ArqINI.ReadString('DB', 'password', chv);
	ArqINI.Free;

  psi_connection.Server    := FServer;
  psi_connection.Port      := 3306;
  psi_connection.Username  := FUser;
  psi_connection.Password  := FPassword;
 	psi_connection.Database  := FDatabase;
	psi_connection.Connected := True;

	T_empresa.Open;
  T_usuarios.Open;
  T_apartamentos.Open;
  T_feriados.Open;
  T_fornecedores.Open;
  T_grupos.Open;
  T_produtos.Open;
  T_estoque.Open;
  T_diarias.Open;
  T_pedidos.Open;
  T_caixa.Open;
  T_rouparia.Open;
  T_coletas.Open;
end;

procedure TF_database.psi_connectionBeforeConnect(Sender: TObject);
begin
{ //implementar depois para verificação do path da aplicação
  FDPhysMySQLDriverLink_1.VendorLib := ExtractFilePath(Application.ExeName)+'\mysql\libmysql.dll';
  ShowMessage(FDPhysMySQLDriverLink_1.VendorLib); }
end;

procedure TF_database.T_ApplyUpdates(Dataset: TDataSet);
begin
  if Dataset is TMyTable then
  begin
    TMyTable(Dataset).DisableControls;
    TMyTable(Dataset).ApplyUpdates();
    TMyTable(Dataset).EnableControls;
    TMyTable(Dataset).Refresh;
  end;
end;

end.

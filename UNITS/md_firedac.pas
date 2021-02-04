unit md_firedac;

interface

uses
  System.SysUtils, System.Classes, IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  vcl.forms,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Vcl.Dialogs;

type
  Tdm_firedac = class(TDataModule)
    query_login: TFDQuery;
    WaitCursor_1: TFDGUIxWaitCursor;
    q_empresa: TFDQuery;
    q_feriados: TFDQuery;
    q_apartamentos: TFDQuery;
    q_fornecedores: TFDQuery;
    q_grupos: TFDQuery;
    q_produtos: TFDQuery;
    q_estoque: TFDQuery;
    q_caixa: TFDQuery;
    q_rouparia: TFDQuery;
    q_coletas: TFDQuery;
    q_diarias: TFDQuery;
    q_pedidos: TFDQuery;
    q_usuarios: TFDQuery;
    query_idc: TFDQuery;
    q_empresaFICHA: TFDAutoIncField;
    q_empresaEMPRESA: TStringField;
    q_empresaCNPJ: TStringField;
    q_empresaINSCRICAO: TStringField;
    q_empresaENDERECO: TStringField;
    q_empresaBAIRRO: TStringField;
    q_empresaCIDADE: TStringField;
    q_empresaUF: TStringField;
    q_empresaCEP: TStringField;
    q_empresaTELEFONE: TStringField;
    q_empresaFAX: TStringField;
    q_empresaCELULAR: TStringField;
    q_empresaRESPONSAVEL: TStringField;
    q_empresaEMAIL: TStringField;
    q_empresaSMTP_HOST: TStringField;
    q_empresaSMTP_USER: TStringField;
    q_empresaSMTP_PASSWORD: TStringField;
    q_empresaSMTP_PORT: TIntegerField;
    q_empresaVERSAO: TStringField;
    q_empresaDT_ULTRV: TDateField;
    q_empresaSAIDA_I: TIntegerField;
    q_empresaSC_SIZE: TIntegerField;
    q_empresaULTIMA_C: TStringField;
    q_empresaVR_MINIMO: TFloatField;
    q_empresaTXA_CM: TFloatField;
    q_empresaTOLERANCIA: TIntegerField;
    q_empresaLOGOMARCA: TBlobField;
    q_empresaAVISO: TMemoField;
    q_empresaTIPO_ACESSO: TStringField;
    q_empresaLOCAL_SERV: TStringField;
    q_empresaLOCAL_USER: TStringField;
    q_empresaLOCAL_PASSWORD: TStringField;
    q_empresaLOCAL_DB: TStringField;
    q_empresaWEB_SERV: TStringField;
    q_empresaWEB_USER: TStringField;
    q_empresaWEB_PASSWORD: TStringField;
    q_empresaWEB_DB: TStringField;
    q_empresaPATH_APLICACAO: TStringField;
    q_empresaENVIO_BACKUP: TStringField;
    q_empresaENVIO_SMTP: TStringField;
    q_empresaENVIO_HTTP: TStringField;
    q_empresaPATH_1: TStringField;
    q_empresaPATH_2: TStringField;
    q_empresaPATH_3: TStringField;
    q_feriadosFICHA: TFDAutoIncField;
    q_feriadosDT_EVENTO: TDateField;
    q_feriadosDATA: TDateField;
    q_feriadosFERIADO: TStringField;
    q_feriadosCHV: TStringField;
    q_fornecedoresFICHA: TFDAutoIncField;
    q_fornecedoresID_FORNEC: TStringField;
    q_fornecedoresFORNECEDOR: TStringField;
    q_fornecedoresENDERECO: TStringField;
    q_fornecedoresBAIRRO: TStringField;
    q_fornecedoresCIDADE: TStringField;
    q_fornecedoresUF: TStringField;
    q_fornecedoresCEP: TStringField;
    q_fornecedoresCNPJ: TStringField;
    q_fornecedoresINSCRICAO: TStringField;
    q_fornecedoresCONTATO: TStringField;
    q_fornecedoresTELEFONE: TStringField;
    q_fornecedoresFAX: TStringField;
    q_fornecedoresCELULAR: TStringField;
    q_fornecedoresEMAIL: TStringField;
    q_gruposFICHA: TFDAutoIncField;
    q_gruposID_GRUPO: TStringField;
    q_gruposGRUPO: TStringField;
    q_gruposCHV: TStringField;
    q_produtosFICHA: TFDAutoIncField;
    q_produtosID_GRUPO: TStringField;
    q_produtosID_PRODUTO: TStringField;
    q_produtosPRODUTO: TStringField;
    q_produtosUNIDADE: TStringField;
    q_produtosVR_CUSTO: TFloatField;
    q_produtosVR_VENDA: TFloatField;
    q_produtosESTQ_M: TIntegerField;
    q_produtosENTRADAS: TIntegerField;
    q_produtosSAIDAS: TIntegerField;
    q_produtosSD_ATUAL: TIntegerField;
    q_produtosCHV: TStringField;
    q_estoqueFICHA: TFDAutoIncField;
    q_estoqueDH_LANCAMENTO: TDateTimeField;
    q_estoqueID_GRUPO: TStringField;
    q_estoqueID_PRODUTO: TStringField;
    q_estoqueHISTORICO: TStringField;
    q_estoqueUNIDADE: TStringField;
    q_estoqueSD_ANTERIOR: TIntegerField;
    q_estoqueENTRADAS: TIntegerField;
    q_estoqueSAIDAS: TIntegerField;
    q_estoqueSD_ATUAL: TIntegerField;
    q_estoqueCHV: TStringField;
    q_caixaFICHA: TFDAutoIncField;
    q_caixaCAIXA: TStringField;
    q_caixaENTRADA: TDateTimeField;
    q_caixaSAIDA: TDateTimeField;
    q_caixaRECEPCAO: TStringField;
    q_caixaT_CXAREC: TFloatField;
    q_caixaT_CXADEIXADO: TFloatField;
    q_caixaT_DIARIAS: TFloatField;
    q_caixaT_PEDIDOS: TFloatField;
    q_caixaT_EXTRAS: TFloatField;
    q_caixaT_DESCONTOS: TFloatField;
    q_caixaT_BRUTO: TFloatField;
    q_caixaT_META: TFloatField;
    q_caixaT_COMISSAO: TFloatField;
    q_caixaT_CARTAO: TFloatField;
    q_caixaT_DINHEIRO: TFloatField;
    q_caixaT_RECEBIDO: TFloatField;
    q_caixaT_REPCXA: TFloatField;
    q_caixaT_DESPESAS: TFloatField;
    q_caixaT_VALES: TFloatField;
    q_caixaT_VALETRANSPORTE: TFloatField;
    q_caixaT_LIQENV: TFloatField;
    q_caixaT_DIF: TFloatField;
    q_caixaT_REC: TFloatField;
    q_caixaENVIO_OK: TStringField;
    q_caixaENVIO_DT: TDateTimeField;
    q_caixaCHV: TStringField;
    q_roupariaFICHA: TFDAutoIncField;
    q_roupariaDIARIA: TStringField;
    q_roupariaDH_RETIRADA: TDateTimeField;
    q_roupariaLC: TIntegerField;
    q_roupariaFR: TIntegerField;
    q_roupariaTB: TIntegerField;
    q_roupariaTR: TIntegerField;
    q_roupariaTP: TIntegerField;
    q_roupariaTM: TIntegerField;
    q_roupariaEC: TIntegerField;
    q_roupariaCOLETA: TStringField;
    q_roupariaCHV: TStringField;
    q_coletasFICHA: TFDAutoIncField;
    q_coletasDH_COLETA: TDateTimeField;
    q_coletasRECEPCAO: TStringField;
    q_coletasLC: TIntegerField;
    q_coletasFR: TIntegerField;
    q_coletasTB: TIntegerField;
    q_coletasTR: TIntegerField;
    q_coletasTP: TIntegerField;
    q_coletasEC: TIntegerField;
    q_coletasCOLETA: TStringField;
    q_coletasCHV: TStringField;
    q_diariasFICHA: TFDAutoIncField;
    q_diariasCONTA: TStringField;
    q_diariasAP: TStringField;
    q_diariasTIPO: TStringField;
    q_diariasDS: TSmallintField;
    q_diariasDT_ENTRADA: TDateField;
    q_diariasDT_SAIDA: TDateField;
    q_diariasHR_ENTRADA: TTimeField;
    q_diariasHR_SAIDA: TTimeField;
    q_diariasRC_ENTRADA: TStringField;
    q_diariasRC_SAIDA: TStringField;
    q_diariasCX_ENTRADA: TStringField;
    q_diariasCX_SAIDA: TStringField;
    q_diariasHR_USO: TTimeField;
    q_diariasHR_FRANQUIA: TTimeField;
    q_diariasHR_EXCEDENTES: TTimeField;
    q_diariasVR_LOCACAO: TFloatField;
    q_diariasVR_HE: TFloatField;
    q_diariasVR_HORASEXCEDENTES: TFloatField;
    q_diariasVR_HORASUSO: TFloatField;
    q_diariasVR_PEDIDOS: TFloatField;
    q_diariasVR_EXTRAS: TFloatField;
    q_diariasVR_DESCONTO: TFloatField;
    q_diariasVR_TOTAL: TFloatField;
    q_diariasRC_CE: TFloatField;
    q_diariasRC_DE: TFloatField;
    q_diariasVR_ENTRADA: TFloatField;
    q_diariasRC_CS: TFloatField;
    q_diariasRC_DS: TFloatField;
    q_diariasVR_SAIDA: TFloatField;
    q_diariasRC_CARTAO: TFloatField;
    q_diariasRC_DINHEIRO: TFloatField;
    q_diariasVR_RECEBIDO: TFloatField;
    q_diariasVR_TROCO: TFloatField;
    q_diariasDF_TROCO: TFloatField;
    q_diariasCAIXA: TStringField;
    q_diariasCHECK_OUT: TStringField;
    q_diariasCHV: TStringField;
    q_pedidosFICHA: TFDAutoIncField;
    q_pedidosCOMANDA: TStringField;
    q_pedidosCONTA: TStringField;
    q_pedidosDH_LANCAMENTO: TDateTimeField;
    q_pedidosID_PRODUTO: TStringField;
    q_pedidosPRODUTO: TStringField;
    q_pedidosQTD: TIntegerField;
    q_pedidosVR_UN: TFloatField;
    q_pedidosVR_TOTAL: TFloatField;
    q_pedidosCHV: TStringField;
    q_usuariosFICHA: TFDAutoIncField;
    q_usuariosID: TStringField;
    q_usuariosUSUARIO: TStringField;
    q_usuariosSENHA: TStringField;
    q_usuariosHR_ENTRADA: TTimeField;
    q_usuariosHR_SAIDA: TTimeField;
    q_usuariosIDC: TIntegerField;
    query_idcFICHA: TFDAutoIncField;
    query_idcID: TStringField;
    query_idcIDC: TLongWordField;
    query_loginFICHA: TFDAutoIncField;
    query_loginID: TStringField;
    query_loginUSUARIO: TStringField;
    query_loginSENHA: TStringField;
    query_loginHR_ENTRADA: TTimeField;
    query_loginHR_SAIDA: TTimeField;
    query_loginIDC: TIntegerField;
    T_empresa: TFDTable;
    T_feriados: TFDTable;
    T_apartamentos: TFDTable;
    T_fornecedores: TFDTable;
    T_grupos: TFDTable;
    T_produtos: TFDTable;
    T_estoque: TFDTable;
    T_caixa: TFDTable;
    T_rouparia: TFDTable;
    T_coletas: TFDTable;
    T_diarias: TFDTable;
    T_pedidos: TFDTable;
    T_usuarios: TFDTable;
    T_idc: TFDTable;
    ds_pedidosdiarias: TDataSource;
    T_empresaFICHA: TFDAutoIncField;
    T_empresaEMPRESA: TStringField;
    T_empresaCNPJ: TStringField;
    T_empresaINSCRICAO: TStringField;
    T_empresaENDERECO: TStringField;
    T_empresaBAIRRO: TStringField;
    T_empresaCIDADE: TStringField;
    T_empresaUF: TStringField;
    T_empresaCEP: TStringField;
    T_empresaTELEFONE: TStringField;
    T_empresaFAX: TStringField;
    T_empresaCELULAR: TStringField;
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
    T_empresaVR_MINIMO: TFloatField;
    T_empresaTXA_CM: TFloatField;
    T_empresaTOLERANCIA: TIntegerField;
    T_empresaLOGOMARCA: TBlobField;
    T_empresaAVISO: TMemoField;
    T_empresaTIPO_ACESSO: TStringField;
    T_empresaLOCAL_SERV: TStringField;
    T_empresaLOCAL_USER: TStringField;
    T_empresaLOCAL_PASSWORD: TStringField;
    T_empresaLOCAL_DB: TStringField;
    T_empresaWEB_SERV: TStringField;
    T_empresaWEB_USER: TStringField;
    T_empresaWEB_PASSWORD: TStringField;
    T_empresaWEB_DB: TStringField;
    T_empresaPATH_APLICACAO: TStringField;
    T_empresaENVIO_BACKUP: TStringField;
    T_empresaENVIO_SMTP: TStringField;
    T_empresaENVIO_HTTP: TStringField;
    T_empresaPATH_1: TStringField;
    T_empresaPATH_2: TStringField;
    T_empresaPATH_3: TStringField;
    T_feriadosFICHA: TFDAutoIncField;
    T_feriadosDT_EVENTO: TDateField;
    T_feriadosDATA: TDateField;
    T_feriadosFERIADO: TStringField;
    T_feriadosCHV: TStringField;
    T_fornecedoresFICHA: TFDAutoIncField;
    T_fornecedoresID_FORNEC: TStringField;
    T_fornecedoresFORNECEDOR: TStringField;
    T_fornecedoresENDERECO: TStringField;
    T_fornecedoresBAIRRO: TStringField;
    T_fornecedoresCIDADE: TStringField;
    T_fornecedoresUF: TStringField;
    T_fornecedoresCEP: TStringField;
    T_fornecedoresCNPJ: TStringField;
    T_fornecedoresINSCRICAO: TStringField;
    T_fornecedoresCONTATO: TStringField;
    T_fornecedoresTELEFONE: TStringField;
    T_fornecedoresFAX: TStringField;
    T_fornecedoresCELULAR: TStringField;
    T_fornecedoresEMAIL: TStringField;
    T_gruposFICHA: TFDAutoIncField;
    T_gruposID_GRUPO: TStringField;
    T_gruposGRUPO: TStringField;
    T_gruposCHV: TStringField;
    T_produtosFICHA: TFDAutoIncField;
    T_produtosID_GRUPO: TStringField;
    T_produtosID_PRODUTO: TStringField;
    T_produtosPRODUTO: TStringField;
    T_produtosUNIDADE: TStringField;
    T_produtosVR_CUSTO: TFloatField;
    T_produtosVR_VENDA: TFloatField;
    T_produtosESTQ_M: TIntegerField;
    T_produtosENTRADAS: TIntegerField;
    T_produtosSAIDAS: TIntegerField;
    T_produtosSD_ATUAL: TIntegerField;
    T_produtosCHV: TStringField;
    T_estoqueFICHA: TFDAutoIncField;
    T_estoqueDH_LANCAMENTO: TDateTimeField;
    T_estoqueID_GRUPO: TStringField;
    T_estoqueID_PRODUTO: TStringField;
    T_estoqueHISTORICO: TStringField;
    T_estoqueUNIDADE: TStringField;
    T_estoqueSD_ANTERIOR: TIntegerField;
    T_estoqueENTRADAS: TIntegerField;
    T_estoqueSAIDAS: TIntegerField;
    T_estoqueSD_ATUAL: TIntegerField;
    T_estoqueCHV: TStringField;
    T_caixaFICHA: TFDAutoIncField;
    T_caixaCAIXA: TStringField;
    T_caixaENTRADA: TDateTimeField;
    T_caixaSAIDA: TDateTimeField;
    T_caixaRECEPCAO: TStringField;
    T_caixaT_CXAREC: TFloatField;
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
    T_caixaT_VALES: TFloatField;
    T_caixaT_VALETRANSPORTE: TFloatField;
    T_caixaT_LIQENV: TFloatField;
    T_caixaT_DIF: TFloatField;
    T_caixaT_REC: TFloatField;
    T_caixaENVIO_OK: TStringField;
    T_caixaENVIO_DT: TDateTimeField;
    T_caixaCHV: TStringField;
    T_roupariaFICHA: TFDAutoIncField;
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
    T_coletasFICHA: TFDAutoIncField;
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
    T_diariasFICHA: TFDAutoIncField;
    T_diariasCONTA: TStringField;
    T_diariasAP: TStringField;
    T_diariasTIPO: TStringField;
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
    T_diariasVR_HORASUSO: TFloatField;
    T_diariasVR_PEDIDOS: TFloatField;
    T_diariasVR_EXTRAS: TFloatField;
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
    T_diariasVR_RECEBIDO: TFloatField;
    T_diariasVR_TROCO: TFloatField;
    T_diariasDF_TROCO: TFloatField;
    T_diariasCAIXA: TStringField;
    T_diariasCHECK_OUT: TStringField;
    T_diariasCHV: TStringField;
    T_pedidosFICHA: TFDAutoIncField;
    T_pedidosCOMANDA: TStringField;
    T_pedidosCONTA: TStringField;
    T_pedidosDH_LANCAMENTO: TDateTimeField;
    T_pedidosID_PRODUTO: TStringField;
    T_pedidosPRODUTO: TStringField;
    T_pedidosQTD: TIntegerField;
    T_pedidosVR_UN: TFloatField;
    T_pedidosVR_TOTAL: TFloatField;
    T_pedidosCHV: TStringField;
    T_usuariosFICHA: TFDAutoIncField;
    T_usuariosID: TStringField;
    T_usuariosUSUARIO: TStringField;
    T_usuariosSENHA: TStringField;
    T_usuariosHR_ENTRADA: TTimeField;
    T_usuariosHR_SAIDA: TTimeField;
    T_usuariosIDC: TIntegerField;
    T_idcFICHA: TFDAutoIncField;
    T_idcID: TStringField;
    T_idcIDC: TLongWordField;
    ds_idcusuarios: TDataSource;
    q_apartamentosFICHA: TFDAutoIncField;
    q_apartamentosAPTO: TStringField;
    q_apartamentosDESCRICAO: TStringField;
    q_apartamentosTABELA: TStringField;
    q_apartamentosVALOR_HR1: TFloatField;
    q_apartamentosVALOR_HR2: TFloatField;
    q_apartamentosFRANQUIA: TTimeField;
    q_apartamentosVALOR_HE1: TFloatField;
    q_apartamentosVALOR_HE2: TFloatField;
    q_apartamentosVALOR_P1: TFloatField;
    q_apartamentosVALOR_P2: TFloatField;
    q_apartamentosVALOR_D1: TFloatField;
    q_apartamentosVALOR_D2: TFloatField;
    q_apartamentosDIARIA_24H1: TFloatField;
    q_apartamentosDIARIA_24H2: TFloatField;
    q_apartamentosDIARIA: TStringField;
    q_apartamentosCHV_D: TStringField;
    T_apartamentosFICHA: TFDAutoIncField;
    T_apartamentosAPTO: TStringField;
    T_apartamentosDESCRICAO: TStringField;
    T_apartamentosTABELA: TStringField;
    T_apartamentosVALOR_HR1: TFloatField;
    T_apartamentosVALOR_HR2: TFloatField;
    T_apartamentosFRANQUIA: TTimeField;
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
    DriverLink_1: TFDPhysMySQLDriverLink;
    Connection_1: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure QueryApplyUpdates(DataSet: TDataSet);
    procedure TableApplyUpdates(DataSet: TDataSet);
    procedure Connection_1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_firedac: Tdm_firedac;
	ArqINI: TIniFile;
  chv,
	FileName: string;
  FDatabase: string;
  FServer: string;
  FUser: string;
  FPassword: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_firedac.Connection_1BeforeConnect(Sender: TObject);
begin
  {DriverLink_1.VendorLib := ExtractFilePath(Application.ExeName)+'\mysql\libmysql.dll'; }
end;

procedure Tdm_firedac.DataModuleCreate(Sender: TObject);
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
	ArqINI := TIniFile.Create(FileName);

  if not FileExists(FileName) then
  begin
	  ArqINI.WriteString('DB', 'server', 'localhost');
	  ArqINI.WriteString('DB', 'database', 'psi_hotel');
  	ArqINI.WriteString('DB', 'user', 'root');
	  ArqINI.WriteString('DB', 'password', '');
    ArqINI.UpdateFile;
  end;

	FServer := ArqINI.ReadString('DB', 'server', chv);
	FDatabase := ArqINI.ReadString('DB' , 'database', chv);
	FUser := ArqINI.ReadString('DB', 'user', chv);
  FPassword := ArqINI.ReadString('DB', 'password', chv);
	ArqINI.Free;

  try
    Connection_1.Params.Values['DriveID' ] := 'MySQL';
    Connection_1.Params.Values['Server'  ] := FServer;
    Connection_1.Params.Values['Database'] := FDatabase;
    Connection_1.Params.Values['Port'    ] := '3306';
    Connection_1.Params.Values['Username'] := 'root';
    Connection_1.Params.Values['Password'] := '';
  except
    ShowMessage('Erro ao conectar o banco de dados!');
  end;

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

	q_empresa.Open;
  q_usuarios.Open;
  q_apartamentos.Open;
  q_feriados.Open;
  q_fornecedores.Open;
  q_grupos.Open;
  q_produtos.Open;
  q_estoque.Open;
  q_diarias.Open;
  q_pedidos.Open;
  q_caixa.Open;
  q_rouparia.Open;
  q_coletas.Open;
end;

procedure Tdm_firedac.TableApplyUpdates(DataSet: TDataSet);
begin
  if Dataset is TFDTable then
  begin
    TFDTable(Dataset).DisableControls;
    TFDTable(Dataset).ApplyUpdates();
    TFDTable(Dataset).CommitUpdates;
    TFDTable(Dataset).EnableControls;
    TFDTable(Dataset).Refresh;
  end;
end;

procedure Tdm_firedac.QueryApplyUpdates(DataSet: TDataSet);
begin
  if Dataset is TFDQuery then
  begin
    TFDQuery(Dataset).DisableControls;
    TFDQuery(Dataset).ApplyUpdates();
    TFDQuery(Dataset).CommitUpdates;
    TFDQuery(Dataset).EnableControls;
    TFDQuery(Dataset).Refresh;
  end;
end;

end.

{
DescriptionSpecifies whether the dataset will log changes to the data without immediately
applying of them to the database.

FireDAC.Comp.Client.TFDTable.CachedUpdates inherits from FireDAC.Comp.DataSet.TFDDataSet.CachedUpdates.
All content below this line refers to FireDAC.Comp.DataSet.TFDDataSet.CachedUpdates.

Specifies whether the dataset will log changes to the data without immediately applying of them to the database.

CachedUpdates enables (True) or disables (False) the logging of data changes (Insert/Post, Edit/Post, Delete)
without immediately applying them to the database.   An application must explicitly apply changes from the change log to the database,
using the ApplyUpdates method. All the changes are written in a small amount of time per single transaction.

The main benefits of enabling cached updates are:

Fewer transactions and shorter transaction times.
Minimization of network traffic.
Simplified implementation of undo / redo functionality for the dataset.
Ability to implement applications in offline mode or briefcase model.
The potential drawbacks of enabling cached updates are:

Other applications can access and change the actual data on the server while users are editing local copies of the data,
resulting in an update conflict when cached updates are applied to the database.
Other applications cannot access data changes made by an application until its cached updates are applied to the database.
Note: To change the CachedUpdate property value for TFDTable, it must be inactive.

Example

FDQuery1.CachedUpdates := True;
...
FDQuery1.Edit;
...
FDQuery1.Post;
...
FDQuery1.Append;
...
FDQuery1.Post;
...
FDQuery1.ApplyUpdates;
FDQuery1.CommitUpdates;
FDQuery1.CachedUpdates := False;
}


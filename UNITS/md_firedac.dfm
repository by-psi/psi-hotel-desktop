object dm_firedac: Tdm_firedac
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 444
  Width = 680
  object query_login: TFDQuery
    Active = True
    Connection = Connection_1
    SQL.Strings = (
      
        'SELECT * FROM T_USUARIOS WHERE USUARIO = :USUARIO AND SENHA = PA' +
        'SSWORD(md5(:SENHA)) ')
    Left = 552
    Top = 304
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = 'GERENCIA'
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = '1259'
      end>
    object query_loginFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_loginID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 6
    end
    object query_loginUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 18
    end
    object query_loginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object query_loginHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
    end
    object query_loginHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
    end
    object query_loginIDC: TIntegerField
      FieldName = 'IDC'
      Origin = 'IDC'
      Required = True
    end
  end
  object WaitCursor_1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 16
  end
  object q_empresa: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_empresa')
    Left = 40
    Top = 88
    object q_empresaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_empresaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      Size = 35
    end
    object q_empresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 18
    end
    object q_empresaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Required = True
      Size = 16
    end
    object q_empresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 45
    end
    object q_empresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 18
    end
    object q_empresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 18
    end
    object q_empresaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object q_empresaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 9
    end
    object q_empresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 18
    end
    object q_empresaFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Required = True
      Size = 18
    end
    object q_empresaCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Required = True
      Size = 18
    end
    object q_empresaRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Origin = 'RESPONSAVEL'
      Required = True
      Size = 35
    end
    object q_empresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 255
    end
    object q_empresaSMTP_HOST: TStringField
      FieldName = 'SMTP_HOST'
      Origin = 'SMTP_HOST'
      Required = True
      Size = 60
    end
    object q_empresaSMTP_USER: TStringField
      FieldName = 'SMTP_USER'
      Origin = 'SMTP_USER'
      Required = True
      Size = 40
    end
    object q_empresaSMTP_PASSWORD: TStringField
      FieldName = 'SMTP_PASSWORD'
      Origin = 'SMTP_PASSWORD'
      Required = True
      Size = 18
    end
    object q_empresaSMTP_PORT: TIntegerField
      FieldName = 'SMTP_PORT'
      Origin = 'SMTP_PORT'
      Required = True
    end
    object q_empresaVERSAO: TStringField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      Required = True
      Size = 6
    end
    object q_empresaDT_ULTRV: TDateField
      FieldName = 'DT_ULTRV'
      Origin = 'DT_ULTRV'
      Required = True
    end
    object q_empresaSAIDA_I: TIntegerField
      FieldName = 'SAIDA_I'
      Origin = 'SAIDA_I'
      Required = True
    end
    object q_empresaSC_SIZE: TIntegerField
      FieldName = 'SC_SIZE'
      Origin = 'SC_SIZE'
      Required = True
    end
    object q_empresaULTIMA_C: TStringField
      FieldName = 'ULTIMA_C'
      Origin = 'ULTIMA_C'
      Required = True
      Size = 6
    end
    object q_empresaVR_MINIMO: TFloatField
      FieldName = 'VR_MINIMO'
      Origin = 'VR_MINIMO'
      Required = True
    end
    object q_empresaTXA_CM: TFloatField
      FieldName = 'TXA_CM'
      Origin = 'TXA_CM'
      Required = True
    end
    object q_empresaTOLERANCIA: TIntegerField
      FieldName = 'TOLERANCIA'
      Origin = 'TOLERANCIA'
      Required = True
    end
    object q_empresaLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
      Required = True
    end
    object q_empresaAVISO: TMemoField
      FieldName = 'AVISO'
      Origin = 'AVISO'
      Required = True
      BlobType = ftMemo
    end
    object q_empresaTIPO_ACESSO: TStringField
      FieldName = 'TIPO_ACESSO'
      Origin = 'TIPO_ACESSO'
      Required = True
      Size = 10
    end
    object q_empresaLOCAL_SERV: TStringField
      FieldName = 'LOCAL_SERV'
      Origin = 'LOCAL_SERV'
      Required = True
      Size = 45
    end
    object q_empresaLOCAL_USER: TStringField
      FieldName = 'LOCAL_USER'
      Origin = 'LOCAL_USER'
      Required = True
      Size = 18
    end
    object q_empresaLOCAL_PASSWORD: TStringField
      FieldName = 'LOCAL_PASSWORD'
      Origin = 'LOCAL_PASSWORD'
      Required = True
      Size = 100
    end
    object q_empresaLOCAL_DB: TStringField
      FieldName = 'LOCAL_DB'
      Origin = 'LOCAL_DB'
      Required = True
      Size = 28
    end
    object q_empresaWEB_SERV: TStringField
      FieldName = 'WEB_SERV'
      Origin = 'WEB_SERV'
      Required = True
      Size = 45
    end
    object q_empresaWEB_USER: TStringField
      FieldName = 'WEB_USER'
      Origin = 'WEB_USER'
      Required = True
      Size = 18
    end
    object q_empresaWEB_PASSWORD: TStringField
      FieldName = 'WEB_PASSWORD'
      Origin = 'WEB_PASSWORD'
      Required = True
      Size = 100
    end
    object q_empresaWEB_DB: TStringField
      FieldName = 'WEB_DB'
      Origin = 'WEB_DB'
      Required = True
      Size = 28
    end
    object q_empresaPATH_APLICACAO: TStringField
      FieldName = 'PATH_APLICACAO'
      Origin = 'PATH_APLICACAO'
      Required = True
      Size = 60
    end
    object q_empresaENVIO_BACKUP: TStringField
      FieldName = 'ENVIO_BACKUP'
      Origin = 'ENVIO_BACKUP'
      Required = True
      Size = 1
    end
    object q_empresaENVIO_SMTP: TStringField
      FieldName = 'ENVIO_SMTP'
      Origin = 'ENVIO_SMTP'
      Required = True
      Size = 1
    end
    object q_empresaENVIO_HTTP: TStringField
      FieldName = 'ENVIO_HTTP'
      Origin = 'ENVIO_HTTP'
      Required = True
      Size = 1
    end
    object q_empresaPATH_1: TStringField
      FieldName = 'PATH_1'
      Origin = 'PATH_1'
      Required = True
      Size = 60
    end
    object q_empresaPATH_2: TStringField
      FieldName = 'PATH_2'
      Origin = 'PATH_2'
      Required = True
      Size = 60
    end
    object q_empresaPATH_3: TStringField
      FieldName = 'PATH_3'
      Origin = 'PATH_3'
      Required = True
      Size = 60
    end
  end
  object q_feriados: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_feriados')
    Left = 40
    Top = 136
    object q_feriadosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_feriadosDT_EVENTO: TDateField
      FieldName = 'DT_EVENTO'
      Origin = 'DT_EVENTO'
      Required = True
    end
    object q_feriadosDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object q_feriadosFERIADO: TStringField
      FieldName = 'FERIADO'
      Origin = 'FERIADO'
      Required = True
      Size = 28
    end
    object q_feriadosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_apartamentos: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_apartamentos')
    Left = 40
    Top = 184
    object q_apartamentosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_apartamentosAPTO: TStringField
      FieldName = 'APTO'
      Origin = 'APTO'
      Required = True
      Size = 10
    end
    object q_apartamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object q_apartamentosTABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      Size = 1
    end
    object q_apartamentosVALOR_HR1: TFloatField
      FieldName = 'VALOR_HR1'
      Origin = 'VALOR_HR1'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_HR2: TFloatField
      FieldName = 'VALOR_HR2'
      Origin = 'VALOR_HR2'
      Required = True
      currency = True
    end
    object q_apartamentosFRANQUIA: TTimeField
      FieldName = 'FRANQUIA'
      Origin = 'FRANQUIA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object q_apartamentosVALOR_HE1: TFloatField
      FieldName = 'VALOR_HE1'
      Origin = 'VALOR_HE1'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_HE2: TFloatField
      FieldName = 'VALOR_HE2'
      Origin = 'VALOR_HE2'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_P1: TFloatField
      FieldName = 'VALOR_P1'
      Origin = 'VALOR_P1'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_P2: TFloatField
      FieldName = 'VALOR_P2'
      Origin = 'VALOR_P2'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_D1: TFloatField
      FieldName = 'VALOR_D1'
      Origin = 'VALOR_D1'
      Required = True
      currency = True
    end
    object q_apartamentosVALOR_D2: TFloatField
      FieldName = 'VALOR_D2'
      Origin = 'VALOR_D2'
      Required = True
      currency = True
    end
    object q_apartamentosDIARIA_24H1: TFloatField
      FieldName = 'DIARIA_24H1'
      Origin = 'DIARIA_24H1'
      Required = True
      currency = True
    end
    object q_apartamentosDIARIA_24H2: TFloatField
      FieldName = 'DIARIA_24H2'
      Origin = 'DIARIA_24H2'
      Required = True
      currency = True
    end
    object q_apartamentosDIARIA: TStringField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
      Size = 6
    end
    object q_apartamentosCHV_D: TStringField
      FieldName = 'CHV_D'
      Origin = 'CHV_D'
      Required = True
      Size = 18
    end
  end
  object q_fornecedores: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_fornecedores')
    Left = 112
    Top = 88
    object q_fornecedoresFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_fornecedoresID_FORNEC: TStringField
      FieldName = 'ID_FORNEC'
      Origin = 'ID_FORNEC'
      Required = True
      Size = 6
    end
    object q_fornecedoresFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
      Size = 35
    end
    object q_fornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 45
    end
    object q_fornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 18
    end
    object q_fornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 30
    end
    object q_fornecedoresUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object q_fornecedoresCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 9
    end
    object q_fornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 18
    end
    object q_fornecedoresINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Required = True
      Size = 16
    end
    object q_fornecedoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Required = True
      Size = 18
    end
    object q_fornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 18
    end
    object q_fornecedoresFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Required = True
      Size = 18
    end
    object q_fornecedoresCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Required = True
      Size = 18
    end
    object q_fornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 60
    end
  end
  object q_grupos: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_grupos')
    Left = 112
    Top = 136
    object q_gruposFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_gruposID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object q_gruposGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
      Size = 28
    end
    object q_gruposCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_produtos: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_produtos order by id_grupo,produto')
    Left = 112
    Top = 184
    object q_produtosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_produtosID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object q_produtosID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 3
    end
    object q_produtosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      Size = 45
    end
    object q_produtosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object q_produtosVR_CUSTO: TFloatField
      FieldName = 'VR_CUSTO'
      Origin = 'VR_CUSTO'
      Required = True
    end
    object q_produtosVR_VENDA: TFloatField
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      Required = True
    end
    object q_produtosESTQ_M: TIntegerField
      FieldName = 'ESTQ_M'
      Origin = 'ESTQ_M'
      Required = True
    end
    object q_produtosENTRADAS: TIntegerField
      FieldName = 'ENTRADAS'
      Origin = 'ENTRADAS'
      Required = True
    end
    object q_produtosSAIDAS: TIntegerField
      FieldName = 'SAIDAS'
      Origin = 'SAIDAS'
      Required = True
    end
    object q_produtosSD_ATUAL: TIntegerField
      FieldName = 'SD_ATUAL'
      Origin = 'SD_ATUAL'
      Required = True
    end
    object q_produtosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_estoque: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_estoque')
    Left = 112
    Top = 232
    object q_estoqueFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_estoqueDH_LANCAMENTO: TDateTimeField
      FieldName = 'DH_LANCAMENTO'
      Origin = 'DH_LANCAMENTO'
      Required = True
    end
    object q_estoqueID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object q_estoqueID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 2
    end
    object q_estoqueHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 60
    end
    object q_estoqueUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object q_estoqueSD_ANTERIOR: TIntegerField
      FieldName = 'SD_ANTERIOR'
      Origin = 'SD_ANTERIOR'
      Required = True
    end
    object q_estoqueENTRADAS: TIntegerField
      FieldName = 'ENTRADAS'
      Origin = 'ENTRADAS'
      Required = True
    end
    object q_estoqueSAIDAS: TIntegerField
      FieldName = 'SAIDAS'
      Origin = 'SAIDAS'
      Required = True
    end
    object q_estoqueSD_ATUAL: TIntegerField
      FieldName = 'SD_ATUAL'
      Origin = 'SD_ATUAL'
      Required = True
    end
    object q_estoqueCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_caixa: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_caixa')
    Left = 112
    Top = 280
    object q_caixaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_caixaCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      Required = True
      Size = 6
    end
    object q_caixaENTRADA: TDateTimeField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
    end
    object q_caixaSAIDA: TDateTimeField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
    end
    object q_caixaRECEPCAO: TStringField
      FieldName = 'RECEPCAO'
      Origin = 'RECEPCAO'
      Required = True
      Size = 18
    end
    object q_caixaT_CXAREC: TFloatField
      FieldName = 'T_CXAREC'
      Origin = 'T_CXAREC'
      Required = True
    end
    object q_caixaT_CXADEIXADO: TFloatField
      FieldName = 'T_CXADEIXADO'
      Origin = 'T_CXADEIXADO'
      Required = True
    end
    object q_caixaT_DIARIAS: TFloatField
      FieldName = 'T_DIARIAS'
      Origin = 'T_DIARIAS'
      Required = True
    end
    object q_caixaT_PEDIDOS: TFloatField
      FieldName = 'T_PEDIDOS'
      Origin = 'T_PEDIDOS'
      Required = True
    end
    object q_caixaT_EXTRAS: TFloatField
      FieldName = 'T_EXTRAS'
      Origin = 'T_EXTRAS'
      Required = True
    end
    object q_caixaT_DESCONTOS: TFloatField
      FieldName = 'T_DESCONTOS'
      Origin = 'T_DESCONTOS'
      Required = True
    end
    object q_caixaT_BRUTO: TFloatField
      FieldName = 'T_BRUTO'
      Origin = 'T_BRUTO'
      Required = True
    end
    object q_caixaT_META: TFloatField
      FieldName = 'T_META'
      Origin = 'T_META'
      Required = True
    end
    object q_caixaT_COMISSAO: TFloatField
      FieldName = 'T_COMISSAO'
      Origin = 'T_COMISSAO'
      Required = True
    end
    object q_caixaT_CARTAO: TFloatField
      FieldName = 'T_CARTAO'
      Origin = 'T_CARTAO'
      Required = True
    end
    object q_caixaT_DINHEIRO: TFloatField
      FieldName = 'T_DINHEIRO'
      Origin = 'T_DINHEIRO'
      Required = True
    end
    object q_caixaT_RECEBIDO: TFloatField
      FieldName = 'T_RECEBIDO'
      Origin = 'T_RECEBIDO'
      Required = True
    end
    object q_caixaT_REPCXA: TFloatField
      FieldName = 'T_REPCXA'
      Origin = 'T_REPCXA'
      Required = True
    end
    object q_caixaT_DESPESAS: TFloatField
      FieldName = 'T_DESPESAS'
      Origin = 'T_DESPESAS'
      Required = True
    end
    object q_caixaT_VALES: TFloatField
      FieldName = 'T_VALES'
      Origin = 'T_VALES'
      Required = True
    end
    object q_caixaT_VALETRANSPORTE: TFloatField
      FieldName = 'T_VALETRANSPORTE'
      Origin = 'T_VALETRANSPORTE'
      Required = True
    end
    object q_caixaT_LIQENV: TFloatField
      FieldName = 'T_LIQENV'
      Origin = 'T_LIQENV'
      Required = True
    end
    object q_caixaT_DIF: TFloatField
      FieldName = 'T_DIF'
      Origin = 'T_DIF'
      Required = True
    end
    object q_caixaT_REC: TFloatField
      FieldName = 'T_REC'
      Origin = 'T_REC'
      Required = True
    end
    object q_caixaENVIO_OK: TStringField
      FieldName = 'ENVIO_OK'
      Origin = 'ENVIO_OK'
      Required = True
      Size = 1
    end
    object q_caixaENVIO_DT: TDateTimeField
      FieldName = 'ENVIO_DT'
      Origin = 'ENVIO_DT'
      Required = True
    end
    object q_caixaCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_rouparia: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_rouparia')
    Left = 112
    Top = 328
    object q_roupariaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_roupariaDIARIA: TStringField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
      Size = 6
    end
    object q_roupariaDH_RETIRADA: TDateTimeField
      FieldName = 'DH_RETIRADA'
      Origin = 'DH_RETIRADA'
      Required = True
    end
    object q_roupariaLC: TIntegerField
      FieldName = 'LC'
      Origin = 'LC'
      Required = True
    end
    object q_roupariaFR: TIntegerField
      FieldName = 'FR'
      Origin = 'FR'
      Required = True
    end
    object q_roupariaTB: TIntegerField
      FieldName = 'TB'
      Origin = 'TB'
      Required = True
    end
    object q_roupariaTR: TIntegerField
      FieldName = 'TR'
      Origin = 'TR'
      Required = True
    end
    object q_roupariaTP: TIntegerField
      FieldName = 'TP'
      Origin = 'TP'
      Required = True
    end
    object q_roupariaTM: TIntegerField
      FieldName = 'TM'
      Origin = 'TM'
      Required = True
    end
    object q_roupariaEC: TIntegerField
      FieldName = 'EC'
      Origin = 'EC'
      Required = True
    end
    object q_roupariaCOLETA: TStringField
      FieldName = 'COLETA'
      Origin = 'COLETA'
      Required = True
      Size = 6
    end
    object q_roupariaCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_coletas: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_coletas')
    Left = 112
    Top = 376
    object q_coletasFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_coletasDH_COLETA: TDateTimeField
      FieldName = 'DH_COLETA'
      Origin = 'DH_COLETA'
      Required = True
    end
    object q_coletasRECEPCAO: TStringField
      FieldName = 'RECEPCAO'
      Origin = 'RECEPCAO'
      Required = True
      Size = 18
    end
    object q_coletasLC: TIntegerField
      FieldName = 'LC'
      Origin = 'LC'
      Required = True
    end
    object q_coletasFR: TIntegerField
      FieldName = 'FR'
      Origin = 'FR'
      Required = True
    end
    object q_coletasTB: TIntegerField
      FieldName = 'TB'
      Origin = 'TB'
      Required = True
    end
    object q_coletasTR: TIntegerField
      FieldName = 'TR'
      Origin = 'TR'
      Required = True
    end
    object q_coletasTP: TIntegerField
      FieldName = 'TP'
      Origin = 'TP'
      Required = True
    end
    object q_coletasEC: TIntegerField
      FieldName = 'EC'
      Origin = 'EC'
      Required = True
    end
    object q_coletasCOLETA: TStringField
      FieldName = 'COLETA'
      Origin = 'COLETA'
      Required = True
      Size = 6
    end
    object q_coletasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_diarias: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_diarias')
    Left = 184
    Top = 88
    object q_diariasFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_diariasCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
      Size = 6
    end
    object q_diariasAP: TStringField
      FieldName = 'AP'
      Origin = 'AP'
      Required = True
      Size = 2
    end
    object q_diariasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 12
    end
    object q_diariasDS: TSmallintField
      FieldName = 'DS'
      Origin = 'DS'
      Required = True
    end
    object q_diariasDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'DT_ENTRADA'
      Required = True
    end
    object q_diariasDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
      Origin = 'DT_SAIDA'
      Required = True
    end
    object q_diariasHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
    end
    object q_diariasHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
    end
    object q_diariasRC_ENTRADA: TStringField
      FieldName = 'RC_ENTRADA'
      Origin = 'RC_ENTRADA'
      Required = True
      Size = 18
    end
    object q_diariasRC_SAIDA: TStringField
      FieldName = 'RC_SAIDA'
      Origin = 'RC_SAIDA'
      Required = True
      Size = 18
    end
    object q_diariasCX_ENTRADA: TStringField
      FieldName = 'CX_ENTRADA'
      Origin = 'CX_ENTRADA'
      Required = True
      Size = 6
    end
    object q_diariasCX_SAIDA: TStringField
      FieldName = 'CX_SAIDA'
      Origin = 'CX_SAIDA'
      Required = True
      Size = 6
    end
    object q_diariasHR_USO: TTimeField
      FieldName = 'HR_USO'
      Origin = 'HR_USO'
      Required = True
    end
    object q_diariasHR_FRANQUIA: TTimeField
      FieldName = 'HR_FRANQUIA'
      Origin = 'HR_FRANQUIA'
      Required = True
    end
    object q_diariasHR_EXCEDENTES: TTimeField
      FieldName = 'HR_EXCEDENTES'
      Origin = 'HR_EXCEDENTES'
      Required = True
    end
    object q_diariasVR_LOCACAO: TFloatField
      FieldName = 'VR_LOCACAO'
      Origin = 'VR_LOCACAO'
      Required = True
      currency = True
    end
    object q_diariasVR_HE: TFloatField
      FieldName = 'VR_HE'
      Origin = 'VR_HE'
      Required = True
      currency = True
    end
    object q_diariasVR_HORASEXCEDENTES: TFloatField
      FieldName = 'VR_HORASEXCEDENTES'
      Origin = 'VR_HORASEXCEDENTES'
      Required = True
      currency = True
    end
    object q_diariasVR_HORASUSO: TFloatField
      FieldName = 'VR_HORASUSO'
      Origin = 'VR_HORASUSO'
      Required = True
      currency = True
    end
    object q_diariasVR_PEDIDOS: TFloatField
      FieldName = 'VR_PEDIDOS'
      Origin = 'VR_PEDIDOS'
      Required = True
      currency = True
    end
    object q_diariasVR_EXTRAS: TFloatField
      FieldName = 'VR_EXTRAS'
      Origin = 'VR_EXTRAS'
      Required = True
      currency = True
    end
    object q_diariasVR_DESCONTO: TFloatField
      FieldName = 'VR_DESCONTO'
      Origin = 'VR_DESCONTO'
      Required = True
      currency = True
    end
    object q_diariasVR_TOTAL: TFloatField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
      Required = True
      currency = True
    end
    object q_diariasRC_CE: TFloatField
      FieldName = 'RC_CE'
      Origin = 'RC_CE'
      Required = True
      currency = True
    end
    object q_diariasRC_DE: TFloatField
      FieldName = 'RC_DE'
      Origin = 'RC_DE'
      Required = True
      currency = True
    end
    object q_diariasVR_ENTRADA: TFloatField
      FieldName = 'VR_ENTRADA'
      Origin = 'VR_ENTRADA'
      Required = True
      currency = True
    end
    object q_diariasRC_CS: TFloatField
      FieldName = 'RC_CS'
      Origin = 'RC_CS'
      Required = True
      currency = True
    end
    object q_diariasRC_DS: TFloatField
      FieldName = 'RC_DS'
      Origin = 'RC_DS'
      Required = True
      currency = True
    end
    object q_diariasVR_SAIDA: TFloatField
      FieldName = 'VR_SAIDA'
      Origin = 'VR_SAIDA'
      Required = True
      currency = True
    end
    object q_diariasRC_CARTAO: TFloatField
      FieldName = 'RC_CARTAO'
      Origin = 'RC_CARTAO'
      Required = True
      currency = True
    end
    object q_diariasRC_DINHEIRO: TFloatField
      FieldName = 'RC_DINHEIRO'
      Origin = 'RC_DINHEIRO'
      Required = True
      currency = True
    end
    object q_diariasVR_RECEBIDO: TFloatField
      FieldName = 'VR_RECEBIDO'
      Origin = 'VR_RECEBIDO'
      Required = True
      currency = True
    end
    object q_diariasVR_TROCO: TFloatField
      FieldName = 'VR_TROCO'
      Origin = 'VR_TROCO'
      Required = True
      currency = True
    end
    object q_diariasDF_TROCO: TFloatField
      FieldName = 'DF_TROCO'
      Origin = 'DF_TROCO'
      Required = True
      currency = True
    end
    object q_diariasCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      Required = True
      Size = 6
    end
    object q_diariasCHECK_OUT: TStringField
      FieldName = 'CHECK_OUT'
      Origin = 'CHECK_OUT'
      Required = True
      Size = 1
    end
    object q_diariasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_pedidos: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_pedidos order by conta')
    Left = 184
    Top = 136
    object q_pedidosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_pedidosCOMANDA: TStringField
      FieldName = 'COMANDA'
      Origin = 'COMANDA'
      Required = True
      Size = 6
    end
    object q_pedidosCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
      Size = 6
    end
    object q_pedidosDH_LANCAMENTO: TDateTimeField
      FieldName = 'DH_LANCAMENTO'
      Origin = 'DH_LANCAMENTO'
      Required = True
    end
    object q_pedidosID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 3
    end
    object q_pedidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
    object q_pedidosQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
    end
    object q_pedidosVR_UN: TFloatField
      FieldName = 'VR_UN'
      Origin = 'VR_UN'
      Required = True
      currency = True
    end
    object q_pedidosVR_TOTAL: TFloatField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
      Required = True
      currency = True
    end
    object q_pedidosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object q_usuarios: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_usuarios')
    Left = 184
    Top = 184
    object q_usuariosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_usuariosID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 6
    end
    object q_usuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 18
    end
    object q_usuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object q_usuariosHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
    end
    object q_usuariosHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
    end
    object q_usuariosIDC: TIntegerField
      FieldName = 'IDC'
      Origin = 'IDC'
      Required = True
    end
  end
  object query_idc: TFDQuery
    Active = True
    AfterPost = QueryApplyUpdates
    AfterCancel = QueryApplyUpdates
    AfterDelete = QueryApplyUpdates
    CachedUpdates = True
    Connection = Connection_1
    SQL.Strings = (
      'select * from T_idc')
    Left = 184
    Top = 232
    object query_idcFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_idcID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 6
    end
    object query_idcIDC: TLongWordField
      FieldName = 'IDC'
      Origin = 'IDC'
      Required = True
    end
  end
  object T_empresa: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_empresa'
    TableName = 'psi_hotel.t_empresa'
    Left = 280
    Top = 88
    object T_empresaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_empresaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      Size = 35
    end
    object T_empresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '!99.999.999/9999-99;1;_'
      Size = 18
    end
    object T_empresaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Required = True
      EditMask = '!999.999.999.9999;1;_'
      Size = 16
    end
    object T_empresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 45
    end
    object T_empresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 18
    end
    object T_empresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 18
    end
    object T_empresaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object T_empresaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      EditMask = '!99999-999;1;_'
      Size = 9
    end
    object T_empresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 18
    end
    object T_empresaFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Required = True
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 18
    end
    object T_empresaCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Required = True
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 18
    end
    object T_empresaRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Origin = 'RESPONSAVEL'
      Required = True
      Size = 35
    end
    object T_empresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 255
    end
    object T_empresaSMTP_HOST: TStringField
      FieldName = 'SMTP_HOST'
      Origin = 'SMTP_HOST'
      Required = True
      Size = 60
    end
    object T_empresaSMTP_USER: TStringField
      FieldName = 'SMTP_USER'
      Origin = 'SMTP_USER'
      Required = True
      Size = 40
    end
    object T_empresaSMTP_PASSWORD: TStringField
      FieldName = 'SMTP_PASSWORD'
      Origin = 'SMTP_PASSWORD'
      Required = True
      Size = 18
    end
    object T_empresaSMTP_PORT: TIntegerField
      FieldName = 'SMTP_PORT'
      Origin = 'SMTP_PORT'
      Required = True
    end
    object T_empresaVERSAO: TStringField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      Required = True
      Size = 6
    end
    object T_empresaDT_ULTRV: TDateField
      FieldName = 'DT_ULTRV'
      Origin = 'DT_ULTRV'
      Required = True
      EditMask = '!99/99/9900;1;_'
    end
    object T_empresaSAIDA_I: TIntegerField
      FieldName = 'SAIDA_I'
      Origin = 'SAIDA_I'
      Required = True
    end
    object T_empresaSC_SIZE: TIntegerField
      FieldName = 'SC_SIZE'
      Origin = 'SC_SIZE'
      Required = True
    end
    object T_empresaULTIMA_C: TStringField
      FieldName = 'ULTIMA_C'
      Origin = 'ULTIMA_C'
      Required = True
      Size = 6
    end
    object T_empresaVR_MINIMO: TFloatField
      FieldName = 'VR_MINIMO'
      Origin = 'VR_MINIMO'
      Required = True
      currency = True
    end
    object T_empresaTXA_CM: TFloatField
      FieldName = 'TXA_CM'
      Origin = 'TXA_CM'
      Required = True
    end
    object T_empresaTOLERANCIA: TIntegerField
      FieldName = 'TOLERANCIA'
      Origin = 'TOLERANCIA'
      Required = True
    end
    object T_empresaLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
      Required = True
    end
    object T_empresaAVISO: TMemoField
      FieldName = 'AVISO'
      Origin = 'AVISO'
      Required = True
      BlobType = ftMemo
    end
    object T_empresaTIPO_ACESSO: TStringField
      FieldName = 'TIPO_ACESSO'
      Origin = 'TIPO_ACESSO'
      Required = True
      Size = 10
    end
    object T_empresaLOCAL_SERV: TStringField
      FieldName = 'LOCAL_SERV'
      Origin = 'LOCAL_SERV'
      Required = True
      Size = 45
    end
    object T_empresaLOCAL_USER: TStringField
      FieldName = 'LOCAL_USER'
      Origin = 'LOCAL_USER'
      Required = True
      Size = 18
    end
    object T_empresaLOCAL_PASSWORD: TStringField
      FieldName = 'LOCAL_PASSWORD'
      Origin = 'LOCAL_PASSWORD'
      Required = True
      Size = 100
    end
    object T_empresaLOCAL_DB: TStringField
      FieldName = 'LOCAL_DB'
      Origin = 'LOCAL_DB'
      Required = True
      Size = 28
    end
    object T_empresaWEB_SERV: TStringField
      FieldName = 'WEB_SERV'
      Origin = 'WEB_SERV'
      Required = True
      Size = 45
    end
    object T_empresaWEB_USER: TStringField
      FieldName = 'WEB_USER'
      Origin = 'WEB_USER'
      Required = True
      Size = 18
    end
    object T_empresaWEB_PASSWORD: TStringField
      FieldName = 'WEB_PASSWORD'
      Origin = 'WEB_PASSWORD'
      Required = True
      Size = 100
    end
    object T_empresaWEB_DB: TStringField
      FieldName = 'WEB_DB'
      Origin = 'WEB_DB'
      Required = True
      Size = 28
    end
    object T_empresaPATH_APLICACAO: TStringField
      FieldName = 'PATH_APLICACAO'
      Origin = 'PATH_APLICACAO'
      Required = True
      Size = 60
    end
    object T_empresaENVIO_BACKUP: TStringField
      FieldName = 'ENVIO_BACKUP'
      Origin = 'ENVIO_BACKUP'
      Required = True
      Size = 1
    end
    object T_empresaENVIO_SMTP: TStringField
      FieldName = 'ENVIO_SMTP'
      Origin = 'ENVIO_SMTP'
      Required = True
      Size = 1
    end
    object T_empresaENVIO_HTTP: TStringField
      FieldName = 'ENVIO_HTTP'
      Origin = 'ENVIO_HTTP'
      Required = True
      Size = 1
    end
    object T_empresaPATH_1: TStringField
      FieldName = 'PATH_1'
      Origin = 'PATH_1'
      Required = True
      Size = 60
    end
    object T_empresaPATH_2: TStringField
      FieldName = 'PATH_2'
      Origin = 'PATH_2'
      Required = True
      Size = 60
    end
    object T_empresaPATH_3: TStringField
      FieldName = 'PATH_3'
      Origin = 'PATH_3'
      Required = True
      Size = 60
    end
  end
  object T_feriados: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_feriados'
    TableName = 'psi_hotel.t_feriados'
    Left = 280
    Top = 136
    object T_feriadosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_feriadosDT_EVENTO: TDateField
      FieldName = 'DT_EVENTO'
      Origin = 'DT_EVENTO'
      Required = True
      EditMask = '!99/99/9900;1;_'
    end
    object T_feriadosDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
      EditMask = '!99/99/9900;1;_'
    end
    object T_feriadosFERIADO: TStringField
      FieldName = 'FERIADO'
      Origin = 'FERIADO'
      Required = True
      Size = 28
    end
    object T_feriadosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_apartamentos: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_apartamentos'
    TableName = 'psi_hotel.t_apartamentos'
    Left = 280
    Top = 184
    object T_apartamentosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_apartamentosAPTO: TStringField
      FieldName = 'APTO'
      Origin = 'APTO'
      Required = True
      Size = 10
    end
    object T_apartamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object T_apartamentosTABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      Size = 1
    end
    object T_apartamentosVALOR_HR1: TFloatField
      FieldName = 'VALOR_HR1'
      Origin = 'VALOR_HR1'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_HR2: TFloatField
      FieldName = 'VALOR_HR2'
      Origin = 'VALOR_HR2'
      Required = True
      currency = True
    end
    object T_apartamentosFRANQUIA: TTimeField
      FieldName = 'FRANQUIA'
      Origin = 'FRANQUIA'
      Required = True
    end
    object T_apartamentosVALOR_HE1: TFloatField
      FieldName = 'VALOR_HE1'
      Origin = 'VALOR_HE1'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_HE2: TFloatField
      FieldName = 'VALOR_HE2'
      Origin = 'VALOR_HE2'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_P1: TFloatField
      FieldName = 'VALOR_P1'
      Origin = 'VALOR_P1'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_P2: TFloatField
      FieldName = 'VALOR_P2'
      Origin = 'VALOR_P2'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_D1: TFloatField
      FieldName = 'VALOR_D1'
      Origin = 'VALOR_D1'
      Required = True
      currency = True
    end
    object T_apartamentosVALOR_D2: TFloatField
      FieldName = 'VALOR_D2'
      Origin = 'VALOR_D2'
      Required = True
      currency = True
    end
    object T_apartamentosDIARIA_24H1: TFloatField
      FieldName = 'DIARIA_24H1'
      Origin = 'DIARIA_24H1'
      Required = True
      currency = True
    end
    object T_apartamentosDIARIA_24H2: TFloatField
      FieldName = 'DIARIA_24H2'
      Origin = 'DIARIA_24H2'
      Required = True
      currency = True
    end
    object T_apartamentosDIARIA: TStringField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
      Size = 6
    end
    object T_apartamentosCHV_D: TStringField
      FieldName = 'CHV_D'
      Origin = 'CHV_D'
      Required = True
      Size = 18
    end
  end
  object T_fornecedores: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_fornecedores'
    TableName = 'psi_hotel.t_fornecedores'
    Left = 352
    Top = 88
    object T_fornecedoresFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_fornecedoresID_FORNEC: TStringField
      FieldName = 'ID_FORNEC'
      Origin = 'ID_FORNEC'
      Required = True
      Size = 6
    end
    object T_fornecedoresFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
      Size = 35
    end
    object T_fornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 45
    end
    object T_fornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 18
    end
    object T_fornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 30
    end
    object T_fornecedoresUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object T_fornecedoresCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      EditMask = '!99999-000;1;_'
      Size = 9
    end
    object T_fornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '!99.999.999/9999-99;1;_'
      Size = 18
    end
    object T_fornecedoresINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Required = True
      EditMask = '!999.999.999.9999;1;_'
      Size = 16
    end
    object T_fornecedoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Required = True
      Size = 18
    end
    object T_fornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '!\(99\) 0000-0000;1;_'
      Size = 18
    end
    object T_fornecedoresFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Required = True
      EditMask = '!\(99\) 0000-0000;1;_'
      Size = 18
    end
    object T_fornecedoresCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Required = True
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 18
    end
    object T_fornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 60
    end
  end
  object T_grupos: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_grupos'
    TableName = 'psi_hotel.t_grupos'
    Left = 352
    Top = 136
    object T_gruposFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_gruposID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object T_gruposGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
      Size = 28
    end
    object T_gruposCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_produtos: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_produtos'
    TableName = 'psi_hotel.t_produtos'
    Left = 352
    Top = 184
    object T_produtosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_produtosID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object T_produtosID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 3
    end
    object T_produtosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      Size = 45
    end
    object T_produtosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object T_produtosVR_CUSTO: TFloatField
      FieldName = 'VR_CUSTO'
      Origin = 'VR_CUSTO'
      Required = True
      currency = True
    end
    object T_produtosVR_VENDA: TFloatField
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      Required = True
      currency = True
    end
    object T_produtosESTQ_M: TIntegerField
      FieldName = 'ESTQ_M'
      Origin = 'ESTQ_M'
      Required = True
    end
    object T_produtosENTRADAS: TIntegerField
      FieldName = 'ENTRADAS'
      Origin = 'ENTRADAS'
      Required = True
    end
    object T_produtosSAIDAS: TIntegerField
      FieldName = 'SAIDAS'
      Origin = 'SAIDAS'
      Required = True
    end
    object T_produtosSD_ATUAL: TIntegerField
      FieldName = 'SD_ATUAL'
      Origin = 'SD_ATUAL'
      Required = True
    end
    object T_produtosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_estoque: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_estoque'
    TableName = 'psi_hotel.t_estoque'
    Left = 352
    Top = 232
    object T_estoqueFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_estoqueDH_LANCAMENTO: TDateTimeField
      FieldName = 'DH_LANCAMENTO'
      Origin = 'DH_LANCAMENTO'
      Required = True
      EditMask = '!99/99/9900 90:00:00;1;_'
    end
    object T_estoqueID_GRUPO: TStringField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
      Size = 2
    end
    object T_estoqueID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 2
    end
    object T_estoqueHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 60
    end
    object T_estoqueUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object T_estoqueSD_ANTERIOR: TIntegerField
      FieldName = 'SD_ANTERIOR'
      Origin = 'SD_ANTERIOR'
      Required = True
    end
    object T_estoqueENTRADAS: TIntegerField
      FieldName = 'ENTRADAS'
      Origin = 'ENTRADAS'
      Required = True
    end
    object T_estoqueSAIDAS: TIntegerField
      FieldName = 'SAIDAS'
      Origin = 'SAIDAS'
      Required = True
    end
    object T_estoqueSD_ATUAL: TIntegerField
      FieldName = 'SD_ATUAL'
      Origin = 'SD_ATUAL'
      Required = True
    end
    object T_estoqueCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_caixa: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_caixa'
    TableName = 'psi_hotel.t_caixa'
    Left = 352
    Top = 280
    object T_caixaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_caixaCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      Required = True
      Size = 6
    end
    object T_caixaENTRADA: TDateTimeField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
    end
    object T_caixaSAIDA: TDateTimeField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
    end
    object T_caixaRECEPCAO: TStringField
      FieldName = 'RECEPCAO'
      Origin = 'RECEPCAO'
      Required = True
      Size = 18
    end
    object T_caixaT_CXAREC: TFloatField
      FieldName = 'T_CXAREC'
      Origin = 'T_CXAREC'
      Required = True
      currency = True
    end
    object T_caixaT_CXADEIXADO: TFloatField
      FieldName = 'T_CXADEIXADO'
      Origin = 'T_CXADEIXADO'
      Required = True
      currency = True
    end
    object T_caixaT_DIARIAS: TFloatField
      FieldName = 'T_DIARIAS'
      Origin = 'T_DIARIAS'
      Required = True
      currency = True
    end
    object T_caixaT_PEDIDOS: TFloatField
      FieldName = 'T_PEDIDOS'
      Origin = 'T_PEDIDOS'
      Required = True
      currency = True
    end
    object T_caixaT_EXTRAS: TFloatField
      FieldName = 'T_EXTRAS'
      Origin = 'T_EXTRAS'
      Required = True
      currency = True
    end
    object T_caixaT_DESCONTOS: TFloatField
      FieldName = 'T_DESCONTOS'
      Origin = 'T_DESCONTOS'
      Required = True
      currency = True
    end
    object T_caixaT_BRUTO: TFloatField
      FieldName = 'T_BRUTO'
      Origin = 'T_BRUTO'
      Required = True
      currency = True
    end
    object T_caixaT_META: TFloatField
      FieldName = 'T_META'
      Origin = 'T_META'
      Required = True
      currency = True
    end
    object T_caixaT_COMISSAO: TFloatField
      FieldName = 'T_COMISSAO'
      Origin = 'T_COMISSAO'
      Required = True
      currency = True
    end
    object T_caixaT_CARTAO: TFloatField
      FieldName = 'T_CARTAO'
      Origin = 'T_CARTAO'
      Required = True
      currency = True
    end
    object T_caixaT_DINHEIRO: TFloatField
      FieldName = 'T_DINHEIRO'
      Origin = 'T_DINHEIRO'
      Required = True
      currency = True
    end
    object T_caixaT_RECEBIDO: TFloatField
      FieldName = 'T_RECEBIDO'
      Origin = 'T_RECEBIDO'
      Required = True
      currency = True
    end
    object T_caixaT_REPCXA: TFloatField
      FieldName = 'T_REPCXA'
      Origin = 'T_REPCXA'
      Required = True
      currency = True
    end
    object T_caixaT_DESPESAS: TFloatField
      FieldName = 'T_DESPESAS'
      Origin = 'T_DESPESAS'
      Required = True
      currency = True
    end
    object T_caixaT_VALES: TFloatField
      FieldName = 'T_VALES'
      Origin = 'T_VALES'
      Required = True
      currency = True
    end
    object T_caixaT_VALETRANSPORTE: TFloatField
      FieldName = 'T_VALETRANSPORTE'
      Origin = 'T_VALETRANSPORTE'
      Required = True
      currency = True
    end
    object T_caixaT_LIQENV: TFloatField
      FieldName = 'T_LIQENV'
      Origin = 'T_LIQENV'
      Required = True
      currency = True
    end
    object T_caixaT_DIF: TFloatField
      FieldName = 'T_DIF'
      Origin = 'T_DIF'
      Required = True
      currency = True
    end
    object T_caixaT_REC: TFloatField
      FieldName = 'T_REC'
      Origin = 'T_REC'
      Required = True
      currency = True
    end
    object T_caixaENVIO_OK: TStringField
      FieldName = 'ENVIO_OK'
      Origin = 'ENVIO_OK'
      Required = True
      Size = 1
    end
    object T_caixaENVIO_DT: TDateTimeField
      FieldName = 'ENVIO_DT'
      Origin = 'ENVIO_DT'
      Required = True
    end
    object T_caixaCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_rouparia: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_rouparia'
    TableName = 'psi_hotel.t_rouparia'
    Left = 352
    Top = 328
    object T_roupariaFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_roupariaDIARIA: TStringField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
      Size = 6
    end
    object T_roupariaDH_RETIRADA: TDateTimeField
      FieldName = 'DH_RETIRADA'
      Origin = 'DH_RETIRADA'
      Required = True
      EditMask = '!99/99/9900 90:00:00;1;_'
    end
    object T_roupariaLC: TIntegerField
      FieldName = 'LC'
      Origin = 'LC'
      Required = True
    end
    object T_roupariaFR: TIntegerField
      FieldName = 'FR'
      Origin = 'FR'
      Required = True
    end
    object T_roupariaTB: TIntegerField
      FieldName = 'TB'
      Origin = 'TB'
      Required = True
    end
    object T_roupariaTR: TIntegerField
      FieldName = 'TR'
      Origin = 'TR'
      Required = True
    end
    object T_roupariaTP: TIntegerField
      FieldName = 'TP'
      Origin = 'TP'
      Required = True
    end
    object T_roupariaTM: TIntegerField
      FieldName = 'TM'
      Origin = 'TM'
      Required = True
    end
    object T_roupariaEC: TIntegerField
      FieldName = 'EC'
      Origin = 'EC'
      Required = True
    end
    object T_roupariaCOLETA: TStringField
      FieldName = 'COLETA'
      Origin = 'COLETA'
      Required = True
      Size = 6
    end
    object T_roupariaCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_coletas: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_coletas'
    TableName = 'psi_hotel.t_coletas'
    Left = 352
    Top = 376
    object T_coletasFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_coletasDH_COLETA: TDateTimeField
      FieldName = 'DH_COLETA'
      Origin = 'DH_COLETA'
      Required = True
      EditMask = '!99/99/9900 90:00:00;1;_'
    end
    object T_coletasRECEPCAO: TStringField
      FieldName = 'RECEPCAO'
      Origin = 'RECEPCAO'
      Required = True
      Size = 18
    end
    object T_coletasLC: TIntegerField
      FieldName = 'LC'
      Origin = 'LC'
      Required = True
    end
    object T_coletasFR: TIntegerField
      FieldName = 'FR'
      Origin = 'FR'
      Required = True
    end
    object T_coletasTB: TIntegerField
      FieldName = 'TB'
      Origin = 'TB'
      Required = True
    end
    object T_coletasTR: TIntegerField
      FieldName = 'TR'
      Origin = 'TR'
      Required = True
    end
    object T_coletasTP: TIntegerField
      FieldName = 'TP'
      Origin = 'TP'
      Required = True
    end
    object T_coletasEC: TIntegerField
      FieldName = 'EC'
      Origin = 'EC'
      Required = True
    end
    object T_coletasCOLETA: TStringField
      FieldName = 'COLETA'
      Origin = 'COLETA'
      Required = True
      Size = 6
    end
    object T_coletasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_diarias: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_diarias'
    TableName = 'psi_hotel.t_diarias'
    Left = 416
    Top = 88
    object T_diariasFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_diariasCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
      Size = 6
    end
    object T_diariasAP: TStringField
      FieldName = 'AP'
      Origin = 'AP'
      Required = True
      Size = 2
    end
    object T_diariasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 12
    end
    object T_diariasDS: TSmallintField
      FieldName = 'DS'
      Origin = 'DS'
      Required = True
    end
    object T_diariasDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'DT_ENTRADA'
      Required = True
      EditMask = '!99/99/9900;1;_'
    end
    object T_diariasDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
      Origin = 'DT_SAIDA'
      Required = True
      EditMask = '!99/99/9900;1;_'
    end
    object T_diariasHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_diariasHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_diariasRC_ENTRADA: TStringField
      FieldName = 'RC_ENTRADA'
      Origin = 'RC_ENTRADA'
      Required = True
      Size = 18
    end
    object T_diariasRC_SAIDA: TStringField
      FieldName = 'RC_SAIDA'
      Origin = 'RC_SAIDA'
      Required = True
      Size = 18
    end
    object T_diariasCX_ENTRADA: TStringField
      FieldName = 'CX_ENTRADA'
      Origin = 'CX_ENTRADA'
      Required = True
      Size = 6
    end
    object T_diariasCX_SAIDA: TStringField
      FieldName = 'CX_SAIDA'
      Origin = 'CX_SAIDA'
      Required = True
      Size = 6
    end
    object T_diariasHR_USO: TTimeField
      FieldName = 'HR_USO'
      Origin = 'HR_USO'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_diariasHR_FRANQUIA: TTimeField
      FieldName = 'HR_FRANQUIA'
      Origin = 'HR_FRANQUIA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_diariasHR_EXCEDENTES: TTimeField
      FieldName = 'HR_EXCEDENTES'
      Origin = 'HR_EXCEDENTES'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_diariasVR_LOCACAO: TFloatField
      FieldName = 'VR_LOCACAO'
      Origin = 'VR_LOCACAO'
      Required = True
      currency = True
    end
    object T_diariasVR_HE: TFloatField
      FieldName = 'VR_HE'
      Origin = 'VR_HE'
      Required = True
      currency = True
    end
    object T_diariasVR_HORASEXCEDENTES: TFloatField
      FieldName = 'VR_HORASEXCEDENTES'
      Origin = 'VR_HORASEXCEDENTES'
      Required = True
      currency = True
    end
    object T_diariasVR_HORASUSO: TFloatField
      FieldName = 'VR_HORASUSO'
      Origin = 'VR_HORASUSO'
      Required = True
      currency = True
    end
    object T_diariasVR_PEDIDOS: TFloatField
      FieldName = 'VR_PEDIDOS'
      Origin = 'VR_PEDIDOS'
      Required = True
      currency = True
    end
    object T_diariasVR_EXTRAS: TFloatField
      FieldName = 'VR_EXTRAS'
      Origin = 'VR_EXTRAS'
      Required = True
      currency = True
    end
    object T_diariasVR_DESCONTO: TFloatField
      FieldName = 'VR_DESCONTO'
      Origin = 'VR_DESCONTO'
      Required = True
      currency = True
    end
    object T_diariasVR_TOTAL: TFloatField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
      Required = True
      currency = True
    end
    object T_diariasRC_CE: TFloatField
      FieldName = 'RC_CE'
      Origin = 'RC_CE'
      Required = True
      currency = True
    end
    object T_diariasRC_DE: TFloatField
      FieldName = 'RC_DE'
      Origin = 'RC_DE'
      Required = True
      currency = True
    end
    object T_diariasVR_ENTRADA: TFloatField
      FieldName = 'VR_ENTRADA'
      Origin = 'VR_ENTRADA'
      Required = True
      currency = True
    end
    object T_diariasRC_CS: TFloatField
      FieldName = 'RC_CS'
      Origin = 'RC_CS'
      Required = True
      currency = True
    end
    object T_diariasRC_DS: TFloatField
      FieldName = 'RC_DS'
      Origin = 'RC_DS'
      Required = True
      currency = True
    end
    object T_diariasVR_SAIDA: TFloatField
      FieldName = 'VR_SAIDA'
      Origin = 'VR_SAIDA'
      Required = True
      currency = True
    end
    object T_diariasRC_CARTAO: TFloatField
      FieldName = 'RC_CARTAO'
      Origin = 'RC_CARTAO'
      Required = True
      currency = True
    end
    object T_diariasRC_DINHEIRO: TFloatField
      FieldName = 'RC_DINHEIRO'
      Origin = 'RC_DINHEIRO'
      Required = True
      currency = True
    end
    object T_diariasVR_RECEBIDO: TFloatField
      FieldName = 'VR_RECEBIDO'
      Origin = 'VR_RECEBIDO'
      Required = True
      currency = True
    end
    object T_diariasVR_TROCO: TFloatField
      FieldName = 'VR_TROCO'
      Origin = 'VR_TROCO'
      Required = True
      currency = True
    end
    object T_diariasDF_TROCO: TFloatField
      FieldName = 'DF_TROCO'
      Origin = 'DF_TROCO'
      Required = True
      currency = True
    end
    object T_diariasCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      Required = True
      Size = 6
    end
    object T_diariasCHECK_OUT: TStringField
      FieldName = 'CHECK_OUT'
      Origin = 'CHECK_OUT'
      Required = True
      Size = 1
    end
    object T_diariasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_pedidos: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    ObjectView = False
    CachedUpdates = True
    IndexFieldNames = 'DH_LANCAMENTO'
    MasterSource = ds_pedidosdiarias
    MasterFields = 'CONTA'
    DetailFields = 'CONTA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_pedidos'
    TableName = 'psi_hotel.t_pedidos'
    Left = 416
    Top = 136
    object T_pedidosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_pedidosCOMANDA: TStringField
      FieldName = 'COMANDA'
      Origin = 'COMANDA'
      Required = True
      Size = 6
    end
    object T_pedidosCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
      Size = 6
    end
    object T_pedidosDH_LANCAMENTO: TDateTimeField
      FieldName = 'DH_LANCAMENTO'
      Origin = 'DH_LANCAMENTO'
      Required = True
      EditMask = '!99/99/9900 90:00:00;1;_'
    end
    object T_pedidosID_PRODUTO: TStringField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Size = 3
    end
    object T_pedidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
    object T_pedidosQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
    end
    object T_pedidosVR_UN: TFloatField
      FieldName = 'VR_UN'
      Origin = 'VR_UN'
      Required = True
      currency = True
    end
    object T_pedidosVR_TOTAL: TFloatField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
      Required = True
      currency = True
    end
    object T_pedidosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_usuarios: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_usuarios'
    TableName = 'psi_hotel.t_usuarios'
    Left = 416
    Top = 280
    object T_usuariosFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_usuariosID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 6
    end
    object T_usuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 18
    end
    object T_usuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object T_usuariosHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_usuariosHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
      EditMask = '!90:00:00;1;_'
    end
    object T_usuariosIDC: TIntegerField
      FieldName = 'IDC'
      Origin = 'IDC'
      Required = True
    end
  end
  object T_idc: TFDTable
    Active = True
    AfterPost = TableApplyUpdates
    AfterCancel = TableApplyUpdates
    AfterDelete = TableApplyUpdates
    CachedUpdates = True
    IndexFieldNames = 'ID'
    MasterSource = ds_idcusuarios
    MasterFields = 'FICHA'
    DetailFields = 'FICHA'
    Connection = Connection_1
    UpdateOptions.UpdateTableName = 'psi_hotel.t_idc'
    TableName = 'psi_hotel.t_idc'
    Left = 416
    Top = 328
    object T_idcFICHA: TFDAutoIncField
      FieldName = 'FICHA'
      Origin = 'FICHA'
      ReadOnly = True
    end
    object T_idcID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 6
    end
    object T_idcIDC: TLongWordField
      FieldName = 'IDC'
      Origin = 'IDC'
      Required = True
    end
  end
  object ds_pedidosdiarias: TDataSource
    DataSet = T_diarias
    Left = 480
    Top = 120
  end
  object ds_idcusuarios: TDataSource
    DataSet = T_usuarios
    Left = 480
    Top = 304
  end
  object DriverLink_1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.1\bin\libmysql.dll'
    Left = 184
    Top = 16
  end
  object Connection_1: TFDConnection
    Params.Strings = (
      'Database=psi_hotel'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
end

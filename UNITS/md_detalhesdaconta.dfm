object F_detalhesdaconta: TF_detalhesdaconta
  Left = 20
  Top = 156
  Caption = 'F_detalhesdaconta'
  ClientHeight = 347
  ClientWidth = 867
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 35
    Height = 13
    Caption = 'CONTA'
  end
  object Label3: TLabel
    Left = 160
    Top = 8
    Width = 27
    Height = 13
    Caption = 'APTO'
  end
  object Label4: TLabel
    Left = 192
    Top = 8
    Width = 92
    Height = 13
    Caption = 'TIPO DE LOCA'#199#195'O'
  end
  object Label6: TLabel
    Left = 16
    Top = 96
    Width = 47
    Height = 13
    Caption = 'ENTRADA'
  end
  object Label7: TLabel
    Left = 16
    Top = 144
    Width = 31
    Height = 13
    Caption = 'SA'#205'DA'
  end
  object Label8: TLabel
    Left = 96
    Top = 96
    Width = 48
    Height = 13
    Caption = 'HOR'#193'RIO'
  end
  object Label9: TLabel
    Left = 96
    Top = 144
    Width = 48
    Height = 13
    Caption = 'HOR'#193'RIO'
  end
  object Label10: TLabel
    Left = 160
    Top = 96
    Width = 54
    Height = 13
    Caption = 'RECEP'#199#195'O'
  end
  object Label11: TLabel
    Left = 160
    Top = 144
    Width = 54
    Height = 13
    Caption = 'RECEP'#199#195'O'
  end
  object Label12: TLabel
    Left = 280
    Top = 96
    Width = 46
    Height = 13
    Caption = 'CAIXA N'#186
  end
  object Label13: TLabel
    Left = 280
    Top = 144
    Width = 46
    Height = 13
    Caption = 'CAIXA N'#186
  end
  object Label14: TLabel
    Left = 14
    Top = 224
    Width = 75
    Height = 13
    Caption = 'HORAS DE USO'
  end
  object Label15: TLabel
    Left = 94
    Top = 224
    Width = 107
    Height = 13
    Caption = 'HORAS DE FRANQUIA'
  end
  object Label16: TLabel
    Left = 14
    Top = 272
    Width = 107
    Height = 13
    Caption = 'HORAS EXECEDENTES'
  end
  object Label17: TLabel
    Left = 360
    Top = 8
    Width = 69
    Height = 13
    Caption = 'VR. LOCA'#199#195'O'
  end
  object Label19: TLabel
    Left = 206
    Top = 272
    Width = 121
    Height = 13
    Caption = 'VR. HORAS EXCEDENTES'
  end
  object Label20: TLabel
    Left = 206
    Top = 224
    Width = 95
    Height = 13
    Caption = 'VR. HORAS DE USO'
  end
  object Label21: TLabel
    Left = 358
    Top = 224
    Width = 64
    Height = 13
    Caption = 'VR. PEDIDOS'
  end
  object Label22: TLabel
    Left = 358
    Top = 272
    Width = 58
    Height = 13
    Caption = 'VR. EXTRAS'
  end
  object Label23: TLabel
    Left = 582
    Top = 224
    Width = 79
    Height = 13
    Caption = 'VR. DESCONTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24: TLabel
    Left = 741
    Top = 96
    Width = 116
    Height = 13
    Caption = 'VR. TOTAL DA CONTA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label25: TLabel
    Left = 360
    Top = 96
    Width = 98
    Height = 13
    Caption = 'RECEB. EM CART'#195'O'
  end
  object Label26: TLabel
    Left = 464
    Top = 96
    Width = 106
    Height = 13
    Caption = 'RECEB. EM DINHEIRO'
  end
  object Label27: TLabel
    Left = 584
    Top = 96
    Width = 133
    Height = 13
    Caption = 'T. RECEBIDO (ENTRADA)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label28: TLabel
    Left = 360
    Top = 144
    Width = 98
    Height = 13
    Caption = 'RECEB. EM CART'#195'O'
  end
  object Label29: TLabel
    Left = 464
    Top = 144
    Width = 106
    Height = 13
    Caption = 'RECEB. EM DINHEIRO'
  end
  object Label30: TLabel
    Left = 584
    Top = 144
    Width = 114
    Height = 13
    Caption = 'T.RECEBIDO (SA'#205'DA)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label31: TLabel
    Left = 462
    Top = 224
    Width = 105
    Height = 13
    Caption = 'T. REC. EM CART'#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label32: TLabel
    Left = 462
    Top = 272
    Width = 114
    Height = 13
    Caption = 'T. REC. EM DINHEIRO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label33: TLabel
    Left = 741
    Top = 144
    Width = 94
    Height = 13
    Caption = 'TOTAL RECEBIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label34: TLabel
    Left = 741
    Top = 200
    Width = 59
    Height = 13
    Caption = 'VR. TROCO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label35: TLabel
    Left = 741
    Top = 248
    Width = 104
    Height = 13
    Caption = 'TROCO DEVOLVIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label36: TLabel
    Left = 96
    Top = 8
    Width = 46
    Height = 13
    Caption = 'CAIXA N'#186
  end
  object Label37: TLabel
    Left = 467
    Top = 8
    Width = 80
    Height = 13
    Caption = 'APTO LIBERADO'
  end
  object Label38: TLabel
    Left = 571
    Top = 8
    Width = 135
    Height = 13
    Caption = 'CONTA A-BERTA F-ECHADA'
  end
  object Bevel4: TBevel
    Left = 726
    Top = 80
    Width = 9
    Height = 249
    Shape = bsLeftLine
  end
  object Bevel3: TBevel
    Left = 13
    Top = 195
    Width = 693
    Height = 10
    Shape = bsBottomLine
  end
  object Bevel1: TBevel
    Left = 14
    Top = 64
    Width = 845
    Height = 10
    Shape = bsBottomLine
  end
  object ed_caixa: TDBEdit
    Left = 96
    Top = 24
    Width = 58
    Height = 21
    Color = clBlack
    DataField = 'CAIXA'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object ed_conta: TDBEdit
    Left = 16
    Top = 24
    Width = 59
    Height = 21
    Color = clBlack
    DataField = 'CONTA'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object ed_apto: TDBEdit
    Left = 160
    Top = 24
    Width = 26
    Height = 21
    Color = clBlack
    DataField = 'AP'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object ed_tipo: TDBEdit
    Left = 192
    Top = 24
    Width = 139
    Height = 21
    Color = clBlack
    DataField = 'TIPO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ed_vrlocacao: TDBEdit
    Left = 360
    Top = 24
    Width = 89
    Height = 21
    Color = clBlack
    DataField = 'VR_LOCACAO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object ed_aptoliberado: TDBEdit
    Left = 467
    Top = 24
    Width = 22
    Height = 21
    Color = clBlack
    DataField = 'CHECK_OUT'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object ed_situacao: TDBEdit
    Left = 571
    Top = 24
    Width = 22
    Height = 21
    Color = clBlack
    DataField = 'CHV'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object ed_dtentrada: TDBEdit
    Left = 16
    Top = 112
    Width = 74
    Height = 21
    Color = clWhite
    DataField = 'DT_ENTRADA'
    DataSource = ds_diarias
    MaxLength = 10
    ReadOnly = True
    TabOrder = 7
  end
  object ed_hrentrada: TDBEdit
    Left = 96
    Top = 112
    Width = 58
    Height = 21
    Color = clWhite
    DataField = 'HR_ENTRADA'
    DataSource = ds_diarias
    MaxLength = 8
    ReadOnly = True
    TabOrder = 8
  end
  object ed_recepcaoentrada: TDBEdit
    Left = 160
    Top = 112
    Width = 114
    Height = 21
    Color = clWhite
    DataField = 'RC_ENTRADA'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 9
  end
  object ed_cxentrada: TDBEdit
    Left = 280
    Top = 112
    Width = 51
    Height = 21
    Color = clWhite
    DataField = 'CX_ENTRADA'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 10
  end
  object ed_vrcartaoentrada: TDBEdit
    Left = 360
    Top = 112
    Width = 89
    Height = 21
    Color = clWhite
    DataField = 'RC_CE'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 11
  end
  object ed_vrdinheiroentrada: TDBEdit
    Left = 464
    Top = 112
    Width = 83
    Height = 21
    Color = clWhite
    DataField = 'RC_DE'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 12
  end
  object ed_vrrecebidoentrada: TDBEdit
    Left = 584
    Top = 112
    Width = 89
    Height = 21
    Color = clWhite
    DataField = 'VR_ENTRADA'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
  end
  object ed_dtsaida: TDBEdit
    Left = 16
    Top = 160
    Width = 74
    Height = 21
    Color = clWhite
    DataField = 'DT_SAIDA'
    DataSource = ds_diarias
    MaxLength = 10
    ReadOnly = True
    TabOrder = 14
  end
  object ed_hrsaida: TDBEdit
    Left = 96
    Top = 160
    Width = 58
    Height = 21
    Color = clWhite
    DataField = 'HR_SAIDA'
    DataSource = ds_diarias
    MaxLength = 8
    ReadOnly = True
    TabOrder = 15
  end
  object ed_recepcaosaida: TDBEdit
    Left = 160
    Top = 160
    Width = 114
    Height = 21
    Color = clWhite
    DataField = 'RC_SAIDA'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 16
  end
  object ed_cxsaida: TDBEdit
    Left = 280
    Top = 160
    Width = 51
    Height = 21
    Color = clWhite
    DataField = 'CX_SAIDA'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 17
  end
  object ed_vrcartaosaida: TDBEdit
    Left = 360
    Top = 160
    Width = 89
    Height = 21
    Color = clWhite
    DataField = 'RC_CS'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 18
  end
  object ed_vrdinheirosaida: TDBEdit
    Left = 464
    Top = 160
    Width = 83
    Height = 21
    Color = clWhite
    DataField = 'RC_DS'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 19
  end
  object ed_vrrecebidosaida: TDBEdit
    Left = 586
    Top = 163
    Width = 87
    Height = 21
    Color = clWhite
    DataField = 'VR_SAIDA'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 20
  end
  object ed_horasuso: TDBEdit
    Left = 16
    Top = 240
    Width = 72
    Height = 21
    Color = clWhite
    DataField = 'HR_USO'
    DataSource = ds_diarias
    MaxLength = 8
    ReadOnly = True
    TabOrder = 21
  end
  object ed_horasfranquia: TDBEdit
    Left = 94
    Top = 240
    Width = 60
    Height = 21
    Color = clWhite
    DataField = 'HR_FRANQUIA'
    DataSource = ds_diarias
    MaxLength = 8
    ReadOnly = True
    TabOrder = 22
  end
  object ed_vrhorasuso: TDBEdit
    Left = 207
    Top = 240
    Width = 67
    Height = 21
    Color = clWhite
    DataField = 'VR_HORASUSO'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 23
  end
  object ed_vrpedidos: TDBEdit
    Left = 357
    Top = 243
    Width = 92
    Height = 21
    Color = clWhite
    DataField = 'VR_PEDIDOS'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 27
  end
  object ed_totalreccartao: TDBEdit
    Left = 462
    Top = 240
    Width = 85
    Height = 21
    Color = clWhite
    DataField = 'RC_CARTAO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 29
  end
  object ed_vrdesconto: TDBEdit
    Left = 582
    Top = 240
    Width = 91
    Height = 21
    Color = clWhite
    DataField = 'VR_DESCONTO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 31
  end
  object ed_horasexcedentes: TDBEdit
    Left = 14
    Top = 288
    Width = 59
    Height = 21
    Color = clWhite
    DataField = 'HR_EXCEDENTES'
    DataSource = ds_diarias
    MaxLength = 8
    ReadOnly = True
    TabOrder = 24
  end
  object ed_vrhoraexcedente: TDBEdit
    Left = 94
    Top = 288
    Width = 43
    Height = 21
    Color = clWhite
    DataField = 'VR_HE'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 25
  end
  object ed_vrtotalhoraexcedentes: TDBEdit
    Left = 206
    Top = 288
    Width = 68
    Height = 21
    Color = clWhite
    DataField = 'VR_HORASEXCEDENTES'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 26
  end
  object ed_vrextras: TDBEdit
    Left = 358
    Top = 288
    Width = 91
    Height = 21
    Color = clWhite
    DataField = 'VR_EXTRAS'
    DataSource = ds_diarias
    ReadOnly = True
    TabOrder = 28
  end
  object ed_totalrecdinheiro: TDBEdit
    Left = 462
    Top = 288
    Width = 85
    Height = 21
    Color = clWhite
    DataField = 'RC_DINHEIRO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 30
  end
  object ed_vrtotal: TDBEdit
    Left = 741
    Top = 112
    Width = 84
    Height = 21
    Color = clWhite
    DataField = 'VR_TOTAL'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 32
  end
  object ed_vrtotalrecebido: TDBEdit
    Left = 741
    Top = 160
    Width = 84
    Height = 21
    Color = clWhite
    DataField = 'VR_RECEBIDO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 33
  end
  object ed_vrtroco: TDBEdit
    Left = 741
    Top = 216
    Width = 84
    Height = 21
    Color = clWhite
    DataField = 'VR_TROCO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 34
  end
  object ed_vrtrocodevolvido: TDBEdit
    Left = 741
    Top = 264
    Width = 84
    Height = 21
    Color = clWhite
    DataField = 'DF_TROCO'
    DataSource = ds_diarias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 35
  end
  object bt_fechar: TBitBtn
    Left = 807
    Top = 8
    Width = 52
    Height = 50
    Hint = 'FECHAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C0000D8800000D88000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D08C8C8C4949
      49181818454545FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC7C7C77A7A7A3131311414142E2E2E7979
      796C6C6C313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF6F6F6BDBDBD6E6E6E292929141414373737818181CCCCCCFFFFFFFFFF
      FFA3A3A3343434FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1
      6464642222221515154040408D8D8DD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9C9C9C232323BFBFBFBFBFBFBFBFBFBFBFBFBEBEBEC0C0C0E0E0E0FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE070707
      3F3F3F979797DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFA0A0A00202021D1D1D1C1C1C1C1C1C1C1C1C1E1E1E0D0D0D454545FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC1A1A1A
      EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9B9B9B2B2B2BE4E4E4E3E3E3E3E3E3E3E3E3E5E5E5838383303030FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFAE
      AEAE686868FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFCE
      CECE1414145A5A5AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFD3D3D31616165A5A5AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F292929FFFFFFFF
      FFFFFFFFFFD3D3D31616165A5A5AFDFDFDFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B56A6A6AFFFFFFFF
      FFFFFFFFFFFFFFFFD3D3D31616165A5A5AFDFDFDFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFD5D5D5181818585858FDFDFDFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D91818185E5E5EF6F6F6CECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFB5B5B52E2E2E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
      2D2D2D2D2D2D2D2D2D2D2D2E2E2E3A3A3A1F1F1F000000848484CECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFDCDCDC93939392929292929292929292929292929292
      92929292929292929292929494949B9B9B292929090909B8B8B8CECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF909090111111B5B5B5FFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9D0D0D0FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF818181070707B4B4B4FFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797333333FFFFFFFF
      FFFFFFFFFFFFFFFF818181070707B6B6B6FFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393323232FFFFFFFF
      FFFFFFFFFF818181070707B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFD
      FDFD818181070707B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF9A9A9A313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFA8
      A8A8070707B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFA3A3A3303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFDA
      DADACCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
      E6666666272727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE9B9B9B4C4C4C1919
      19202020878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1D1D1D
      E3E3E3FFFFFFFFFFFFFFFFFFD6D6D68F8F8F434343171717222222606060B1B1
      B1EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595343434FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD202020
      E3E3E3D4D4D49292924747472323233636367A7A7AC9C9C9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D333333FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D30D0D0D
      3333330C0C0C0000000F0F0F595959909090A1A1A1A1A1A19999999494949494
      94949494949494949494949494949494949494969696555555363636FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEB131313
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000005A5A5AFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 36
    OnClick = bt_fecharClick
  end
  object ds_diarias: TDataSource
    DataSet = dm_firedac.T_diarias
    Left = 592
    Top = 272
  end
end

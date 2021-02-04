object F_dadosdaconta: TF_dadosdaconta
  Left = 0
  Top = 0
  Caption = 'F_dadosdaconta'
  ClientHeight = 613
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 50
    Height = 13
    Caption = 'CONTA N'#176
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 96
    Top = 16
    Width = 27
    Height = 13
    Caption = 'APTO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 141
    Top = 16
    Width = 38
    Height = 13
    Caption = 'STATUS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 173
    Top = 32
    Width = 56
    Height = 13
    Caption = 'A - ABERTA'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label20: TLabel
    Left = 173
    Top = 51
    Width = 63
    Height = 13
    Caption = 'F - FECHADA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 17
    Top = 72
    Width = 76
    Height = 13
    Caption = 'TIPO LOCA'#199#195'O'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 18
    Top = 127
    Width = 93
    Height = 13
    Caption = 'DATA DE ENTRADA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 129
    Top = 128
    Width = 95
    Height = 13
    Caption = 'HORA DE ENTRADA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 242
    Top = 128
    Width = 77
    Height = 13
    Caption = 'DATA DE SA'#205'DA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 353
    Top = 125
    Width = 79
    Height = 13
    Caption = 'HORA DE SA'#205'DA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 19
    Top = 184
    Width = 127
    Height = 13
    Caption = 'HORAS USO (OCUPA'#199#195'O)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label25: TLabel
    Left = 242
    Top = 181
    Width = 111
    Height = 13
    Caption = 'TOTAL DE HORAS/USO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 22
    Top = 258
    Width = 44
    Height = 13
    Caption = 'PEDIDOS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object ed_conta: TDBEdit
    Left = 16
    Top = 32
    Width = 74
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'CONTA'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object ed_apto: TDBEdit
    Left = 97
    Top = 32
    Width = 38
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'AP'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object ed_chv: TDBEdit
    Left = 142
    Top = 32
    Width = 25
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'CHV'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object ed_tipo: TDBEdit
    Left = 18
    Top = 88
    Width = 199
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'TIPO'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ed_dtentrada: TDBEdit
    Left = 18
    Top = 144
    Width = 105
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'DT_ENTRADA'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object ed_hrentrada: TDBEdit
    Left = 129
    Top = 144
    Width = 88
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'HR_ENTRADA'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object ed_dtsaida: TDBEdit
    Left = 242
    Top = 144
    Width = 105
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'DT_SAIDA'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object ed_hrsaida: TDBEdit
    Left = 353
    Top = 144
    Width = 91
    Height = 31
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'HR_SAIDA'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object Label_HU: TStaticText
    Left = 19
    Top = 200
    Width = 166
    Height = 52
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '00:00:00'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 8
    Transparent = False
  end
  object ed_totalhorasuso: TDBEdit
    Left = 242
    Top = 200
    Width = 161
    Height = 52
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    DataField = 'HR_USO'
    DataSource = ds_diarias
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object DBGrid1: TDBGrid
    Left = 18
    Top = 280
    Width = 424
    Height = 321
    DataSource = ds_pedidos
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COMANDA'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Width = 291
        Visible = True
      end>
  end
  object bt_fechar: TBitBtn
    Left = 390
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
    TabOrder = 11
    OnClick = bt_fecharClick
  end
  object Timer_HU: TTimer
    OnTimer = Timer_HUTimer
    Left = 328
    Top = 64
  end
  object ds_diarias: TDataSource
    DataSet = dm_firedac.T_diarias
    Left = 264
    Top = 8
  end
  object ds_pedidos: TDataSource
    DataSet = dm_firedac.T_pedidos
    Left = 328
    Top = 8
  end
end

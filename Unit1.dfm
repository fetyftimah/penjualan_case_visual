object FormLogin: TFormLogin
  Left = 375
  Top = 152
  Width = 385
  Height = 424
  AutoSize = True
  Caption = 'FormLogin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 0
    Top = 0
    Width = 369
    Height = 385
    Brush.Color = clMoneyGreen
  end
  object shp2: TShape
    Left = 0
    Top = 0
    Width = 369
    Height = 49
    Align = alTop
    Brush.Color = clTeal
  end
  object shp3: TShape
    Left = 0
    Top = 336
    Width = 369
    Height = 49
    Align = alBottom
    Brush.Color = clTeal
  end
  object lbl1: TLabel
    Left = 8
    Top = 56
    Width = 108
    Height = 23
    Caption = 'Username :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl2: TLabel
    Left = 8
    Top = 144
    Width = 105
    Height = 23
    Caption = 'Password :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Edt1: TEdit
    Left = 24
    Top = 88
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Edt2: TEdit
    Left = 24
    Top = 176
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object b1: TButton
    Left = 208
    Top = 240
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = b1Click
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from tb_user')
    Params = <>
    Left = 256
    Top = 72
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan_case'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\Fety Fatimah\Documents\VISUAL\PenjualanCase\libmysql.dl' +
      'l'
    Left = 256
    Top = 128
  end
end

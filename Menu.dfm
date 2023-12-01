object FormMenu: TFormMenu
  Left = 206
  Top = 210
  Width = 519
  Height = 463
  Caption = 'Form Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = -6
    Top = -2
    Width = 489
    Height = 409
    Brush.Color = clMoneyGreen
  end
  object mm1: TMainMenu
    Left = 32
    Top = 24
    object AKUN1: TMenuItem
      Caption = 'AKUN'
      object USER1: TMenuItem
        Caption = 'USER'
        OnClick = USER1Click
      end
      object SUPPLIER1: TMenuItem
        Caption = 'SUPPLIER'
        OnClick = SUPPLIER1Click
      end
    end
  end
end

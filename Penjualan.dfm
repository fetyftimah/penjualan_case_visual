object FormPenjualan: TFormPenjualan
  Left = 395
  Top = 247
  Width = 789
  Height = 540
  Caption = 'FormPenjualan'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 0
    Top = 1
    Width = 673
    Height = 465
    Brush.Color = clMoneyGreen
  end
  object lbl1: TLabel
    Left = 24
    Top = 32
    Width = 115
    Height = 16
    Caption = 'Tanggal Penjualan :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl2: TLabel
    Left = 24
    Top = 64
    Width = 79
    Height = 16
    Caption = 'Kustomer ID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl4: TLabel
    Left = 24
    Top = 96
    Width = 51
    Height = 16
    Caption = 'User ID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl5: TLabel
    Left = 343
    Top = 31
    Width = 85
    Height = 16
    Caption = 'Jumlah Bayar :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl7: TLabel
    Left = 344
    Top = 63
    Width = 36
    Height = 16
    Caption = 'Laba :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl3: TLabel
    Left = 346
    Top = 96
    Width = 68
    Height = 16
    Caption = 'Kembalian :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl6: TLabel
    Left = 25
    Top = 130
    Width = 38
    Height = 16
    Caption = 'Total :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl8: TLabel
    Left = 25
    Top = 162
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl9: TLabel
    Left = 346
    Top = 130
    Width = 55
    Height = 16
    Caption = 'Tanggal :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Edtjumlah: TEdit
    Left = 451
    Top = 31
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object Edtlaba: TEdit
    Left = 452
    Top = 63
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object bbaru: TButton
    Left = 25
    Top = 200
    Width = 89
    Height = 33
    Caption = 'BARU'
    TabOrder = 2
    OnClick = bbaruClick
  end
  object bsimpan: TButton
    Left = 121
    Top = 200
    Width = 89
    Height = 33
    Caption = 'SIMPAN'
    TabOrder = 3
    OnClick = bsimpanClick
  end
  object bedit: TButton
    Left = 217
    Top = 200
    Width = 89
    Height = 33
    Caption = 'EDIT'
    TabOrder = 4
    OnClick = beditClick
  end
  object bprint: TButton
    Left = 505
    Top = 200
    Width = 89
    Height = 33
    Caption = 'PRINT'
    TabOrder = 5
    OnClick = bprintClick
  end
  object bbatal: TButton
    Left = 409
    Top = 200
    Width = 89
    Height = 33
    Caption = 'BATAL'
    TabOrder = 6
    OnClick = bbatalClick
  end
  object bhapus: TButton
    Left = 313
    Top = 200
    Width = 89
    Height = 33
    Caption = 'HAPUS'
    TabOrder = 7
    OnClick = bhapusClick
  end
  object dbgrd1: TDBGrid
    Left = 25
    Top = 248
    Width = 633
    Height = 201
    DataSource = ds1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tgl_penjualan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kustomer_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jumlah_bayar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'laba'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kembalian'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tanggal'
        Visible = True
      end>
  end
  object Edtkembalian: TEdit
    Left = 454
    Top = 96
    Width = 161
    Height = 21
    TabOrder = 9
  end
  object Edttotal: TEdit
    Left = 174
    Top = 129
    Width = 146
    Height = 21
    TabOrder = 10
  end
  object dtp1: TDateTimePicker
    Left = 173
    Top = 35
    Width = 148
    Height = 21
    Date = 45262.446850370370000000
    Time = 45262.446850370370000000
    TabOrder = 11
  end
  object dtp2: TDateTimePicker
    Left = 453
    Top = 129
    Width = 163
    Height = 21
    Date = 45262.446850370370000000
    Time = 45262.446850370370000000
    TabOrder = 12
  end
  object cbb1: TComboBox
    Left = 174
    Top = 67
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 13
  end
  object cbb2: TComboBox
    Left = 175
    Top = 99
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 14
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
    Left = 704
    Top = 32
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from tbl_penjualan')
    Params = <>
    Left = 704
    Top = 88
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 704
    Top = 144
  end
  object frxrprt1: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45259.958638541700000000
    ReportOptions.LastChange = 45262.449624328710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 200
    Datasets = <
      item
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 389.291590000000000000
          Top = 11.338590000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'LAPORAN DATA PENJUALAN')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 34.015770000000000000
        Top = 86.929190000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'No')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Tanggal Penjualan')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Kustomer ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 340.157700000000000000
          Top = 3.779530000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'User ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 438.425480000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 540.472790000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Jumlah Bayar')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 661.417750000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Laba')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 782.362710000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Kembalian')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 873.071430000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Tanggal')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 34.015770000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 68.031540000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'id'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."id"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 102.047310000000000000
          Width = 109.606370000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'tgl_penjualan'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."tgl_penjualan"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 211.653680000000000000
          Width = 128.504020000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'kustomer_id'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."kustomer_id"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'user_id'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."user_id"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 438.425480000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'total'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."total"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 540.472790000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'jumlah_bayar'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."jumlah_bayar"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 661.417750000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'laba'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."laba"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 782.362710000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'kembalian'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."kembalian"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 873.071430000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."tanggal"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 37.795300000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          Left = 721.890230000000000000
          Top = 7.559060000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAL DATA PENJUALAN :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 899.528140000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdbdtst1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = zqry1
    BCDToCurrency = False
    Left = 712
    Top = 256
  end
  object zqry2: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from tbl_kustomer')
    Params = <>
    Left = 699
    Top = 313
  end
  object zqry3: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from tb_user')
    Params = <>
    Left = 705
    Top = 373
  end
end

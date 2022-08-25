object FrmRelClientes: TFrmRelClientes
  Left = 0
  Top = 0
  BorderWidth = 8
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 440
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    863
    440)
  PixelsPerInch = 96
  TextHeight = 13
  object LblFiltro: TLabel
    Left = 125
    Top = 0
    Width = 24
    Height = 13
    Caption = '&Filtro'
    FocusControl = BEdtFiltro
  end
  object LblResFiltro: TLabel
    Left = 0
    Top = 85
    Width = 88
    Height = 13
    Caption = '&Resultado do filtro'
    FocusControl = DBGrdResFiltro
  end
  object DBGrdResFiltro: TDBGrid
    Left = 0
    Top = 104
    Width = 863
    Height = 336
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DSGen
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BBtnFiltrar: TBitBtn
    Left = 125
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000A449A3A449A3
      A449A3A449A3A449A3A449A3FF8000A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF
      8000A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3FF8000FF8000FF8000A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF
      8000FF8000FF8000A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3FF8000FF8000FF8000FF8000A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF
      8000FF8000FF8000A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3FF8000FF8000FF8000FF8000A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF
      8000FF8000FF8000A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3FF8000FF8000FF8000FF8000A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF8000FF
      8000FF8000FF8000FF8000A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000A449A3A449A3A449A3A449A3A449A3
      FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
      00FF8000A449A3A449A3A449A3FF8000FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000A449A3FF8000FF8000
      FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
      00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000}
    TabOrder = 2
    OnClick = BBtnFiltrarClick
  end
  object BEdtFiltro: TButtonedEdit
    Left = 125
    Top = 17
    Width = 737
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Images = DM.ImgLstMenu
    RightButton.Visible = True
    TabOrder = 1
    OnKeyPress = BEdtFiltroKeyPress
    ExplicitWidth = 747
  end
  object RGrpOrdem: TRadioGroup
    Left = 0
    Top = 0
    Width = 113
    Height = 73
    Caption = 'Ordem'
    ItemIndex = 0
    Items.Strings = (
      '&Nome'
      '&C'#243'digo')
    TabOrder = 0
  end
  object BBrnImpr: TBitBtn
    Left = 206
    Top = 44
    Width = 91
    Height = 25
    Caption = 'Imprimir'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000A449A3A449A3
      A449A3FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00A449A3A449A3A449A3A449A3A449A3A449A3FF9900A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3FF9900A449A3A449A3A449A3A449A3A449A3
      A449A3FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00A449A3A449A3A449A3A449A3A449A3A449A3FF9900A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3FF9900A449A3A449A3A449A3FF9900FF9900
      A449A3FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00A449A3FF9900FF9900FF9900FF9900A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3FF9900FF9900FF9900FF9900
      FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF
      9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
      FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00FF9900FF9900FF9900FF9900FF9900A449A3A449A3FF9900FF9900FF9900FF
      9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
      FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00FF9900FF9900FF9900A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00A449A3A449A3A449A3A449A3A449A3A449A3FF9900FF9900FF9900FF9900FF
      9900FF9900FF9900FF9900FF9900FF9900A449A3A449A3A449A3A449A3A449A3
      A449A3FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
      00A449A3A449A3A449A3A449A3A449A3A449A3FF9900FF9900FF9900FF9900FF
      9900FF9900FF9900FF9900FF9900FF9900A449A3A449A3A449A3}
    TabOrder = 3
    OnClick = BBrnImprClick
  end
  object frxReport: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44795.214411284700000000
    ReportOptions.LastChange = 44795.214411284700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReportBeforePrint
    Left = 24
    Top = 128
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle: TfrxReportTitle
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object MemoTit: TfrxMemoView
          Align = baCenter
          Left = 230.551330000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE CLIENTES')
          ParentFont = False
        end
        object MemoDtPg: TfrxMemoView
          Align = baRight
          Left = 498.897960000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<Date>] P'#225'gina [<Page#>] de [<TotalPages#>]')
          ParentFont = False
        end
      end
      object PageHeader: TfrxPageHeader
        Height = 43.086614173228300000
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        object MemoTitId: TfrxMemoView
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object MemoTitNome: TfrxMemoView
          Left = 60.472480000000000000
          Width = 411.968503940000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object MemoTitCPF: TfrxMemoView
          Left = 478.866141730000000000
          Width = 117.165354330000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
        object MemoTitRG: TfrxMemoView
          Left = 600.945270000000000000
          Width = 117.165354330000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'RG')
          ParentFont = False
        end
        object MemoTitPai: TfrxMemoView
          Top = 15.118120000000000000
          Width = 355.275820000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nome do pai')
          ParentFont = False
        end
        object MemoTitMae: TfrxMemoView
          Left = 362.834880000000000000
          Top = 15.118120000000000000
          Width = 355.275820000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nome da m'#227'e')
          ParentFont = False
        end
        object MemoTitEnd: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
      end
      object MasterData: TfrxMasterData
        Height = 15.496062990000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object MemoEnd: TfrxMemoView
          Width = 351.496290000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."ENDERECO"] [frxDBDataset."NUM"]')
          ParentFont = False
        end
        object MemoCid: TfrxMemoView
          Left = 355.275820000000000000
          Width = 275.905690000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."CIDADE"] [frxDBDataset."ESTADO"]')
          ParentFont = False
        end
        object MemoCEP: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'CEP [frxDBDataset."CEP"]')
          ParentFont = False
        end
      end
      object GroupHeader: TfrxGroupHeader
        Height = 34.393700790000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset."ID"'
        object MemoCPF: TfrxMemoView
          Left = 479.000310000000000000
          Top = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CPF'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."CPF"]')
          ParentFont = False
        end
        object MemoRG: TfrxMemoView
          Left = 600.945270000000000000
          Top = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'RG'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."RG"]')
          ParentFont = False
        end
        object MemoPai: TfrxMemoView
          Top = 18.897650000000000000
          Width = 355.275820000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'NOMEPAI'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."NOMEPAI"]')
          ParentFont = False
        end
        object MemoMae: TfrxMemoView
          Left = 362.834880000000000000
          Top = 18.897650000000000000
          Width = 355.275820000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'NOMEMAE'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."NOMEMAE"]')
          ParentFont = False
        end
        object MemoId: TfrxMemoView
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."ID"]')
          ParentFont = False
        end
        object MemoNome: TfrxMemoView
          Left = 60.472480000000000000
          Top = 3.779530000000000000
          Width = 411.968770000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'NOME'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."NOME"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 3.779530000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'CPF=CPF'
      'RG=RG'
      'NOMEMAE=NOMEMAE'
      'NOMEPAI=NOMEPAI'
      'CLIENTEID=CLIENTEID'
      'CEP=CEP'
      'ENDERECO=ENDERECO'
      'NUM=NUM'
      'CIDADE=CIDADE'
      'ESTADO=ESTADO')
    DataSet = DM.ADOQGen
    BCDToCurrency = False
    Left = 88
    Top = 128
  end
end

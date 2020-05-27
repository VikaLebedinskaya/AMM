object Frm: TFrm
  Left = 285
  Top = 205
  Width = 1102
  Height = 562
  Caption = 'FormMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object txtTitle: TLabel
    Left = 728
    Top = 136
    Width = 93
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
  end
  object txtDirector: TLabel
    Left = 728
    Top = 176
    Width = 51
    Height = 13
    Caption = #1056#1077#1078#1080#1089#1089#1105#1088
  end
  object txtActor: TLabel
    Left = 728
    Top = 216
    Width = 38
    Height = 13
    Caption = #1040#1082#1090#1077#1088#1099
  end
  object txtSummary: TLabel
    Left = 728
    Top = 280
    Width = 107
    Height = 13
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
  end
  object Download: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 0
    OnClick = DownloadClick
  end
  object Grid: TStringGrid
    Left = 8
    Top = 56
    Width = 681
    Height = 433
    BiDiMode = bdLeftToRight
    DefaultColWidth = 150
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      60
      116
      114
      144
      229)
  end
  object BtnSave: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object q: TEdit
    Left = 704
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BtnSearch: TButton
    Left = 840
    Top = 24
    Width = 89
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
    TabOrder = 4
    OnClick = BtnSearchClick
  end
  object BtnDelete: TButton
    Left = 936
    Top = 24
    Width = 97
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 5
    OnClick = BtnDeleteClick
  end
  object BtnNew: TButton
    Left = 168
    Top = 16
    Width = 89
    Height = 25
    Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
    TabOrder = 6
    OnClick = BtnNewClick
  end
  object EditTitle: TEdit
    Left = 872
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object EditDirector: TEdit
    Left = 872
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object EditActor: TEdit
    Left = 872
    Top = 216
    Width = 201
    Height = 21
    TabOrder = 9
  end
  object EditSummary: TEdit
    Left = 872
    Top = 280
    Width = 201
    Height = 21
    TabOrder = 10
  end
  object BtnAdd: TButton
    Left = 960
    Top = 400
    Width = 107
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 11
    OnClick = BtnAddClick
  end
  object OpenDialog: TOpenDialog
    Left = 328
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 296
    Top = 16
  end
end

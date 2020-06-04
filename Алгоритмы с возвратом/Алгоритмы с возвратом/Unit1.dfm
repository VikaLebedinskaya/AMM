object Form1: TForm1
  Left = 189
  Top = 146
  Width = 882
  Height = 523
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTownA: TLabel
    Left = 424
    Top = 72
    Width = 163
    Height = 23
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1075#1086#1088#1086#1076' '#1040
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblTownB: TLabel
    Left = 424
    Top = 120
    Width = 163
    Height = 23
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1075#1086#1088#1086#1076' B'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 8
    Top = 64
    Width = 345
    Height = 345
    ColCount = 11
    DefaultColWidth = 30
    DefaultRowHeight = 30
    RowCount = 11
    TabOrder = 0
  end
  object edtRoads: TEdit
    Left = 8
    Top = 16
    Width = 225
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1044#1086#1088#1086#1075#1080' '#1084#1077#1078#1076#1091' '#1075#1086#1088#1086#1076#1072#1084#1080
  end
  object btnCreateRoads: TButton
    Left = 256
    Top = 16
    Width = 193
    Height = 33
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1088#1086#1075#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCreateRoadsClick
  end
  object btnNewRoad: TButton
    Left = 416
    Top = 160
    Width = 193
    Height = 33
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1087#1091#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnNewRoadClick
  end
  object mmoRoads: TMemo
    Left = 400
    Top = 208
    Width = 417
    Height = 201
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      #1042#1089#1077' '#1074#1086#1079#1084#1086#1078#1085#1099#1077' '#1087#1091#1090#1080' '#1084#1077#1078#1076#1091' '#1087#1091#1085#1082#1090#1072#1084#1080' '#1040' '#1080' B '#1084#1077#1085#1100#1096#1077' '
      '100'#1082#1084' :')
    ParentFont = False
    TabOrder = 4
  end
  object btnClear: TButton
    Left = 664
    Top = 160
    Width = 137
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnClearClick
  end
  object edtTownA: TEdit
    Left = 632
    Top = 64
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtTownB: TEdit
    Left = 632
    Top = 112
    Width = 153
    Height = 21
    TabOrder = 7
  end
end

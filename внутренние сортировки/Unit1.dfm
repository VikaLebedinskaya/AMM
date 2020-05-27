object Form1: TForm1
  Left = 202
  Top = 32
  Width = 870
  Height = 563
  BorderIcons = [biSystemMenu]
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
  object Label1: TLabel
    Left = 528
    Top = 56
    Width = 295
    Height = 22
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081', '#1085#1077' '#1073#1086#1083#1100#1096#1077' 100'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 16
    Top = 88
    Width = 8
    Height = 35
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 48
    Top = 16
    Width = 191
    Height = 22
    Caption = #1080#1089#1093#1086#1076#1085#1099#1081' '#1084#1072#1089#1089#1080#1074' '#1079#1072#1087#1080#1089#1077#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 304
    Top = 16
    Width = 245
    Height = 22
    Caption = #1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1072#1081' '#1084#1072#1089#1089#1080#1074' '#1079#1072#1087#1080#1089#1077#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object edtRecCount: TEdit
    Left = 608
    Top = 96
    Width = 121
    Height = 43
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object mmoRecStart: TMemo
    Left = 64
    Top = 48
    Width = 161
    Height = 457
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 1
  end
  object mmoRecRes: TMemo
    Left = 336
    Top = 48
    Width = 161
    Height = 457
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnSort: TButton
    Left = 608
    Top = 264
    Width = 113
    Height = 57
    Caption = 'Sort'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnSortClick
  end
  object btnClear: TButton
    Left = 608
    Top = 360
    Width = 113
    Height = 57
    Caption = 'Clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnClearClick
  end
  object btnCreate: TButton
    Left = 592
    Top = 192
    Width = 153
    Height = 41
    Caption = 'CreateMas'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnCreateClick
  end
end

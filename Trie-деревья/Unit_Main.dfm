object MainForm: TMainForm
  Left = 526
  Top = 137
  Width = 395
  Height = 247
  BorderIcons = [biSystemMenu]
  Caption = 'Trie-'#1076#1077#1088#1077#1074#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memo_current: TMemo
    Left = 0
    Top = 0
    Width = 379
    Height = 188
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 184
    Top = 80
    object Menu: TMenuItem
      Caption = #1060#1072#1081#1083
      object NNew: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = NNewClick
      end
      object NOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = NOpenClick
      end
      object NSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = NSaveClick
      end
      object NSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = NSaveAsClick
      end
      object NClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = NCloseClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object NExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = NExitClick
      end
    end
    object N1: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object NAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = NAddClick
      end
      object NDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = NDeleteClick
      end
      object NClear: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = NClearClick
      end
    end
    object L1: TMenuItem
      Caption = #1044#1077#1088#1077#1074#1086
      object NSearch: TMenuItem
        Caption = #1053#1072#1081#1090#1080
        OnClick = NSearchClick
      end
      object NCount: TMenuItem
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
        OnClick = NCountClick
      end
    end
  end
  object dlgOpen: TOpenDialog
    Filter = #1090#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' *.txt|*.txt'
    Left = 120
    Top = 80
  end
  object dlgSave: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' *.txt|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 240
    Top = 88
  end
end

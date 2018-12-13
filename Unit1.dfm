object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077' '#1092#1091#1085#1082#1094#1080#1080
  ClientHeight = 641
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 143
    Width = 117
    Height = 38
    Alignment = taRightJustify
    Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 603
    Top = 613
    Width = 198
    Height = 19
    Alignment = taRightJustify
    Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1088#1086#1076#1086#1083#1078#1072#1077#1090#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 129
    Caption = #1040#1088#1075#1091#1084#1077#1085#1090#1099' '#1092#1091#1085#1082#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 35
      Width = 121
      Height = 19
      Caption = #1053#1080#1078#1085#1103#1103' '#1075#1088#1072#1085#1080#1094#1072
    end
    object Label2: TLabel
      Left = 15
      Top = 80
      Width = 123
      Height = 19
      Caption = #1042#1077#1088#1093#1085#1103#1103' '#1075#1088#1072#1085#1080#1094#1072
    end
    object Edit1: TEdit
      Left = 152
      Top = 32
      Width = 49
      Height = 27
      Alignment = taCenter
      TabOrder = 0
      Text = '1'
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 152
      Top = 81
      Width = 49
      Height = 27
      Alignment = taCenter
      TabOrder = 1
      Text = '10'
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 240
    Top = 8
    Width = 217
    Height = 129
    Caption = #1052#1077#1090#1086#1076' '#1080#1085#1090#1077#1075#1088#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1052#1077#1090#1086#1076' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082#1086#1074
      #1052#1077#1090#1086#1076' '#1090#1088#1072#1087#1077#1094#1080#1081
      #1060#1086#1088#1084#1091#1083#1072' '#1057#1080#1084#1087#1089#1086#1085#1072)
    ParentFont = False
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 472
    Top = 272
    Width = 329
    Height = 335
    ColCount = 3
    DefaultColWidth = 102
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    TabOrder = 2
    RowHeights = (
      24
      24)
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 208
    Width = 449
    Height = 417
    Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 15
      Top = 24
      Width = 102
      Height = 19
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' I = '
    end
    object Label5: TLabel
      Left = 15
      Top = 74
      Width = 168
      Height = 19
      Caption = #1063#1080#1089#1083#1086' '#1080#1090#1077#1088#1072#1094#1080#1081' (N) = '
    end
    object Label6: TLabel
      Left = 15
      Top = 49
      Width = 106
      Height = 19
      Caption = #1040#1088#1075#1091#1084#1077#1085#1090' X = '
    end
    object Label8: TLabel
      Left = 15
      Top = 99
      Width = 167
      Height = 19
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1096#1072#1075#1072' (Dx) = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 15
      Top = 124
      Width = 258
      Height = 19
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1087#1088#1080' Dx>0 = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 15
      Top = 149
      Width = 377
      Height = 23
      AutoSize = False
      Caption = #1050#1086#1088#1077#1085#1100' '#1092#1091#1085#1082#1094#1080#1080' = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object GroupBox3: TGroupBox
      Left = 15
      Top = 178
      Width = 419
      Height = 217
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1101#1082#1089#1090#1088#1077#1084#1091#1084#1086#1074
      TabOrder = 0
      object Label15: TLabel
        Left = 15
        Top = 84
        Width = 210
        Height = 16
        Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' Y (MinX) = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 15
        Top = 65
        Width = 211
        Height = 16
        Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' X (MinT) = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 15
        Top = 46
        Width = 218
        Height = 16
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' Y (MaxX) = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 15
        Top = 27
        Width = 219
        Height = 16
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' X (MaxT) = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 15
        Top = 106
        Width = 386
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = #1069#1082#1089#1090#1088#1077#1084#1091#1084' '#1092#1091#1085#1082#1094#1080#1080', '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1081' '#1084#1077#1090#1086#1076#1086#1084' '#1079#1086#1083#1086#1090#1086#1075#1086' '#1089#1077#1095#1077#1085#1080#1103' =    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object Panel1: TPanel
        Left = 15
        Top = 144
        Width = 386
        Height = 57
        TabOrder = 0
        object Label9: TLabel
          Left = 0
          Top = 8
          Width = 385
          Height = 57
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1072' '#1089#1090#1091#1076#1077#1085#1090#1086#1084' '#1075#1088'. '#1055#1048#1073'-152 '#1052#1080#1085#1083#1080#1075#1072#1088#1077#1077#1074#1099#1084' '#1052#1072#1082#1089#1080#1084#1086#1084 +
            ' '#1040#1083#1077#1082#1089#1072#1085#1076#1088#1086#1074#1080#1095#1077#1084
          WordWrap = True
        end
      end
    end
  end
  object Edit3: TEdit
    Left = 131
    Top = 145
    Width = 94
    Height = 37
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '1e-3'
    OnChange = Edit3Change
    OnKeyPress = Edit3KeyPress
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 166
    Width = 217
    Height = 17
    Caption = #1054#1090#1088#1080#1089#1086#1074#1099#1074#1072#1090#1100' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 240
    Top = 143
    Width = 217
    Height = 17
    Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1081' '#1096#1072#1075' '#1080#1085#1090#1077#1075#1088#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Chart1: TChart
    Left = 472
    Top = 16
    Width = 329
    Height = 250
    Legend.Visible = False
    Title.Text.Strings = (
      #1043#1088#1072#1092#1080#1082' '#1092#1091#1085#1082#1094#1080#1080':   -sqr(T)+(8*T)-12')
    View3D = False
    Color = clWhite
    TabOrder = 7
    OnClick = Chart1Click
    OnMouseLeave = Chart1MouseLeave
    OnMouseMove = Chart1MouseMove
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      23
      15
      23)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      SeriesColor = clBlue
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
      Pointer.Style = psCircle
      Pointer.VertSize = 2
      Pointer.Visible = True
      TreatNulls = tnIgnore
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 224
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076' '#1092#1091#1085#1082#1094#1080#1077#1081
      object N2: TMenuItem
        Caption = '&'#1048#1085#1090#1077#1075#1088#1080#1088#1086#1074#1072#1085#1080#1077
        ShortCut = 16496
        OnClick = Button1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = '&'#1058#1072#1073#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077
        object N3: TMenuItem
          Caption = '&'#1047#1072#1087#1091#1089#1090#1080#1090#1100
          ShortCut = 16497
          OnClick = N3Click
        end
        object N4: TMenuItem
          Caption = '&'#1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
          ShortCut = 16474
          OnClick = N4Click
        end
        object N8: TMenuItem
          Caption = '&'#1059#1084#1077#1085#1100#1096#1072#1090#1100' '#1096#1072#1075
          ShortCut = 16461
          OnClick = N8Click
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Caption = '&'#1069#1082#1089#1090#1088#1077#1084#1091#1084#1099
        object N12: TMenuItem
          Caption = '&'#1057#1091#1078#1077#1085#1080#1077' '#1080#1085#1090#1077#1088#1074#1072#1083#1072
          Enabled = False
          Hint = #1059#1073#1077#1076#1080#1090#1077#1089#1100', '#1095#1090#1086' '#1090#1072#1073#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1078#1077' '#1074#1099#1087#1086#1083#1085#1103#1083#1086#1089#1100
          OnClick = N12Click
        end
        object N13: TMenuItem
          Caption = '&'#1047#1086#1083#1086#1090#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
          Enabled = False
          Hint = #1059#1073#1077#1076#1080#1090#1077#1089#1100', '#1095#1090#1086' '#1090#1072#1073#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1078#1077' '#1074#1099#1087#1086#1083#1085#1103#1083#1086#1089#1100
          OnClick = N13Click
        end
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object N15: TMenuItem
        Caption = '&'#1055#1086#1080#1089#1082' '#1082#1086#1088#1085#1077#1081
        object N16: TMenuItem
          Caption = '&'#1052#1077#1090#1086#1076' '#1076#1080#1093#1086#1090#1086#1084#1080#1080
          OnClick = N16Click
        end
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = '&'#1042#1099#1093#1086#1076
        ShortCut = 16465
        OnClick = N7Click
      end
    end
  end
end

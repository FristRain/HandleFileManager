inherited FrmDBLR: TFrmDBLR
  Left = 75
  Top = 80
  ActiveControl = FrmeBRJBXX.EdtZYH
  BorderIcons = []
  Caption = #25285#20445#24405#20837
  ClientHeight = 553
  ClientWidth = 911
  Font.Height = -14
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 917
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 14
  inherited _BevelTop: TBevel
    Width = 911
    ExplicitWidth = 742
  end
  inherited _PanelHeader: TPanel
    Width = 911
    ExplicitWidth = 911
    inherited TitleLabel: TAALabel
      Width = 859
      Caption = #20303#38498#30149#20154#25285#20445
      Font.Height = -27
      ExplicitLeft = 204
      ExplicitTop = 32
      ExplicitWidth = 859
    end
    inherited _colorband: TPanel
      Width = 911
      TabOrder = 1
      ExplicitWidth = 911
    end
    inherited _Panel1: TPanel
      TabOrder = 0
    end
  end
  inherited pub_toolbar_title: TAdvPanel
    Top = 524
    Width = 911
    Height = 29
    TabOrder = 4
    ExplicitTop = 524
    ExplicitWidth = 911
    ExplicitHeight = 29
    FullHeight = 0
    inherited btnexit: TAdvGlowButton
      Left = 828
      Height = 23
      TabOrder = 1
      Visible = False
      ExplicitLeft = 828
      ExplicitHeight = 23
    end
    inherited Shader1: TShader
      Left = 813
      Height = 21
      TabOrder = 3
      ExplicitLeft = 813
      ExplicitHeight = 21
    end
    object CmdCancel: TAdvGlowButton
      AlignWithMargins = True
      Left = 646
      Top = 2
      Width = 79
      Height = 23
      Margins.Top = 1
      Align = alRight
      AutoSize = True
      Caption = #25918#24323'(&C)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = [fsBold]
      ImageIndex = 32
      Images = DmSys.toolbar_ImageList_Globle
      FocusType = ftNone
      ParentFont = False
      Rounded = False
      WordWrap = False
      TabOrder = 0
      TabStop = True
      OnClick = CmdCancelClick
      AllowAllUp = True
      Appearance.BorderColor = 13869954
      Appearance.BorderColorHot = 6151167
      Appearance.BorderColorDown = 13869954
      Appearance.BorderColorChecked = 13869954
      Appearance.BorderColorDisabled = 13869954
      Appearance.Color = 16572619
      Appearance.ColorChecked = clNone
      Appearance.ColorCheckedTo = clNone
      Appearance.ColorDisabled = clNone
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = clNone
      Appearance.ColorDownTo = clNone
      Appearance.ColorHot = 6151167
      Appearance.ColorHotTo = clWhite
      Appearance.ColorMirror = clNone
      Appearance.ColorMirrorTo = clNone
      Appearance.ColorMirrorHot = clNone
      Appearance.ColorMirrorHotTo = clNone
      Appearance.ColorMirrorDown = clNone
      Appearance.ColorMirrorDownTo = clNone
      Appearance.ColorMirrorChecked = clNone
      Appearance.ColorMirrorCheckedTo = clNone
      Appearance.ColorMirrorDisabled = clNone
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.GradientDisabled = ggVertical
      Appearance.GradientMirrorDisabled = ggVertical
      ExplicitLeft = 561
    end
    object CmdSave: TAdvGlowButton
      AlignWithMargins = True
      Left = 561
      Top = 2
      Width = 79
      Height = 23
      Margins.Top = 1
      Align = alRight
      AutoSize = True
      Caption = #23384#30424'(&S)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = [fsBold]
      ImageIndex = 32
      Images = DmSys.toolbar_ImageList_Globle
      FocusType = ftNone
      ParentFont = False
      Rounded = False
      WordWrap = False
      TabOrder = 2
      TabStop = True
      OnClick = CmdSaveClick
      AllowAllUp = True
      Appearance.BorderColor = 13869954
      Appearance.BorderColorHot = 6151167
      Appearance.BorderColorDown = 13869954
      Appearance.BorderColorChecked = 13869954
      Appearance.BorderColorDisabled = 13869954
      Appearance.Color = 16572619
      Appearance.ColorChecked = clNone
      Appearance.ColorCheckedTo = clNone
      Appearance.ColorDisabled = clNone
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = clNone
      Appearance.ColorDownTo = clNone
      Appearance.ColorHot = 6151167
      Appearance.ColorHotTo = clWhite
      Appearance.ColorMirror = clNone
      Appearance.ColorMirrorTo = clNone
      Appearance.ColorMirrorHot = clNone
      Appearance.ColorMirrorHotTo = clNone
      Appearance.ColorMirrorDown = clNone
      Appearance.ColorMirrorDownTo = clNone
      Appearance.ColorMirrorChecked = clNone
      Appearance.ColorMirrorCheckedTo = clNone
      Appearance.ColorMirrorDisabled = clNone
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.GradientDisabled = ggVertical
      Appearance.GradientMirrorDisabled = ggVertical
      ExplicitLeft = 476
    end
    object CmdZF: TAdvGlowButton
      AlignWithMargins = True
      Left = 731
      Top = 2
      Width = 79
      Height = 23
      Margins.Top = 1
      Align = alRight
      AutoSize = True
      Caption = #20316#24223'(&F)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = [fsBold]
      ImageIndex = 32
      Images = DmSys.toolbar_ImageList_Globle
      FocusType = ftNone
      ParentFont = False
      Rounded = False
      WordWrap = False
      TabOrder = 4
      TabStop = True
      OnClick = CmdZFClick
      AllowAllUp = True
      Appearance.BorderColor = 13869954
      Appearance.BorderColorHot = 6151167
      Appearance.BorderColorDown = 13869954
      Appearance.BorderColorChecked = 13869954
      Appearance.BorderColorDisabled = 13869954
      Appearance.Color = 16572619
      Appearance.ColorChecked = clNone
      Appearance.ColorCheckedTo = clNone
      Appearance.ColorDisabled = clNone
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = clNone
      Appearance.ColorDownTo = clNone
      Appearance.ColorHot = 6151167
      Appearance.ColorHotTo = clWhite
      Appearance.ColorMirror = clNone
      Appearance.ColorMirrorTo = clNone
      Appearance.ColorMirrorHot = clNone
      Appearance.ColorMirrorHotTo = clNone
      Appearance.ColorMirrorDown = clNone
      Appearance.ColorMirrorDownTo = clNone
      Appearance.ColorMirrorChecked = clNone
      Appearance.ColorMirrorCheckedTo = clNone
      Appearance.ColorMirrorDisabled = clNone
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.GradientDisabled = ggVertical
      Appearance.GradientMirrorDisabled = ggVertical
      ExplicitLeft = 646
    end
  end
  inline FrmeBRJBXX: TFrmebyjbxx
    Left = 0
    Top = 51
    Width = 911
    Height = 166
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
    ExplicitTop = 51
    ExplicitWidth = 911
    ExplicitHeight = 166
    inherited Panel2: TAdvPanel
      Width = 911
      Height = 166
      ExplicitWidth = 911
      ExplicitHeight = 166
      FullHeight = 121
      inherited RzLabel3: TRzLabel
        Font.Color = clBlue
      end
      inherited Label4: TRzLabel
        Font.Color = clBlue
      end
      inherited Label14: TRzLabel
        Font.Color = clBlue
      end
      inherited Label19: TRzLabel
        Font.Color = clBlue
      end
      inherited Label3: TRzLabel
        Font.Color = clBlue
      end
      inherited EdtZYH: TRzEdit
        Height = 21
        OnChange = FrmeBRJBXXEdtZYHChange
        ExplicitHeight = 21
      end
      inherited EdtXM: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtXB: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtNL: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtCW: TRzEdit
        Height = 21
        TabOrder = 13
        ExplicitHeight = 21
      end
      inherited EdtKS: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtSFZL: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtRYSJ: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtZYTS: TRzEdit
        Height = 21
        TabOrder = 14
        ExplicitHeight = 21
      end
      inherited EdtDBR: TRzEdit
        Height = 21
        TabOrder = 15
        ExplicitHeight = 21
      end
      inherited EdtBQ: TRzEdit
        Left = 76
        Height = 21
        ExplicitLeft = 76
        ExplicitHeight = 21
      end
      inherited EdtJFFS: TRzEdit
        Height = 21
        TabOrder = 26
        ExplicitHeight = 21
      end
      inherited EdtYLH: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtBXH: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtDBJE: TRzNumericEdit
        Height = 21
        TabOrder = 25
        ExplicitHeight = 21
      end
      inherited EdtZTJZCS: TRzEdit
        Height = 21
        TabOrder = 23
        ExplicitHeight = 21
      end
      inherited EdtYJJ: TRzNumericEdit
        Height = 21
        TabOrder = 20
        ExplicitHeight = 21
      end
      inherited EdtYSHJ: TRzNumericEdit
        Height = 21
        TabOrder = 21
        ExplicitHeight = 21
      end
      inherited EdtZHYE: TRzNumericEdit
        Height = 21
        TabOrder = 24
        ExplicitHeight = 21
      end
      inherited EdtSSHJ: TRzNumericEdit
        Height = 21
        TabOrder = 22
        ExplicitHeight = 21
      end
      inherited EdtGZDW: TRzEdit
        Height = 21
        TabOrder = 18
        ExplicitHeight = 21
      end
      inherited EdtZYBQ: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtYLHYE: TRzNumericEdit
        Height = 21
        TabOrder = 16
        ExplicitHeight = 21
      end
      inherited EDTRYBZ: TRzEdit
        Height = 21
        TabOrder = 17
        ExplicitHeight = 21
      end
      inherited EdtZYYS: TRzEdit
        Height = 21
        TabOrder = 19
        ExplicitHeight = 21
      end
      inherited EdtYJZS: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited edtSFZH: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtZDXX: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtSJSTF: TRzNumericEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtYXYJ: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtNYLH: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited EdtECBX: TRzEdit
        Left = 76
        Height = 21
        ExplicitLeft = 76
        ExplicitHeight = 21
      end
      inherited EdtLXDH: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
      inherited edtZGQK: TRzEdit
        Height = 21
        ExplicitHeight = 21
      end
    end
    inherited EdtPopBQ: TADOEditPopBox
      Top = 8
    end
    inherited EdtPopZYH: TADOEditPopBox
      OnChecked = FrmeBRJBXXEdtPopZYHChecked
      OnPressEnter = FrmeBRJBXXEdtPopZYHPressEnter
    end
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 217
    Width = 911
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clSkyBlue
    Caption.ColorTo = clSkyBlue
    Caption.Font.Charset = GB2312_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -12
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = clWhite
    ColorMirror = clWhite
    ColorMirrorTo = clWhite
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16765615
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = GB2312_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -12
    StatusBar.Font.Name = #26032#23435#20307
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Styler = DmSys.AdvPanelStyler_Globle
    FullHeight = 0
    object Label200: TLabel
      Left = 185
      Top = 10
      Width = 68
      Height = 15
      Caption = #25285#20445#37329#39069':'
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LblYlkye: TLabel
      Left = 363
      Top = 10
      Width = 68
      Height = 15
      Caption = #25285#20445#26102#38388':'
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LblSjh: TLabel
      Left = 8
      Top = 10
      Width = 69
      Height = 15
      Caption = #25285' '#20445' '#20154':'
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblzph: TLabel
      Left = 8
      Top = 44
      Width = 68
      Height = 15
      Caption = #25285#20445#35828#26126':'
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object EdtDBR: TRzEdit
      Left = 76
      Top = 6
      Width = 100
      Height = 23
      Ctl3D = True
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      FrameController = DmSys.RzFrameController_Globe
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object EdtDBSM: TRzEdit
      Left = 73
      Top = 41
      Width = 696
      Height = 23
      Ctl3D = True
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      FrameController = DmSys.RzFrameController_Globe
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      OnKeyPress = EdtDBSMKeyPress
    end
    object EdtDBSJ: TRzDateTimePicker
      Left = 431
      Top = 6
      Width = 103
      Height = 23
      Date = 36213.966014814800000000
      Time = 36213.966014814800000000
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParseInput = True
      ParentFont = False
      TabOrder = 2
      OnChange = EdtDBSJChange
      OnKeyPress = EdtDBSJKeyPress
      FrameController = DmSys.RzFrameController_Globe
      FramingPreference = fpCustomFraming
    end
    object EdtDBJE: TRzNumericEdit
      Left = 257
      Top = 6
      Width = 100
      Height = 21
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      ParentCtl3D = False
      ParentFont = False
      ReadOnlyColor = clWindow
      TabOrder = 1
      IntegersOnly = False
      DisplayFormat = '0.00;-0.00'
    end
    object EdtDBSJ1: TRzDateTimePicker
      Left = 534
      Top = 6
      Width = 89
      Height = 23
      Date = 36213.000000000000000000
      Time = 36213.000000000000000000
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      Kind = dtkTime
      ParentFont = False
      TabOrder = 3
      OnKeyPress = EdtDBSJKeyPress
      FrameController = DmSys.RzFrameController_Globe
      FramingPreference = fpCustomFraming
    end
    object EdtDBYXQ: TRzDateTimePicker
      Left = 707
      Top = 6
      Width = 102
      Height = 23
      Date = 36213.966014814800000000
      Time = 36213.966014814800000000
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentFont = False
      TabOrder = 4
      OnChange = EdtDBYXQChange
      OnKeyPress = EdtDBSJKeyPress
      FrameController = DmSys.RzFrameController_Globe
      FramingPreference = fpCustomFraming
    end
    object EdtDBYXQ1: TRzDateTimePicker
      Left = 806
      Top = 6
      Width = 80
      Height = 23
      Date = 36213.000000000000000000
      Time = 36213.000000000000000000
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      Kind = dtkTime
      ParentFont = False
      TabOrder = 5
      OnKeyPress = EdtDBSJKeyPress
      FrameController = DmSys.RzFrameController_Globe
      FramingPreference = fpCustomFraming
    end
    object CB1: TRzCheckBox
      Left = 628
      Top = 10
      Width = 73
      Height = 17
      Caption = #26377#25928#26399':'
      DisabledColor = 15525603
      FillColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      FrameController = DmSys.RzFrameController_Globe
      HotTrack = True
      HotTrackColor = clMaroon
      HotTrackStyle = htsFrame
      ParentFont = False
      ReadOnlyColor = 16775154
      State = cbUnchecked
      TabOrder = 6
      OnClick = CB1Click
    end
    object CBZZBDB: TRzCheckBox
      Left = 796
      Top = 44
      Width = 96
      Height = 17
      Caption = #24635#20540#29677#25285#20445
      DisabledColor = 15525603
      FillColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      FrameController = DmSys.RzFrameController_Globe
      HotTrack = True
      HotTrackColor = clMaroon
      HotTrackStyle = htsFrame
      ParentFont = False
      ReadOnlyColor = 16775154
      State = cbUnchecked
      TabOrder = 8
      Visible = False
      OnClick = CBZZBDBClick
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 287
    Width = 911
    Height = 237
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clSkyBlue
    Caption.ColorTo = clSkyBlue
    Caption.Font.Charset = GB2312_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -12
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = clWhite
    ColorMirror = clWhite
    ColorMirrorTo = clWhite
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16765615
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = GB2312_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -12
    StatusBar.Font.Name = #26032#23435#20307
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Styler = DmSys.AdvPanelStyler_Globle
    FullHeight = 0
    object DBAdvGrid1: TDBGridEh
      Left = 0
      Top = 0
      Width = 911
      Height = 237
      Align = alClient
      DataSource = DSDB
      Flat = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Verdana'
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = DBAdvGrid1DrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CDBBH'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #27969#27700#21495
          Width = 65
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'CDBR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #25285#20445#20154
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'MDBJE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #25285#20445#37329#39069
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'CCZY'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #25805#20316#21592
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'CZF'
          Footers = <>
          Title.Caption = #20316#24223#26631#35760
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'CDBSM'
          Footers = <>
          Title.Caption = #25285#20445#35828#26126
          Width = 267
        end
        item
          EditButtons = <>
          FieldName = 'DLRRQ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #24405#20837#26085#26399
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'DDBYXQ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Caption = #25285#20445#26377#25928#26399
          Width = 126
        end>
    end
  end
  object DSDB: TDataSource
    Left = 426
    Top = 121
  end
  object EdtPopDBR: TADOEditPopBox
    DropDownShowTitles = True
    Ctl3D = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ExitWithEnter = True
    FocusControl = EdtDBR
    BorderColor = clBlack
    KeyField = 'CMC'
    Fields = <
      item
        FieldName = 'CBH'
        FieldOptions = [foeDisplay, foeFilter]
        FilterOptions = []
        TitleCaption = #32534#21495
        BackgroundColor = clWindow
        Width = 70
      end
      item
        FieldName = 'CMC'
        FieldOptions = [foeDisplay, foeFilter]
        FilterOptions = [foIgnoreCase, foPingYing, foLike]
        TitleCaption = #21517#31216
        BackgroundColor = clWindow
        Width = 100
      end>
    ShowOptions = [soEnterEmpty, soDBlClick]
    OnChecked = EdtPopDBRChecked
    OnExit = EdtPopDBRExit
    SQL.Strings = (
      'SELECT * FROM TBZDDBR where BEnable=1 ORDER BY CBH')
    Left = 472
    Top = 8
  end
  object QryTemp: TADOQuery
    Parameters = <>
    Left = 375
    Top = 13
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 40
  end
  object EdpDBSM: TADOEditPopBox
    DropDownShowTitles = True
    Ctl3D = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26032#23435#20307
    Font.Style = []
    ExitWithEnter = True
    BorderColor = clBlack
    KeyField = 'CMC'
    Fields = <
      item
        FieldName = 'IBM'
        FieldOptions = [foeDisplay, foeFilter, foeOrder]
        FilterOptions = [foIgnoreCase, foLike]
        TitleCaption = #32534#30721
        BackgroundColor = clWindow
        Width = 80
      end
      item
        FieldName = 'CMC'
        FieldOptions = [foeDisplay, foeFilter]
        FilterOptions = [foIgnoreCase, foLike]
        TitleCaption = #21517#31216
        BackgroundColor = clWindow
        Width = 100
      end>
    ShowOptions = [soEnterEmpty, soDBlClick]
    SQL.Strings = (
      'SELECT * FROM TBZDDBSM with(nolock)')
    Left = 656
    Top = 8
  end
end

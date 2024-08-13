object FrmHome: TFrmHome
  Left = 0
  Top = 0
  Caption = 'Tuis skerm'
  ClientHeight = 541
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 48
    Top = 24
    Width = 145
    Height = 137
  end
  object Image2: TImage
    Left = 199
    Top = 24
    Width = 146
    Height = 137
  end
  object Image3: TImage
    Left = 351
    Top = 24
    Width = 146
    Height = 137
  end
  object Image4: TImage
    Left = 503
    Top = 24
    Width = 154
    Height = 137
  end
  object PnlHome: TPanel
    Left = 48
    Top = 167
    Width = 609
    Height = 314
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 32
      Width = 477
      Height = 30
      Caption = 'Diere Beskermings Vereneging'
      Color = clPurple
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -32
      Font.Name = 'Fixedsys'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object PnlAdministrasie: TPanel
      Left = 8
      Top = 266
      Width = 145
      Height = 41
      Caption = 'Administrasie'
      Color = clAqua
      ParentBackground = False
      TabOrder = 0
      OnClick = PnlAdministrasieClick
    end
    object PnlAannemings: TPanel
      Left = 159
      Top = 266
      Width = 145
      Height = 41
      Caption = 'Aannemings'
      Color = clAqua
      ParentBackground = False
      TabOrder = 1
      OnClick = PnlAannemingsClick
    end
    object PnlDonasies: TPanel
      Left = 310
      Top = 266
      Width = 145
      Height = 41
      Caption = 'Donasies'
      Color = clAqua
      ParentBackground = False
      TabOrder = 2
    end
    object PnlHulp: TPanel
      Left = 461
      Top = 266
      Width = 145
      Height = 41
      Caption = 'Hulpvaardige'
      Color = clAqua
      ParentBackground = False
      TabOrder = 3
    end
  end
  object Timer1: TTimer
    Interval = 800
    OnTimer = Timer1Timer
    Left = 664
    Top = 480
  end
end

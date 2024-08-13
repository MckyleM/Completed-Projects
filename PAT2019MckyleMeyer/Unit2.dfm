object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'Administrasie'
  ClientHeight = 584
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PnlNAdmin: TPanel
    Left = 8
    Top = 8
    Width = 265
    Height = 568
    TabOrder = 0
    object LblNName: TLabel
      Left = 32
      Top = 21
      Width = 110
      Height = 13
      Caption = 'Tik jou nuwe naam hier'
    end
    object lblNPWord: TLabel
      Left = 32
      Top = 101
      Width = 84
      Height = 13
      Caption = 'Tik jou wagwoord'
    end
    object LblRePass: TLabel
      Left = 32
      Top = 181
      Width = 144
      Height = 13
      Caption = 'Hertik asseblief jou wagwoord'
    end
    object PnlNuweUser: TPanel
      Left = 32
      Top = 504
      Width = 185
      Height = 41
      Caption = 'Nuwe user'
      TabOrder = 0
      OnClick = PnlNuweUserClick
    end
    object edtNewUserName: TEdit
      Left = 32
      Top = 40
      Width = 185
      Height = 21
      TabOrder = 1
      Text = 'Tik jou naam'
    end
    object edtPass: TEdit
      Left = 32
      Top = 120
      Width = 185
      Height = 21
      PasswordChar = '#'
      TabOrder = 2
    end
    object EdtRePass: TEdit
      Left = 32
      Top = 200
      Width = 185
      Height = 21
      PasswordChar = '#'
      TabOrder = 3
    end
  end
end

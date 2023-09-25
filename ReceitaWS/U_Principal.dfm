object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Receita WS'
  ClientHeight = 331
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Memo: TMemo
    Left = 0
    Top = 153
    Width = 551
    Height = 178
    Align = alClient
    Lines.Strings = (
      'www.linkedin.com/in/amancio-santos')
    TabOrder = 0
    ExplicitWidth = 547
    ExplicitHeight = 177
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 153
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 547
    object Lb_Atividade: TLabel
      Left = 8
      Top = 124
      Width = 102
      Height = 15
      Caption = 'Atividade principal:'
    end
    object Lb_Fantasia: TLabel
      Left = 8
      Top = 103
      Width = 80
      Height = 15
      Caption = 'Nome fantasia:'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 15
      Caption = 'CNPJ'
    end
    object Edt_CNPJ: TEdit
      Left = 8
      Top = 26
      Width = 121
      Height = 23
      TabOrder = 0
      Text = '47960950000121'
      OnKeyPress = Edt_CNPJKeyPress
    end
    object Btn_Consultar: TBitBtn
      Left = 8
      Top = 58
      Width = 121
      Height = 28
      Caption = 'Consultar'
      Kind = bkAll
      NumGlyphs = 2
      TabOrder = 1
      OnClick = Btn_ConsultarClick
    end
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://receitaws.com.br'
    Params = <>
    SynchronizedEvents = False
    Left = 280
    Top = 264
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Resource = 'v1/cnpj/43422427000190'
    SynchronizedEvents = False
    Left = 200
    Top = 264
  end
end

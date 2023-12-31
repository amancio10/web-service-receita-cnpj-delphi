unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,

  REST.Client,
  Web.HTTPApp,
  REST.Types,
  System.JSON, Vcl.Imaging.pngimage;

type
  TFrm_Principal = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    Memo: TMemo;
    Panel1: TPanel;
    Lb_Atividade: TLabel;
    Lb_Fantasia: TLabel;
    Edt_CNPJ: TEdit;
    Btn_Consultar: TBitBtn;
    Label1: TLabel;
    Image1: TImage;
    procedure Btn_ConsultarClick(Sender: TObject);
    procedure Edt_CNPJKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

procedure TFrm_Principal.Btn_ConsultarClick(Sender: TObject);
var
 {Retorno do meu JSON}
 Retorno : TJSONObject;

 {Pair / N�s}
 Pair_atividade : TJSONPair;
 Pair_fantasia  : TJSONPair;

 {Array's}
 Array_atividade : TJSONArray;

 {Object / Objetos}
 Object_atividade : TJSONObject;

 {Para exibir em tela}
 Fantasia  : String;
 Atividade : String;
begin
 // RESTRequest.Resource := '/v1/cnpj/{}';
 // RESTRequest.Params.AddUrlSegment('cnpj', Edt_CNPJ.Text);
    RESTRequest.Resource := '/v1/cnpj/' + Edt_CNPJ.Text;

    RESTRequest.Execute;

    {Exibe o retorno do JSON no Memo}
    Memo.Text := RESTRequest.Response.JSONText;

 Retorno := RESTRequest.Response.JSONValue as TJSONObject;

 if Retorno.GetValue('status').Value <> 'OK' then
  begin
    MessageDlg('CNPJ inv�lido!', mtWarning, [mbOK], 0);
    Lb_Fantasia.Caption  := 'Nome fantasia:';
    Lb_Atividade.Caption := 'Atividade principal:';
   Exit
  end;

  Pair_fantasia        := Retorno.Get('fantasia');
  Fantasia             := Pair_fantasia.JsonValue.Value;
  Lb_Fantasia.Caption  := 'Nome fantasia: ' + Fantasia;


  Pair_atividade       := Retorno.Get('atividade_principal');
  Array_atividade      := Pair_atividade.JSONValue as TJSONArray;
  Object_atividade     := Array_atividade.Items[0] as TJSONObject;
  Atividade            := Object_atividade.GetValue('text').Value;
  Lb_Atividade.Caption := 'Atividade principal: ' + Atividade;
end;

procedure TFrm_Principal.Edt_CNPJKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  Key := #0;

 if key = #13 then
  begin
   key := #0;
   Btn_Consultar.Click;
  end;

end;

end.

# Web Service Receita Federal CNPJ Delphi
 Consulta CNPJ na receita federal com JSON em Delphi

## ⚡️ REST Debugger
* Vamos umar REST Debugger para ajudar na criação dos componentes.

![Captura de tela 2023-09-25 122545](https://github.com/amancio10/web-service-receita-cnpj-delphi/assets/48102777/c46e4089-5020-43fe-8757-275386e595f7)

![Captura de tela 2023-09-25 123034](https://github.com/amancio10/web-service-receita-cnpj-delphi/assets/48102777/f2baf31a-b0a8-46a0-acc5-2a3764ef10f0)

![Captura de tela 2023-09-25 123255](https://github.com/amancio10/web-service-receita-cnpj-delphi/assets/48102777/b2442f42-48de-49e9-9a76-98cfa672c6f6)

Após testarmos nosso Debugger vamos copiar os componentes em 'Copy Components' e colar em nosso projeto.

## ⚡️ Coding...
* ### Uses
 ```delphi
uses REST.Client, Web.HTTPApp, REST.Types, System.JSON;
```
* ### Variável
```delphi
var
 {Retorno do meu JSON}
 Retorno : TJSONObject;

 {Pair / Nós}
 Pair_atividade : TJSONPair;
 Pair_fantasia  : TJSONPair;

 {Array's}
 Array_atividade : TJSONArray;

 {Object / Objetos}
 Object_atividade : TJSONObject;

 {Para exibir em tela}
 Fantasia  : String;
 Atividade : String;
```

* ### Comando
```delphi
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
    MessageDlg('CNPJ inválido!', mtWarning, [mbOK], 0);
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
```

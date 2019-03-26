#language: pt
#enconding: utf-8 

@quote_by_product
Funcionalidade: Cotações de frete

Esquema do Cenário: Validar canais sem área de atuação
    Dado que faço um POST no serviço quote_by_product com o canal "<sales_channel>"
    Então vejo o status code '400' 
    E vejo a mensagem de erro 'Sem opções de entrega viável. Por favor, verifique se os códigos postais estão corretos.'
    Exemplos: 
    |sales_channel|
    |CN1          |
    |CN2          |

Cenário: Validar canal sem a opção de entraga Correios PAC
    Dado que faço um POST no serviço quote_by_product com o canal 'CN123' e o cep de destino esteja entre as faixas 22710010 e 22710990
    Então vejo o status code '200'
    E a opção de entrega 'Correios PAC' não é disponibilizada 

Cenário: Validar entrega de Tocantins para a região Sudeste
    Dado que faço um POST no serviço quote_by_product com o cep de origem '77001054' e cep destino '03132125'
    Então vejo o status code '400' 
    E vejo a mensagem de erro 'Sem opções de entrega viável. Por favor, verifique se os códigos postais estão corretos.'

Cenário: Validar data de entrega para o estado do Pará 
    Dado que faço um POST no serviço quote_by_product com o cep de origem '4012080' e cep destino '66010000'
    Então vejo o status code '200'
    E vejo que a entrega deverá ser feita em '20' dias 

Cenário: Validar tipo de entrega para cotação SKU123
    Dado que faço um POST no serviço quote_by_product com o identificador 'SKU123'
    Então vejo o status code '200'
    E a opção de entrega 'Correios PAC' não é disponibilizada 
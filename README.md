## Intelipost: Teste prático
 
Teste automatizado da API de cotação

Para criação do BDD, os steps foram escritos de forma genérica para que pudessem ser reutilizados em outros cenários. 

Foi utilizado neste projeto: 

  Cucumber 
  
  Ruby
  
  Httparty: Gem do Ruby que gera as respostas para as requisições feitas)
  
  Rspec: Framework para testes em Ruby que descreve o comportamento. Onde o resultado do teste é exibido no terminal)
  
  
## Pré Requisitos

Ter o Ruby e Bundler instalado

## Instalação 

1.  Faça o clone desse projeto com: git clone https://github.com/carolinafreiria/job-quality-engineer.git
2.  Entre na pasta features do projeto e instale as dependências com: bundle install
3.  Volte para a pasta raiz do projeto (job-quality-engineer) 
4.  Rode o teste no terminal com o comando: cucumber -t @quote_by_product

## Resultado dos Testes

Validar canais sem área de atuação - Falhou 

Validar canal sem a opção de entraga Correios PAC - OK  

Validar entrega de Tocantins para a região Sudeste  - OK

Validar data de entrega para o estado do Pará - OK 

Validar tipo de entrega para cotação SKU123 - OK 

No cenário de validação dos canais sem área de atuação, a requisição do canal CN2 retornou com sucesso, quando deveria falhar e apresentar a mensagem de que não havia área de atuação para aquele canal.

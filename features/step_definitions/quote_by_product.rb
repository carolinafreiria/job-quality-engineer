#enconding: utf-8

#DADO

Dado("que faço um POST no serviço quote_by_product com o canal {string}") do |sales_channel|
  table = {
    "origin_zip_code": "04012080",
    "destination_zip_code": "04304011",
    "quoting_mode": "DYNAMIC_BOX_ALL_ITEMS",
    "products": [
      {
        "weight": 5,
        "cost_of_goods": 10.7,
        "width": 15,
        "height": 17.5,
        "length": 15,
        "quantity": 1,
        "sku_id": "SKU123",
        "product_category": "Bebidas"
      },
      {
        "weight": 7,
        "cost_of_goods": 20.99,
        "width": 20.5,
        "height": 30.7,
        "length": 20,
        "quantity": 1,
        "sku_id": "SKU456",
        "product_category": "Bebidas"
      }
    ],
    "additional_information": {
      "lead_time_business_days": 1,
      "sales_channel": sales_channel,
      "client_type": "gold"
    },
    "identification": {
      "session": "04e5bdf7ed15e571c0265c18333b6fdf1434658753",
      "ip": "000.000.000.000",
      "page_name": "carrinho",
      "url": "http://www.intelipost.com.br/checkout/cart/"
    }
  }  
  requests.post(table)
end

Dado("que faço um POST no serviço quote_by_product com o cep de origem {string} e cep destino {string}") do |origin_zip_code, destination_zip_code|
  table = {
  "origin_zip_code": origin_zip_code,
  "destination_zip_code": destination_zip_code,
  "quoting_mode": "DYNAMIC_BOX_ALL_ITEMS",
  "products": [
    {
      "weight": 5,
      "cost_of_goods": 10.7,
      "width": 15,
      "height": 17.5,
      "length": 15,
      "quantity": 1,
      "sku_id": "SKU123",
      "product_category": "Bebidas"
    },
    {
      "weight": 7,
      "cost_of_goods": 20.99,
      "width": 20.5,
      "height": 30.7,
      "length": 20,
      "quantity": 1,
      "sku_id": "SKU456",
      "product_category": "Bebidas"
    }
  ],
  "additional_information": {
    "lead_time_business_days": 1,
    "sales_channel": "meu_canal_de_vendas",
    "client_type": "gold"
  },
  "identification": {
    "session": "04e5bdf7ed15e571c0265c18333b6fdf1434658753",
    "ip": "000.000.000.000",
    "page_name": "carrinho",
    "url": "http://www.intelipost.com.br/checkout/cart/"
  }
}
requests.post(table)
end

Dado("que faço um POST no serviço quote_by_product com o identificador {string}") do |sku_id|
  table = {
  "origin_zip_code": "04012080",
  "destination_zip_code": "04304011",
  "quoting_mode": "DYNAMIC_BOX_ALL_ITEMS",
  "products": [
    {
      "weight": 5,
      "cost_of_goods": 10.7,
      "width": 15,
      "height": 17.5,
      "length": 15,
      "quantity": 1,
      "sku_id": sku_id,
      "product_category": "Bebidas"
    }
  ],
  "additional_information": {
    "lead_time_business_days": 1,
    "sales_channel": "meu_canal_de_vendas",
    "client_type": "gold"
  },
  "identification": {
    "session": "04e5bdf7ed15e571c0265c18333b6fdf1434658753",
    "ip": "000.000.000.000",
    "page_name": "carrinho",
    "url": "http://www.intelipost.com.br/checkout/cart/"
  }
}
requests.post(table)
end

Dado("que faço um POST no serviço quote_by_product com o canal {string} e o cep de destino esteja entre as faixas {int} e {int}") do |channel, faixa_i, faixa_f|
  print "VALIDANDO CEP's"
  for i in faixa_i..faixa_f
    table = {
      "origin_zip_code": "04012080",
      "destination_zip_code": i.to_s,
      "quoting_mode": "DYNAMIC_BOX_ALL_ITEMS",
      "products": [
        {
          "weight": 5,
          "cost_of_goods": 10.7,
          "width": 15,
          "height": 17.5,
          "length": 15,
          "quantity": 1,
          "sku_id": "SKU123",
          "product_category": "Bebidas"
        }
      ],
      "additional_information": {
        "lead_time_business_days": 1,
        "sales_channel": channel,
        "client_type": "gold"
      },
      "identification": {
        "session": "04e5bdf7ed15e571c0265c18333b6fdf1434658753",
        "ip": "000.000.000.000",
        "page_name": "carrinho",
        "url": "http://www.intelipost.com.br/checkout/cart/"
      }
    }
    requests.post(table)
  end
  
end

#ENTÃO 

Então("vejo o status code {string}") do |status_code|
    expect($result.response.code).to eql status_code
end

#E

E("vejo a mensagem de erro {string}") do |message|
    expect($result["messages"][0]["text"]).to eql message
end

E("vejo que a entrega deverá ser feita em {string} dias") do |estimate_days|
  expect($result["content"]["delivery_options"][0]["delivery_estimate_business_days"].to_s).to eql estimate_days
  expect($result["content"]["delivery_options"][1]["delivery_estimate_business_days"].to_s).to eql estimate_days
end

Então("a opção de entrega {string} não é disponibilizada") do |delivery_method_name|
  expect($result["content"]["delivery_options"][0]["delivery_method_name"]).to_not eql delivery_method_name
  expect($result["content"]["delivery_options"][1]["delivery_method_name"]).to_not eql delivery_method_name
end


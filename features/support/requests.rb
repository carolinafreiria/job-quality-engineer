class Requests

    def post(table)
        request = 'https://api.intelipost.com.br/api/v1/quote_by_product'
    
          table = table.to_json
    
        $result = HTTParty.post(
            request,
            headers: {'api-key' => '4aa90b1087807b5fb8e52b01584f84e416ddb8ab8e5b800ae5d0f075a2d1e379', 'platform' => 'intelipost-docs', 'platform-version' => 'v1.0.0', 'plugin' => 'intelipost-plugin', 'plugin-version' => 'v2.0.0', 'Content-Type' => 'application/json'},
            body: table
        )
        return $result
      end

end
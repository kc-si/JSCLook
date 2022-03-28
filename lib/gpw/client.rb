# frozen_string_literal: true

module GPW
  class Client
    def fetch_companies_list
      response = fetch_gpw_stock_list
      parse_response(response)
    end

    private

    def fetch_gpw_stock_list
      conn_gpw = Faraday.new(
        url: 'https://gpw.notoria.pl/widgets/ta/symbols.php',
        headers: {
          'Accept' => 'application/json',
          'Referer' => 'https://gpw.notoria.pl',
          'DNT' => '1',
          'Sec-GPC' => '1',
        },
      )

      conn_gpw.get
    end

    def parse_response(response)
      body_parsed = JSON.parse(response.body.split('(')[1].split(')')[0])

      body_parsed.fetch('symbols').map do |company|
        {
          name: company[0],
          isin: company[1],
        }
      end
    end
  end
end

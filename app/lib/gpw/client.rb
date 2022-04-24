# frozen_string_literal: true

GPW_DETAILS_URL = 'https://www.money.pl/api/graphql?query=query%20sg_money_gielda_gpw_stock_fundaments_compare(%24index%3A%20String%2C%20%24cp%3A%20Float%2C%20%24cz%3A%20Float%2C%20%24cwk%3A%20Float%2C%20%24wk_min%3A%20Float%2C%20%24wk_max%3A%20Float%2C%20%24kapitalizacja_min%3A%20Float%2C%20%24kapitalizacja_max%3A%20Float%2C%20%24ros%3A%20Float%2C%20%24roa%3A%20Float%2C%20%24roe%3A%20Float%2C%20%24zadluzenie_o%3A%20Float%2C%20%24zadluzenie_k%3A%20Float%2C%20%24zadluzenie_d%3A%20Float)%20%7B%0A%20%20tableData%3A%20gpw_stock_fundaments_compare(index%3A%20%24index%2C%20cp%3A%20%24cp%2C%20cz%3A%20%24cz%2C%20cwk%3A%20%24cwk%2C%20wk_min%3A%20%24wk_min%2C%20wk_max%3A%20%24wk_max%2C%20kapitalizacja_min%3A%20%24kapitalizacja_min%2C%20kapitalizacja_max%3A%20%24kapitalizacja_max%2C%20ros%3A%20%24ros%2C%20roa%3A%20%24roa%2C%20roe%3A%20%24roe%2C%20zadluzenie_o%3A%20%24zadluzenie_o%2C%20zadluzenie_k%3A%20%24zadluzenie_k%2C%20zadluzenie_d%3A%20%24zadluzenie_d)%20%7B%0A%20%20%20%20stock%0A%20%20%20%20stock_url_rel%0A%20%20%20%20cp%0A%20%20%20%20cz%0A%20%20%20%20cwk%0A%20%20%20%20wk%0A%20%20%20%20kapitalizacja%0A%20%20%20%20roa%0A%20%20%20%20roe%0A%20%20%20%20ros%0A%20%20%20%20zadluzenie_o%0A%20%20%20%20zadluzenie_k%0A%20%20%20%20zadluzenie_d%0A%20%20%20%20report_date%0A%20%20%20%20stock_url_rel%0A%20%20%20%20__typename%0A%20%20%7D%0A%7D%0A&operationName=sg_money_gielda_gpw_stock_fundaments_compare&variables=%7B%7D'
NC_DETAILS_URL = 'https://www.money.pl/api/graphql?query=query%20sg_money_gielda_gpw_ciagle_notowania(%24type%3A%20%5BInt%5D!%2C%20%24index%3A%20%5BString%5D%2C%20%24sector%3A%20%5BInt%5D%2C%20%24date%3A%20String)%20%7B%0A%20%20data%3A%20gpw_ciagle_notowania(type%3A%20%24type%2C%20index%3A%20%24index%2C%20sector%3A%20%24sector%2C%20date%3A%20%24date)%20%7B%0A%20%20%20%20nazwa_pelna%0A%20%20%20%20url_rel%0A%20%20%20%20kurs%0A%20%20%20%20change_prev%0A%20%20%20%20open%0A%20%20%20%20min%0A%20%20%20%20max%0A%20%20%20%20wolumen%0A%20%20%20%20obrot%0A%20%20%20%20close%0A%20%20%20%20notowanie_data%0A%20%20%20%20czas%0A%20%20%20%20symbol%0A%20%20%20%20__typename%0A%20%20%7D%0A%7D%0A&operationName=sg_money_gielda_gpw_ciagle_notowania&variables=%7B%22type%22%3A%5B13%5D%2C%22index%22%3Anull%2C%22sector%22%3Anull%2C%22date%22%3A%22%22%2C%22letter%22%3A%22%22%2C%22searchWord%22%3A%22%22%2C%22followedStocks%22%3A%5B%5D%7D'

module Gpw
  class Client
    def initialize(client: Faraday.new)
      @client = client
    end

    def fetch_companies_list
      response = fetch_stock_list
      parse_response(response)
    end

    def fetch_gpw_companies_details
      response = fetch_gpw_stock_list
      parse_money_response_gpw(response)
    end

    def fetch_nc_companies_details
      response = fetch_nc_stock_list
      parse_money_response_nc(response)
    end

    private

    def fetch_stock_list
      @client.get('https://gpw.notoria.pl/widgets/ta/symbols.php',
        {},
        {
          'Accept' => 'application/json',
          'DNT' => '1',
          'Referer' => 'https://gpw.notoria.pl',
        })
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

    def fetch_gpw_stock_list
      @client.get(GPW_DETAILS_URL,
        {},
        {
          'Accept' => '*/*',
          'DNT' => '1',
          'Referer' => 'https://www.money.pl/',
        })
    end

    def parse_money_response_gpw(response)
      response_parsed = JSON.parse(response.body)

      response_parsed
        .fetch('data')
        .fetch('tableData')
        .select { |row| row['stock_url_rel'] }
        .map do |company|
        {
          isin: company['stock_url_rel'][%r{/\w*\.}].delete_prefix!('/').delete_suffix!('.'),
          stock: 'GPW',
          pbv: company['cwk'],
          pe: company['cz'],
          condition: 'company active',
        }
      end
    end

    def fetch_nc_stock_list
      @client.get(NC_DETAILS_URL,
        {},
        {
          'Accept' => '*/*',
          'DNT' => '1',
          'Referer' => 'https://www.money.pl/',
        })
    end

    def parse_money_response_nc(response)
      response_parsed = JSON.parse(response.body)

      response_parsed
        .fetch('data')
        .fetch('data')
        .select { |row| row['url_rel'] }
        .map do |company|
        {
          isin: company['url_rel'][%r{/\w*\.}].delete_prefix!('/').delete_suffix!('.'),
          full_name: company['nazwa_pelna'],
          abbreviation: company['symbol'],
          stock: 'NC',
          condition: 'company active',
        }
      end
    end
  end
end

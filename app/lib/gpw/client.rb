# frozen_string_literal: true

GPW_DETAILS_URL = 'https://www.money.pl/api/graphql?query=query%20sg_money_gielda_gpw_stock_fundaments_compare(%24index%3A%20String)%20%7B%0A%20%20tableData%3A%20gpw_stock_fundaments_compare(index%3A%20%24index)%20%7B%0A%20%20%20%20stock%0A%20%20%20%20stock_url_rel%0A%20%20%20%20cp%0A%20%20%20%20cz%0A%20%20%20%20cwk%0A%20%20%20%20wk%0A%20%20%20%20kapitalizacja%0A%20%20%20%20report_date%0A%20%20%20%20stock_url_rel%0A%20%20%20%20__typename%0A%20%20%7D%0A%7D%0A&operationName=sg_money_gielda_gpw_stock_fundaments_compare&variables=%7B%7D'
NC_DETAILS_URL = 'https://www.money.pl/api/graphql?query=query%20sg_money_gielda_gpw_ciagle_notowania(%24type%3A%20%5BInt%5D!%2C%20%24index%3A%20%5BString%5D%2C%20%24sector%3A%20%5BInt%5D%2C%20%24date%3A%20String)%20%7B%0A%20%20data%3A%20gpw_ciagle_notowania(type%3A%20%24type%2C%20index%3A%20%24index%2C%20sector%3A%20%24sector%2C%20date%3A%20%24date)%20%7B%0A%20%20%20%20nazwa_pelna%0A%20%20%20%20url_rel%0A%20%20%20%20kurs%0A%20%20%20%20change_prev%0A%20%20%20%20open%0A%20%20%20%20min%0A%20%20%20%20max%0A%20%20%20%20wolumen%0A%20%20%20%20obrot%0A%20%20%20%20close%0A%20%20%20%20notowanie_data%0A%20%20%20%20czas%0A%20%20%20%20symbol%0A%20%20%20%20__typename%0A%20%20%7D%0A%7D%0A&operationName=sg_money_gielda_gpw_ciagle_notowania&variables=%7B%22type%22%3A%5B13%5D%2C%22index%22%3Anull%2C%22sector%22%3Anull%2C%22date%22%3A%22%22%2C%22letter%22%3A%22%22%2C%22searchWord%22%3A%22%22%2C%22followedStocks%22%3A%5B%5D%7D'

module GPW
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

    def fetch_company_shareholders(stock, isin)
      response = fetch_gpw_company_tab(stock, isin, 'shareholdersTab')
      parse_shareholders_list(response)
    end

    def fetch_gpw_company_profile(stock, isin)
      response_info = fetch_gpw_company_tab(stock, isin, 'infoTab')
      profile_info = parse_profile_info(response_info.body)
      sleep(1.second)
      response_quotations = fetch_gpw_company_tab(stock, isin, 'quotationsTab')
      profile_quotations = parse_profile_quotations(response_quotations.body)
      sleep(1.second)
      response_indicators = fetch_gpw_company_tab(stock, isin, 'indicatorsTab')
      profile_indicators = parse_profile_indicators(response_indicators.body)
      profile_info.merge(profile_quotations, profile_indicators)
    end

    private

    def fetch_stock_list
      @client.get(
        'https://gpw.notoria.pl/widgets/ta/symbols.php',
        {},
        {
          'Accept' => 'application/json',
          'Referer' => 'https://gpw.notoria.pl',
        },
      )
    end

    def parse_response(response)
      body_parsed = JSON.parse(response.body[/{.*}/])

      body_parsed.fetch('symbols').map do |company|
        {
          name: company[0],
          isin: company[1],
        }
      end
    end

    def fetch_gpw_stock_list
      @client.get(
        GPW_DETAILS_URL,
        {},
        {
          'Referer' => 'https://www.money.pl/',
        },
      )
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
          price: company['kapitalizacja'].to_s,
          pbv: company['cwk'].to_s,
          pe: company['cz'].to_s,
          condition: 'company_active',
        }
      end
    end

    def fetch_nc_stock_list
      @client.get(
        NC_DETAILS_URL,
        {},
        {
          'Referer' => 'https://www.money.pl/',
        },
      )
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
          condition: 'company_active',
        }
      end
    end

    def fetch_gpw_company_tab(stock, isin, tab)
      case stock
        when 'GPW'
          url = 'https://www.gpw.pl/ajaxindex.php'
          action = 'GPWListaSp'
        when 'NC'
          url = 'https://newconnect.pl/ajaxindex.php'
          action = 'NCCompany'
      end
      @client.post(
        url,
        {
          start: tab,
          format: 'html',
          action: action,
          gls_isin: isin,
        },
        {
          'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:99.0) Gecko/20100101 Firefox/99.0',
          'Accept-Language' => 'en-US,en;q=0.5',
        },
      )
    end

    def parse_shareholders_list(response)
      doc = Nokogiri::HTML.parse(response.body)
      table = doc.search('table')[0]
      table.search('tr').drop(1).map do |tr|
        tds = tr.search('td')
        {
          name: tds[0].text,
          shares_count: tds[1].text,
          shares_percentage: tds[2].text,
          voices_count: tds[3].text,
          voices_percentage: tds[4].text,
        }
      end
    end

    def parse_profile_info(response_body)
      tds = parse_gpw_response_table(response_body)
      {
        full_name: tds[5].text,
        abbreviation: tds[4].text,
        shares_amount: tds[1].text,
        price: tds[2].text,
        www: tds[11].text.strip,
        e_mail: tds[12].text.strip,
      }
    end

    def parse_profile_quotations(response_body)
      tds = parse_gpw_response_table(response_body)
      belong_to = tds[0].text.split(',').map { |str| str.strip }
      {
        belong_to: belong_to.join(', '),
      }
    end

    def parse_profile_indicators(response_body)
      tds = parse_gpw_response_table(response_body)
      {
        sector: tds[2].text,
        book_value: tds[5].text,
      }
    end

    def parse_gpw_response_table(response_body)
      doc = Nokogiri::HTML.parse(response_body)
      table = doc.search('table')[0]
      table.search('tr').map { |tr| tr.search('td') }
    end
  end
end

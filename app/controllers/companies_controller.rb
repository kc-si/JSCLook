# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def update_db
    response = read_stock
    @companies = parse_data(response)
    @companies.each { |company| Company.find_or_create_by!(company) }
  end

  private

  def read_stock
    conn_gpw = Faraday.new(
      url: 'https://gpw.notoria.pl/widgets/ta/symbols.php',
      params: {
        callback: 'jQuery221045406664420430665_1647857422814',
        _: '1647857422815',
      },
      headers: {
        'Accept' => 'application/json',
        'Accept-Language' => 'en-US,en;q=0.5',
        'Content-Type' => 'application/json',
        'X-Requested-With' => 'XMLHttpRequest',
        'Connection' => 'keep-alive',
        'Referer' => 'https://gpw.notoria.pl/widgets/ta/index.html?symbid=PLPKN0000018&symbname=PKNORLEN&symburl=/widgets/ta/symbols.php&dataurl=/widgets/ta/data.php&periods=1d,1w,1m&periods_intraday=1&ranges=1d,1m,3m,6m,1y,2y,3y,5y,10y',
        'Sec-Fetch-Dest' => 'empty',
        'Sec-Fetch-Mode' => 'cors',
        'Sec-Fetch-Site' => 'same-origin',
        'DNT' => '1',
        'Sec-GPC' => '1',
      },
    )

    conn_gpw.get
  end

  def parse_data(response)
    response_parsed = JSON.parse(response.body.split('(')[1].split(')')[0])

    response_parsed['symbols'].map do |company|
      {
        name: company[0],
        symbol: company[1],
      }
    end
  end
end

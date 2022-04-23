# frozen_string_literal: true

class CompanyPresenter
  def initialize(company)
    @company = company
  end

  def id
    @company.id
  end

  def name
    @company.name
  end

  def isin
    @company.isin
  end

  def created_at
    @company.created_at
  end

  def updated_at
    @company.updated_at
  end

  def full_name
    @company.full_name or 'n/a'
  end

  def abbreviation
    @company.abbreviation or 'n/a'
  end

  def stock
    @company.stock or 'n/a'
  end

  def sector
    @company.sector or 'n/a'
  end

  def belong_to
    @company.belong_to
  end

  def price
    @company.price or 'n/a'
  end

  def book_value
    @company.book_value or 'n/a'
  end

  def shares_amount
    @company.shares_amount or 'n/a'
  end

  def www
    @company.www or 'n/a'
  end

  def pbv
    @company.pbv ? @company.pbv.ceil(3) : 'n/a'
  end

  def pe
    @company.pe ? @company.pe.ceil(3) : 'n/a'
  end

  def condition
    @company.condition
  end
end

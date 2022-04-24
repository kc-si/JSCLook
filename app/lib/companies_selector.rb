# frozen_string_literal: true

class CompaniesSelector < ApplicationService
  def call(params)
    relation = Company.all
    relation = filter_by_condition(relation, params.fetch(:condition, 'company_active'))
    relation = filter_by_stock(relation, params.fetch(:stock)) if params.key?(:stock)
    relation = filter_by_query(relation, params.fetch(:query)) if params.key?(:query)
    relation.all
  end

  private

  def filter_by_condition(relation, condition)
    relation.where(condition: condition)
  end

  def filter_by_stock(relation, stock)
    relation.where(stock: stock)
  end

  def filter_by_query(relation, query)
    pattern = "%#{query.upcase}%"

    relation.where('name LIKE ? OR isin LIKE ?', pattern, pattern)
  end
end

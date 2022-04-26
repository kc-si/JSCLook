# frozen_string_literal: true

AVAILABLE_STOCKS = %w[GPW NC].freeze
AVAILABLE_CONDITIONS = %w[company_active].freeze

module Companies
  class SelectorParamsValidator
    include ActiveModel::Validations

    attr_reader :params

    validates :stock, inclusion: { in: AVAILABLE_STOCKS }, allow_nil: true
    validates :condition, inclusion: { in: AVAILABLE_CONDITIONS }, allow_nil: true
    validates :query, length: { maximum: 40 }, allow_nil: true

    def initialize(params = {})
      @params = params
    end

    def read_attribute_for_validation(key)
      params[key]
    end
  end
end

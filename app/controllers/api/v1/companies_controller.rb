# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      def index
        respond_to do |format|
          if selector_params_valid?
            @companies = CompaniesSelector.call(params.permit(:query, :stock, :condition))
            format.json { render json: @companies }
          else
            format.json { render json: { error: 'Bad request.' }, status: :unprocessable_entity }
          end
        end
      end

      def show
        company = Company.find(params.require(:id))
        @company = JSON.parse(CompanyPresenter.new(company).to_json)['company']

        respond_to do |format|
          format.json { render json: @company }
        end
      end

      private

      def selector_params_valid?
        Companies::SelectorParamsValidator.new(params.permit(:query, :stock, :condition)).valid?
      end
    end
  end
end

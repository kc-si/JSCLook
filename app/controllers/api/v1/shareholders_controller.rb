# frozen_string_literal: true

module Api
  module V1
    class ShareholdersController < ApplicationController
      def index
        @shareholders = Shareholder.all

        respond_to do |format|
          format.json { render json: @shareholders }
        end
      end

      def show
        @shareholder = Shareholder.find(params.require(:id))

        respond_to do |format|
          format.json { render json: @shareholder }
        end
      end

      def show_shareholder_companies
        shareholder = Shareholder.find(params.require(:id))

        respond_to do |format|
          format.json { render json: shareholder.companies }
        end
      end

      def show_shareholder_shares
        shareholder = Shareholder.find(params.require(:id))

        respond_to do |format|
          format.json { render json: shareholder.shares }
        end
      end
    end
  end
end

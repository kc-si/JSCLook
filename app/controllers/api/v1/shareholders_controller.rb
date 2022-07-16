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
    end
  end
end

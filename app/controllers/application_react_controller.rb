# frozen_string_literal: true

class ApplicationReactController < ApplicationController
  add_flash_types :info, :error

  def react
    render 'react_app'
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :error

  def react
    render 'react_app'
  end
end

# frozen_string_literal: true

class ApplicationService < ApplicationController
  def self.call
    new.call
  end
end

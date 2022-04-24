# frozen_string_literal: true

class ApplicationService < ApplicationController
  def self.call(*args)
    new.call(*args)
  end
end

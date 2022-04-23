# frozen_string_literal: true

class Shareholder < ApplicationRecord
  has_many :shares, dependent: :destroy
  has_many :companies, through: :shares
end

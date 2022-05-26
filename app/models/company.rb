# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :shares, dependent: :destroy
  has_many :shareholders, through: :shares
end

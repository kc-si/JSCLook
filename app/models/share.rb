# frozen_string_literal: true

class Share < ApplicationRecord
  belongs_to :shareholder
  belongs_to :company
end

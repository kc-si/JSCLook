# frozen_string_literal: true

class AddSharesTimestampToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :shares_updated_at, :datetime
  end
end

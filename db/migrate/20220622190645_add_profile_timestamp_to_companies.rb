# frozen_string_literal: true

class AddProfileTimestampToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :profile_updated_at, :datetime
  end
end

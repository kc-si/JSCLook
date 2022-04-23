# frozen_string_literal: true

class AddDetailsToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_table :companies, bulk: true do |t|
      t.string :full_name
      t.string :abbreviation
      t.string :stock
      t.string :sector
      t.string :belong_to
      t.float :price
      t.float :book_value
      t.integer :shares_amount
      t.string :www
      t.float :pbv
      t.float :pe
      t.string :condition
    end
  end
end

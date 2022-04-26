# frozen_string_literal: true

class AddDetailsToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_table :companies, bulk: true do |t|
      t.string :full_name
      t.string :abbreviation
      t.string :stock
      t.string :sector
      t.string :belong_to
      t.string :price
      t.string :book_value
      t.string :shares_amount
      t.string :www
      t.string :e_mail
      t.string :pbv
      t.string :pe
      t.string :condition
    end
  end
end

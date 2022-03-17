# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :symbol, null: false

      t.timestamps
    end
    add_index :companies, :symbol, unique: true
  end
end

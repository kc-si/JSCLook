# frozen_string_literal: true

class CreateShares < ActiveRecord::Migration[7.0]
  def change
    create_table :shares do |t|
      t.string :shares_count
      t.references :shareholder, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

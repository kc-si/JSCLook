# frozen_string_literal: true

class CreateShareholders < ActiveRecord::Migration[7.0]
  def change
    create_table :shareholders do |t|
      t.string :name

      t.timestamps
    end
  end
end

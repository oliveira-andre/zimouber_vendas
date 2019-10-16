# frozen_string_literal: true

class Advertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :heading, null: false
      t.string :description
      t.decimal :value, null: false, precision: 10, scale: 2
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

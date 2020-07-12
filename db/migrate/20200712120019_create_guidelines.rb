# frozen_string_literal: true

class CreateGuidelines < ActiveRecord::Migration[6.0]
  def change
    create_table :guidelines do |t|
      t.string :display_id, null: false, index: { unique: true }
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end

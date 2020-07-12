# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :display_id, null: false, index: { unique: true }
      t.references :guideline, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :position, null: false
      t.text :description
      t.text :remark

      t.timestamps
    end

    add_index :steps, %i(guideline_id position), unique: true
  end
end

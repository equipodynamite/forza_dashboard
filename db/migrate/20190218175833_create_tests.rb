class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.float :reps
      t.integer :form
      t.integer :rom
      t.integer :core
      t.integer :rythm
      t.text :notes
      t.references :physical_test

      t.timestamps
    end
  end
end

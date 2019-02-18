class CreatePhysicalTests < ActiveRecord::Migration[5.2]
  def change
    create_table :physical_tests do |t|
      t.datetime :date
      t.integer :suggested_program
      t.references :user

      t.timestamps
    end
  end
end

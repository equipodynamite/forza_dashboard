class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.datetime :date
      t.text :notes
      t.references :user

      t.timestamps
    end
  end
end

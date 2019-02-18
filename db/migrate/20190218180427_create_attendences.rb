class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.datetime :date
      t.references :user

      t.timestamps
    end
  end
end

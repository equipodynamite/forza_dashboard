class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.datetime :start_date
      t.integer :duration
      t.references :user

      t.timestamps
    end
  end
end

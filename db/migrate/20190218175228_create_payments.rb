class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.datetime :date
      t.float :amount
      t.integer :status
      t.references :user

      t.timestamps
    end
  end
end

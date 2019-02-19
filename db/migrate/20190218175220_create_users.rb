class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :type
      t.integer :status
      t.string :password
      t.integer :program

      t.references :membership
      t.timestamps
    end
  end
end

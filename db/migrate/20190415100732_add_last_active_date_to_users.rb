class AddLastActiveDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_active_date, :date
  end
end

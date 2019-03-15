class DropMemberships < ActiveRecord::Migration[5.2]
  def change
    drop_table :memberships
  end
end

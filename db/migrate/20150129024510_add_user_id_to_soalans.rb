class AddUserIdToSoalans < ActiveRecord::Migration
  def change
    add_column :soalans, :user_id, :integer
    add_index :soalans, :user_id
  end
end

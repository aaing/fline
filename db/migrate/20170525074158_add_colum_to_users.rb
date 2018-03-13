class AddColumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_id, :string
  end
end

class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :key, unique: true
      t.text :detail
      t.timestamps null: false
    end
  end
end

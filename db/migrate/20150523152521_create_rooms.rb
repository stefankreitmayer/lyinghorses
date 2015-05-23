class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :rooms, :name, unique: true
  end
end

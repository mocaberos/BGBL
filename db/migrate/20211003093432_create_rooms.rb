class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string  :room_id,     null: false
      t.string  :user_name,   null: false
      t.integer :card_number, null: false
      t.boolean :show,        null: false
      t.boolean :master,      null: false
      t.timestamps
    end

    add_index :rooms, %i[room_id user_name], unique: true
  end
end

class CreateRoomUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :room_users do |t|
      t.timestamps
    end
  end
end

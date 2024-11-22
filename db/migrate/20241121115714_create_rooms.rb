class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :desc
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

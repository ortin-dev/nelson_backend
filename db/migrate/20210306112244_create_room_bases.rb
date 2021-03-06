class CreateRoomBases < ActiveRecord::Migration[6.1]
  def change
    create_table :room_bases do |t|
      t.string  :title, null: false, deafult: ''
      t.integer :room_type, null: false, default: 0
      t.timestamps
    end
  end
end

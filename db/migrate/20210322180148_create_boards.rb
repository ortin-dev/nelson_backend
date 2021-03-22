class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :task_boards do |t|
      t.references :room_base, index: true
      t.string :title, null: false, default: ''

      t.timestamps
    end
  end
end

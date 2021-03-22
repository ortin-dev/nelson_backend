class CreateBoardTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :board_tickets do |t|
      t.references :board_step, index: true
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.timestamps
    end
  end
end

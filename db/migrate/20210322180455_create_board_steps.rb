class CreateBoardSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :board_steps do |t|
      t.references :task_board, index: true
      t.string :title, null: false, default: ''
      t.timestamps
    end
  end
end

class AddPositionToBorderStep < ActiveRecord::Migration[6.1]
  def change
    add_column :board_steps, :position, :integer, null: false, default: 0
  end
end

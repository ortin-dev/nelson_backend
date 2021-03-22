class AddPositionToBorderTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :board_tickets, :position, :integer, null: false, default: 0
  end
end

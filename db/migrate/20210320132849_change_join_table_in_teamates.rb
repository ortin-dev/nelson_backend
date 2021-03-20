class ChangeJoinTableInTeamates < ActiveRecord::Migration[6.1]
  def change
    remove_column :teammates, :room_base_id
  end
end

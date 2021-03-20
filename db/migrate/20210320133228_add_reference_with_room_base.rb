class AddReferenceWithRoomBase < ActiveRecord::Migration[6.1]
  def change
    add_reference :teammates, :room_base, index: true
  end
end

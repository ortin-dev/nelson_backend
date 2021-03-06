class RoomBase < ApplicationRecord
  enum room_type: [:project, :team, :home_base]
end

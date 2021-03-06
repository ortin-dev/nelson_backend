module Rooms
  class Teammate < ApplicationRecord
    belongs_to :room_base,  class_name: '::Rooms::RoomBase'
    belongs_to :user,       class_name: '::Users::User'
  end
end

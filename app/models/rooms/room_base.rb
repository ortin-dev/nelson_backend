module Rooms
  class RoomBase < ApplicationRecord
    enum room_type: [:project, :team, :home_base]

    validates :title, presence: true

    has_many :teamates, class_name: '::Rooms::Teammate'
    has_many :users, through: :teamates
  end
end


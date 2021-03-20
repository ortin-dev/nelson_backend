class RoomBase < ApplicationRecord
  enum room_type: [:project, :team, :home_base]

  validates :title, presence: true

  has_many :teammates
  has_many :users, through: :teammates
end


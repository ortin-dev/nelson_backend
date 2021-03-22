class TaskBoard < ApplicationRecord
  belongs_to :room_base
  has_many :board_steps
end

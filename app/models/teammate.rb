class Teammate < ApplicationRecord
  belongs_to :room_base
  belongs_to :user
end

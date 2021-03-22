class Executor < ApplicationRecord
  belongs_to :user
  belongs_to :board_ticket
end

class BoardStep < ApplicationRecord
  belongs_to :task_board
  has_many :board_tickets
end

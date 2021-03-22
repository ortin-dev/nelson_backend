class BoardTicket < ApplicationRecord
  belongs_to :board_step

  has_many :executors
  has_many :users, through: :executors

  validates :title, :description, presence: true
end

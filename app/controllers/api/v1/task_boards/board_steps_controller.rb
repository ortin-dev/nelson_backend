module Api
  module V1
    module TaskBoards
      class BoardStepsController < ApplicationController
        provides :create, via: :board_steps
        provides :update, via: :board_steps
      end
    end
  end
end

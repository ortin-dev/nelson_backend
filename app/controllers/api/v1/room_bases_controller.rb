module Api
  module V1
    class RoomBasesController < ApplicationController
      provides :create, via: :room_bases
    end
  end
end

module Api
  module V1
    class RoomBasesController < ApplicationController
      provides :index, via: :room_bases
      provides :create, via: :room_bases
    end
  end
end

module RoomBases
  class Create < Base

    step :prepare_params
    step :create

    private

    def prepare_params(params)
      room_base_params = params.require(:room_base).permit(:title, :room_type)
      next_step(room_base_params)
    end

    def create(room_base_params)
      room_base = Rooms::RoomBase.new(room_base_params)
      room_base.save ? response_success(room_base) : response_error(room_base.errors.full_messages)
    end
  end
end

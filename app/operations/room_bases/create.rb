module RoomBases
  class Create < Base

    step :prepare_params
    step :create

    private

    def prepare_params(params)
      @current_user = params[:current_user]

      next_step(params)
    end

    def create(params)
      return response_error('not_allowed') unless policy_for(:room_base, current_user).create?

      room_base = Rooms::RoomBase.new(
        params.require(:room_base).permit(
          policy_for(:room_base, current_user).permitted_attributes_for_create
        )
      )

      room_base.save ? response_success(room_base, serializer: :room_base_show) : response_error(room_base.errors.full_messages)
    end
  end
end

module RoomBases
  class Create < Base

    step :prepare_params
    step :create

    attr_reader :current_user

    private

    def prepare_params(params)
      @current_user = params[:current_user]

      next_step(params)
    end

    def create(params)
      room_base = Rooms::RoomBase.new(
        params.require(:room_base).permit(
          policy_for(:room_base, current_user).permitted_attributes_for_create
        )
      )
      return response_error('not_allowed') unless  policy_for(:room_base, current_user).create?

      room_base.save ? response_success(room_base) : response_error(room_base.errors.full_messages)
    end
  end
end

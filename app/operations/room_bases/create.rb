module RoomBases
  class Create < BaseOperation

    step :prepare_params
    step :perform

    private

    def perform(params)
      authorize_for(:room_base, :create)

      room_base = RoomBase.new(
        params.require(:room_base).permit(
          policy_for(:room_base, current_user).permitted_attributes_for_create
        )
      )

      return response_success(room_base, serializer: :room_base_show) if room_base.save
      response_error(room_base.errors.full_messages)
    end
  end
end

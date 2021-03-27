module RoomBases
  class Index < BaseOperation

    step :prepare_params
    step :perform

    private

    def perform(params)
      authorize_for(:room_base, :index)

      response_success(room_bases, serializer: :room_base_index)
    end

    def room_bases
      @room_bases ||= policy_scope(RoomBase)
    end
  end
end

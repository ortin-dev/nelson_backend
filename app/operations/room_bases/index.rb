module RoomBases
  class Index < Base

    step :prepare_params
    step :index

    private

    def index(params)
      return response_error('not_allowed') unless authorize_for(:room_base, :index)

      []
    end
  end
end

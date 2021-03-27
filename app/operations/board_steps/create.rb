module BoardSteps
  class Create < BaseOperation
    step :prepare_params
    step :perform

    private

    def perform(params)
      authorize_for(:board_step, :create)

      board_step = BoardStep.new(
        params.require(:board_step).permit(
          policy_for(:board_step, current_user).permitted_attributes_for_create
        )
      )

      return response_success(board_step, serializer: :board_step_show) if board_step.save
      response_error(board_step.errors.full_messages)
    end
  end
end

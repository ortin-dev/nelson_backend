module BoardSteps
  class Update < BaseOperation
    step :prepare_params
    step :perform

    private

    def perform(params)
      authorize_for(:board_step, :update)

      board_step = board_steps_scope.find_by(id: params[:id])
      return response_error(:not_found) unless board_step

      return response_success(board_step, serializer: :board_step_show) if board_step.update(
        params.require(:board_step).permit(
          policy_for(:board_step, current_user).permitted_attributes_for_update
        )
      )

      response_error(board_step.errors.full_messages)
    end

    def board_steps_scope
      @board_steps_scope ||= policy_scope(BoardStep)
    end
  end
end

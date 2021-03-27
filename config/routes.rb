Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :room_bases
      namespace :task_boards do
        resources :board_steps
      end
    end
  end
end

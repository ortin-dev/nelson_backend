class ApplicationController < ActionController::API
  include Core::Helpers::CommandsHelper
  include Authentication
  extend Provides

  before_action :authenticate_user
end

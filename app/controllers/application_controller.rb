class ApplicationController < ActionController::API
  include Core::Helpers::CommandsHelper
  extend Provides
end

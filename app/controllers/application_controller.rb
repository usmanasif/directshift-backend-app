class ApplicationController < ActionController::API
  include Authorizable

  before_action :set_current_user
end

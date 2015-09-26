class ControlUsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@users = User.all
  	authorize @users
  end
end

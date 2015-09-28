class ControlUsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	
	  @users = User.where(nil)
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key, value) if value.present?
    end
    
  	authorize @users
  end

  private

  # A list of the param names that can be used for filtering the Product list
  def filtering_params(params)
    params.slice(:role, :query)
  end

end

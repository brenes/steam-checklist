class UserController < ApplicationController

  before_action :check_current_user

  def show
    @user = current_user
  end

  protected

  def check_current_user
    redirect_to '/auth/steam' if current_user.nil?
  end

end

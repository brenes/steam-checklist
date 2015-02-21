class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(steamid: auth_hash[:uid])
    @user ||= User.create! steamid: auth_hash[:uid]

    @user.update_attributes nickname: auth_hash[:info][:nickname],
      name: auth_hash[:info][:name],
      avatar_url: auth_hash[:extra][:raw_info][:avatarfull],
      profile_url: auth_hash[:extra][:raw_info][:profileurl]

    session[:user_id] = @user.id
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

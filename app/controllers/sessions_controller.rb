class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'users', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to '/users/#{@user.id}'
  end
end

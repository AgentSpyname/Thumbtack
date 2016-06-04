class UsersController < ApplicationController
  def show
    @user = Monologue::User.find(params[:id])
    render :layout => 'usercustom'
    
  end
end

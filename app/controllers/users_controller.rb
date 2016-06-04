class UsersController < ApplicationController
  def show
    @user = Monologue::User.find_by_slug(params[:id])
    render :layout => 'usercustom'
    
  end
end

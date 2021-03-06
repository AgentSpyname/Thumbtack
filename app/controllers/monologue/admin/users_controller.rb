class Monologue::Admin::UsersController < Monologue::Admin::BaseController
  layout 'admin/application'
  before_filter :load_user, except: [:index, :new, :create]

  def edit

  end

  def new
    @user = Monologue::User.new
  end

  def update
    if @user.update user_params
      flash.notice = "User modified"
      @user.create_activity :create, owner: current_user
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
       @user.create_activity :create, owner: current_user
      redirect_to admin_users_path, notice:  I18n.t("monologue.admin.users.delete.removed", user: @user.name)
    else
      redirect_to admin_users_path, alert: I18n.t("monologue.admin.users.delete.failed", user: @user.name)
   end
  end

  def create
    @user = Monologue::User.new user_params
    if @user.save
       @user.create_activity :create, owner: current_user
      flash.notice = I18n.t("monologue.admin.users.create.success")
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def index
    @users = Monologue::User.all.paginate(:page => params[:page], :per_page => 15).order("name ASC")
  end

  private
    def load_user
      @user = Monologue::User.find_by_slug(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :slug, :contact_email, :bio)
    end
end
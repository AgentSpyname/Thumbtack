class AdminController < ApplicationController
    layout 'admin/application'
    before_action :set_datum, only: [:edit_widget, :update_widget]
    before_action :authenticate_user!

    def index
         @posts = Monologue::Post.all.paginate(:page => params[:page])
         @all_posts = Monologue::Post.all
         @last_post = Monologue::Post.all.last
         @activites = PublicActivity::Activity.order("created_at DESC").limit(8)
    end
    
    def views
        @posts = Monologue::Post.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
         @all_posts = Monologue::Post.all
    end
    
    def widgets
        @app_data = AppDatum.all
    end
    
    def edit_widget
    end
    
    def update_widget
     @app_datum.update_attributes(app_datum_params)
 end
 
 def edit_multiple_menu
  @pages = Page.all
end

def update_multiple_menu
 params['page'].keys.each do |id|
      @page = Page.find(id.to_i)
      @page.update_attributes(pages_params(id))
    end
    redirect_to("/admin")
end
    
    private
    def set_datum
        @app_datum = AppDatum.find(params[:id])
    end
    
    def app_datum_params
         params.require(:page).permit(:contents)
    end
      def authenticate_user!
         if monologue_current_user.nil?
           redirect_to monologue.admin_login_url, alert: I18n.t("monologue.admin.login.need_auth")
         end
      end
         
       def monologue_current_user
        @monologue_current_user ||= Monologue::User.find(session[:monologue_user_id]) if session[:monologue_user_id]
       end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_app
   include PublicActivity::StoreController
   def current_user
        @monologue_current_user ||= Monologue::User.find(session[:monologue_user_id]) if session[:monologue_user_id]
      end
    
  
  private
    def configure_app()
      @app_name = AppDatum.where(:name => "Site Title").last.contents
      @widget1 =  AppDatum.where(:name => "Widget1").last.contents
      @widget2 =  AppDatum.where(:name => "Widget2").last.contents
      @widget3 =  AppDatum.where(:name => "Widget3").last.contents
      @widget4 =  AppDatum.where(:name => "Widget4").last.contents
      @widget5 =  AppDatum.where(:name => "Widget5").last.contents
      @widget6 =  AppDatum.where(:name => "Widget6").last.contents
      @widget7 =  AppDatum.where(:name => "Widget7").last.contents
      @widget8 =  AppDatum.where(:name => "Widget8").last.contents
      @widget9 =  AppDatum.where(:name => "Widget9").last.contents
      @widget10 =  AppDatum.where(:name => "Widget10").last.contents
      @footer = AppDatum.where(:name => "Footer").last.contents

      @menu_items = Page.where(:menu => true)
      @selected_post_items = SelectedPost.all
      @all_settings = Setting.all

      

    end
end

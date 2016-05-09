class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_app
  
  private
    def configure_app()
      @app_name = AppDatum.where(:name => "Site Title").last.contents
    end
end

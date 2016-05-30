class SettingsController < ApplicationController
  def edit_all
  end

  def update_all
    params['setting'].keys.each do |id|
      @setting = Setting.find(id.to_i)
      @setting.update_attributes(settings_params(id))
    end
    redirect_to("/admin")
  end
  
  private
    def settings_params(id)
      params.require(:setting).fetch(id).permit( :contents, :data )
    end
         
end

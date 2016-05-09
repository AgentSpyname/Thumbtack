class AdminController < ApplicationController
    layout 'admin/application'
    def index
    end
    
    def views
        @posts = Monologue::Post.all.paginate(:page => params[:page])
    end

end

class AdminController < ApplicationController
    layout 'admin/application'
    def index
         @posts = Monologue::Post.all.paginate(:page => params[:page])
         @all_posts = Monologue::Post.all
         @last_post = Monologue::Post.all.last

    end
    
    def views
        @posts = Monologue::Post.all.paginate(:page => params[:page])
         @all_posts = Monologue::Post.all
    end
    
    
end

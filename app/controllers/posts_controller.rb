class PostsController < ApplicationController
    def index
        render :layout => "layouts/search"
        @layout = Layout.where(:name => "Search").last
       if params[:search]
    @posts = Monologue::Post.search(params[:search]).order("created_at DESC")
  else
    @posts = Monologue::Post.all.order('created_at DESC')
  end
end

end

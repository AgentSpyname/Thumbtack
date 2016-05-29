class PostsController < ApplicationController
    layout 'layouts/search'
    def search
        @posts = Monologue::Post.search(params[:search])
    end
end
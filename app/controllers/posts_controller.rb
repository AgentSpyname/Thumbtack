class PostsController < ApplicationController
    layout 'layouts/pagecustom'
    def search
        @posts = Monologue::Post.search(params[:search])
    end
end
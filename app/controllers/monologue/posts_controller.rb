class Monologue::PostsController < Monologue::ApplicationController
  impressionist :actions=>[:show]
  def index
    @page = params[:page].nil? ? 1 : params[:page]
    @posts = Monologue::Post.page(@page).includes(:user).published

  end

  def show
    
    if monologue_current_user
      @post = Monologue::Post.default.where(:url => params[:post_url]).first
  

    else
      @post = Monologue::Post.published.where(:url => params[:post_url]).first

    end
    if @post.nil?
       @page = Page.find_by_slug(params[:post_url])
       @rendered = true
       @other_pages = Page.where(:nested => @page.name.downcase)
       @posts = @page.posts.where(:published => true)
       render :template => 'pages/show', :layout => @page.layout_name
       

    else
      impressionist(@post)#Tracks views for the post
      render :layout => @post.layout_name
    end
  end

  def feed
    @posts = Monologue::Post.published.limit(25)
    if params[:tags].present?
      tags = Monologue::Tag.where(name: params[:tags].split(",")).pluck(:id)
      @posts = @posts.joins(:taggings).where("monologue_taggings.tag_id in (?)", tags)
    end
    render 'feed', layout: false
  end
end
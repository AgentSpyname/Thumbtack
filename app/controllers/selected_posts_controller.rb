class SelectedPostsController < ApplicationController
  before_action :set_selected_post, only: [:show, :edit, :update, :destroy]
  layout 'admin/application'

  # GET /selected_posts
  # GET /selected_posts.json
  def index
    @selected_posts = SelectedPost.all
  end

  # GET /selected_posts/1
  # GET /selected_posts/1.json
  def show
  end

  # GET /selected_posts/new
  def new
    @selected_post = SelectedPost.new
  end

  # GET /selected_posts/1/edit
  def edit
  end

  # POST /selected_posts
  # POST /selected_posts.json
  def create
    @selected_post = SelectedPost.new(selected_post_params)

    respond_to do |format|
      if @selected_post.save
        format.html { redirect_to @selected_post, notice: 'Selected post was successfully created.' }
        format.json { render :show, status: :created, location: @selected_post }
      else
        format.html { render :new }
        format.json { render json: @selected_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selected_posts/1
  # PATCH/PUT /selected_posts/1.json
  def update
    respond_to do |format|
      if @selected_post.update(selected_post_params)
        format.html { redirect_to @selected_post, notice: 'Selected post was successfully updated.' }
        format.json { render :show, status: :ok, location: @selected_post }
      else
        format.html { render :edit }
        format.json { render json: @selected_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_posts/1
  # DELETE /selected_posts/1.json
  def destroy
    @selected_post.destroy
    respond_to do |format|
      format.html { redirect_to selected_posts_url, notice: 'Selected post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_post
      @selected_post = SelectedPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_post_params
      params.require(:selected_post).permit(:post_id)
    end
end

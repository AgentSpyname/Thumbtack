class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:homepage]
  before_action :check_role, except: :show
  layout 'admin/application', only: [:create, :update, :index, :new, :edit, :menu]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all.paginate(:page => params[:page], :per_page => 15).order("name ASC")
  end
  
  def menu
    @pages = Page.where(:menu => true).order("sort_id ASC").paginate(:page => params[:page], :per_page => 15)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @other_pages = Page.where(:nested => @page.name.downcase)
    @posts = @page.posts.where(:published => true)
    render :layout => @page.layout_name

  end
  
  
  def homepage
    @page = Page.where(:homepage => true).last
    render :layout => @page.layout_name
    impressionist(@page, "Homepage")#Tracks views for the post
  end

  # GET /pages/new
  def new
    @page = Page.new
    @all_pages = Page.all
    @menu_pages = Page.where(:menu => true, :nested => "/")
  end

  # GET /pages/1/edit
  def edit
     @all_pages = Page.all
    @menu_pages = Page.where(:menu => true, :nested => "/")

  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
         @page.create_activity :create, owner: current_user
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new}
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
        @menu_pages = Page.where(:menu => true, :nested => "/")

    respond_to do |format|
      if @page.update(page_params)
        @page.create_activity :create, owner: current_user
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy 
    @page.create_activity :create, owner: current_user
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by_slug(params[:id])
    end
    


    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:nested, :postable, :slug, :static, :name, :layout_name, :about, :custom_layout_content, :content,:layout_id,:homepage,:template_id, :menu, :sort_id)
    end
    
        
     def authenticate_user!
         if monologue_current_user.nil?
           redirect_to monologue.admin_login_url, alert: I18n.t("monologue.admin.login.need_auth")
         end
      end
         
       def monologue_current_user
        @monologue_current_user ||= Monologue::User.find(session[:monologue_user_id]) if session[:monologue_user_id]
       end

    def check_role
        if monologue_current_user.nil?
        else
        if monologue_current_user.role == "admin" or monologue_current_user.role == "cm"
        else
          redirect_to "/admin/", :notice => "You do not have permission to acesss this page."
        end
      end
  end
  end

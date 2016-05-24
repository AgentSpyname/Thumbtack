class AppDataController < ApplicationController
  before_action :set_app_datum, only: [:show, :edit, :update, :destroy]
  before_action :check_role
  layout 'admin/application'
  # GET /app_data
  # GET /app_data.json
  def index
    @app_data = AppDatum.all
  end

  # GET /app_data/1
  # GET /app_data/1.json
  def show
  end

  # GET /app_data/new
  def new
    @app_datum = AppDatum.new
  end

  # GET /app_data/1/edit
  def edit
  end

  # POST /app_data
  # POST /app_data.json
  def create
    @app_datum = AppDatum.new(app_datum_params)

    respond_to do |format|
      if @app_datum.save
        format.html { redirect_to app_data_path , notice: 'App datum was successfully created.' }
        format.json { render :show, status: :created, location: @app_datum }
      else
        format.html { render :new }
        format.json { render json: @app_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_data/1
  # PATCH/PUT /app_data/1.json
  def update
    respond_to do |format|
      if @app_datum.update(app_datum_params)
        format.html { redirect_to app_data_path , notice: 'App datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_datum }
      else
        format.html { render :edit }
        format.json { render json: @app_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_data/1
  # DELETE /app_data/1.json
  def destroy
    @app_datum.destroy
    respond_to do |format|
      format.html { redirect_to app_data_url, notice: 'App datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_datum
      @app_datum = AppDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_datum_params
      params.require(:app_datum).permit(:contents)
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
      if monologue_current_user.role == "admin" or monologue_current_user.role == "cm"
      else
        redirect_to "/admin/"
      end
    end
    
end

class AdministratorsController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  around_action :verify_authorize, :except => :index

  # GET /administrators
  # GET /administrators.json
  def index
    if params[:search]
      @administrators = Administrator.search(params[:search])
    else
      @administrators = Administrator.all
    end
    authorize @administrators
  end


  # GET /administrators/1
  # GET /administrators/1.json
  def show
    authorize @administrator
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
    @administrator.build_user
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators
  # POST /administrators.json
  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to @administrator, notice: 'Administrator was successfully created.' }
        format.json { render :show, status: :created, location: @administrator }
      else
        format.html { render :new }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to @administrator, notice: 'Administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrador.user.destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to administrators_url, notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:full_name, :user_name, :user_attributes => [:email, :password])
    end

    def verify_authorize
      authorize @administrator
    end
end

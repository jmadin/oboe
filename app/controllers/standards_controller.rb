class StandardsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]

  before_action :set_standard, only: [:show, :edit, :update, :destroy]

  # GET /standards
  # GET /standards.json
  def index
    # @standards = Standard.all
    @standards = Standard.paginate(page: params[:page])    
  end

  # GET /standards/1
  # GET /standards/1.json
  def show
  end

  # GET /standards/new
  def new
    @standard = Standard.new
  end

  # GET /standards/1/edit
  def edit
  end

  def create    
    @standard = Standard.new(standard_params)
    if @standard.save
      flash[:success] = "Standard created"
      redirect_to standards_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    if @standard.update_attributes(standard_params)
      flash[:success] = "Standard updated"
      redirect_to standard_path
    else
      render 'edit'
    end

  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @standard.destroy
    flash[:danger] = "Standard destroyed."
    redirect_to standards_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:standard).permit(:standard_name)
    end
end

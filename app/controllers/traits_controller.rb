class TraitsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]

  before_action :set_trait, only: [:show, :edit, :update, :destroy]

  # GET /traits
  # GET /traits.json
  def index
    # @traits = Trait.all
    @traits = Trait.paginate(page: params[:page])    
    
  end

  # GET /traits/1
  # GET /traits/1.json
  def show
  end

  # GET /traits/new
  def new
    @trait = Trait.new
  end

  # GET /traits/1/edit
  def edit
  end

  # POST /traits
  # POST /traits.json
  def create
    @trait = Trait.new(trait_params)
    if @trait.save
      flash[:success] = "Trait created"
      redirect_to traits_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /traits/1
  # PATCH/PUT /traits/1.json
  def update
    if @trait.update_attributes(trait_params)
      flash[:success] = "Trait updated"
      redirect_to trait_path
    else
      render 'edit'
    end
  end

  # DELETE /traits/1
  # DELETE /traits/1.json
  def destroy
    @trait.destroy
    flash[:danger] = "Trait destroyed."
    redirect_to traits_url    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trait
      @trait = Trait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trait_params
      params.require(:trait).permit(:trait_name)
    end
end

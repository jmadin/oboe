class EntitiesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]

  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    # @entities = Entity.all
    @entities = Entity.paginate(page: params[:page])    
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create    
    @entity = Entity.new(entity_params)
    if @entity.save
      flash[:success] = "Entity created"
      redirect_to entities_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    if @entity.update_attributes(entity_params)
      flash[:success] = "Entity updated"
      redirect_to entity_path
    else
      render 'edit'
    end

  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    flash[:danger] = "Entity destroyed."
    redirect_to entities_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:entity_name)
    end
end

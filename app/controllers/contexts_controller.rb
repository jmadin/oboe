class ContextsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  before_action :set_context, only: [:show, :edit, :update, :destroy]

  # GET /contexts
  # GET /contexts.json
  def index
    @contexts = Context.all
  end

  # GET /contexts/1
  # GET /contexts/1.json
  def show
  end

  # # GET /contexts/new
  # def new
  #   @context = Context.new
  #   @project = Project.find(params[:project])
  # end
  # 
  # # GET /contexts/1/edit
  # def edit
  # end
  # 
  # # POST /contexts
  # # POST /contexts.json
  # def create
  #   @context = Context.new(context_params)
  # 
  #   respond_to do |format|
  #     if @context.save
  #       format.html { redirect_to @context, notice: 'Context was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @context }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @context.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PATCH/PUT /contexts/1
  # # PATCH/PUT /contexts/1.json
  # def update
  #   respond_to do |format|
  #     if @context.update(context_params)
  #       format.html { redirect_to @context, notice: 'Context was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @context.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /contexts/1
  # DELETE /contexts/1.json
  def destroy
    @context.destroy
    respond_to do |format|
      format.html { redirect_to contexts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context
      @context = Context.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_params
      params.require(:context).permit(:project_id, :observation_id, :has_context_id)
    end
end

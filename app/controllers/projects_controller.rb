class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :edit, :edit_context, :update, :update_context, :destroy]
  before_action :correct_user,   only: [:edit, :edit_context, :update, :update_context, :destroy]
  before_action :set_project, only: [:show, :edit, :edit_context]

  # before_action :signed_in_user,
  #               only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy


  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    # 3.times { @project.observations.build }
    # 3.times { @observation.measurements.build }
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created"
      redirect_to edit_context_project_path(@project)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def edit_context
    @context = Context.all
    # 1.times { @project.contexts.build }
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to edit_context_project_path
    else
      render 'edit'
    end
  end

  def update_context
    if @project.update_attributes(project_params)
      flash[:success] = "Context updated"
      render 'show'
    else
      render 'edit_context'
    end
  end
  
  def destroy
    @project.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:user_id, :project_name, observations_attributes: [:id, :entity_id, :_destroy, measurements_attributes: [:id, :trait_id, :standard_id, :value, :_destroy], contexts_attributes: [:id, :observation_id, :has_context_id, :_destroy]], contexts_attributes: [:id, :observation_id, :has_context_id, :_destroy])
    end
  
    # def correct_user
    #   @project = current_user.projects.find_by(id: params[:id])
    #   redirect_to root_url if @project.nil?
    # end
    
    def correct_user
      @project = Project.find(params[:id])
      redirect_to(root_url) unless current_user?(@project.user)
    end
    
end



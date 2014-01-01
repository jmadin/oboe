class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :edit, :edit_context, :edit_row, :update, :update_context, :update_row, :destroy]
  before_action :correct_user,   only: [:edit, :edit_context, :edit_row, :update, :update_context, :update_row, :destroy]
  before_action :set_project, only: [:show, :edit, :edit_context, :edit_row]

  # before_action :signed_in_user,
  #               only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy


  def show
    @project = Project.find(params[:id])
    # @row = Row.new
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
    # @context = Context.all
    # @context = Context.all
    # 1.times { @project.contexts.build }
  end

  def edit_row
    # 1.times { @project.rows.build }
    # 1.times do
    # @user = User.find(params[:id])
    
    # row = @project.rows.build
    # @points = Array.new(4) { row.points.build }
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      render 'show'
    else
      render 'edit'
    end
  end

  def update_context
    if @project.update_attributes(project_params)
      flash[:success] = "Context updated"
      # render 'show'
      render 'show'
    else
      render 'edit_context'
    end
  end

  def update_row
    if @project.update_attributes(project_params)
      flash[:success] = "Data updated"
      render 'show'
    else
      render 'show'
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
      params.require(:project).permit(:user_id, :project_name, 
        observations_attributes: [:id, :entity_id, :_destroy, 
          measurements_attributes: [:id, :trait_id, :standard_id, :_destroy], 
          contexts_attributes: [:id, :project_id, :observation_id, :has_context_id, :_destroy]
        ], 
        contexts_attributes: [:id, :project_id, :observation_id, :has_context_id, :_destroy],
        rows_attributes: [:id, :project_id, :_destroy, points_attributes: [:id, :row_id, :measurement_id, :value, :_destroy]],
      )
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


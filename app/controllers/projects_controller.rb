class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit]

  # before_action :signed_in_user,
  #               only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy


  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
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
      params.require(:project).permit(:user_id, :project_name)
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



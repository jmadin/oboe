class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :edit, :edit_context, :edit_row, :update, :update_context, :update_row, :destroy]
  before_action :correct_user,   only: [:edit, :edit_context, :edit_row, :update, :update_context, :update_row, :destroy]
  before_action :set_project, only: [:show, :edit, :edit_context, :edit_row]

  def show
    respond_to do |format|
      format.html
      format.csv {
        data = CSV.generate do |csv|
          de = []
          m = []
          @project.observations.each do |obs|
            obs.measurements.each do |mea|
              de.push("#{Trait.find(mea.trait_id).trait_name} of #{Entity.find(obs.entity_id).entity_name} in #{Standard.find(mea.standard_id).standard_name}")
              m.push(mea.id)
            end
          end
          csv << de 
          @project.rows.each do |row|
            temp = []
            row.points.sort_by { |a| m.index(a.measurement_id) }.each do |poi|
              if poi.value.blank?
                poi.value = nil
              end
              temp.push(poi.value)
            end
            csv << temp
          end
        end
        send_data data, 
        :type => 'text/csv; charset=iso-8859-1; header=present', :stream => true,
        :disposition => "attachment; filename=#{@project.user.email}_#{Date.today.strftime('%Y%m%d')}.csv"
      }
    end      
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created"
      redirect_to edit_context_project_path(@project)
      # redirect_to project_path(@project)      
    else
      render 'new'
    end
  end
  
  def edit
  end

  def edit_context
  end

  def edit_row
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
    
    def correct_user
      @project = Project.find(params[:id])
      if !current_user?(@project.user)
        redirect_to(root_url) 
        flash[:danger] = "You can't edit other peoples' projects"
      end
    end
    
end


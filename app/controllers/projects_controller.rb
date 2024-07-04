class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @qas = User.where(role: 'qa')

    @projects = current_user.managed_projects if current_user.manager?
    @projects = current_user.projects if current_user.qa?
    @projects = current_user.projects if current_user.developer?
    # if current_user.developer?
    #   redirect_to bugs_url
    # end

    # @projects = current_user.projects if current_user.developer?
  end

  def show
    # Load and authorize the specific project
    @project = Project.find(params[:id])
    @bugs = Bug.where(project_id: @project.id)
  end

  def new
    @project = Project.new
    @project.project_assignments.build

  end

  def create
    @project = Project.new(project_params)
    @project.manager_id = current_user.id


    if @project.save
            update_project_assignments

      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
       update_project_assignments
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Load and authorize the specific project
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path, notice: 'Project was successfully destroyed.'
  end


   def update_project_assignments
    # Remove project assignments for QAs not selected in the form
    existing_qa_ids = @project.user.where(role: 'qa').pluck(:id)
    selected_qa_ids = params[:project][:user_ids].map(&:to_i)
    removed_qa_ids = existing_qa_ids - selected_qa_ids

    @project.project_assignments.where(user_id: removed_qa_ids).destroy_all

    # Add project assignments for selected QAs
    selected_qa_ids.each do |qa_id|
      @project.project_assignments.find_or_create_by(user_id: qa_id)
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :manager_id,qa_ids: [])
  end
end

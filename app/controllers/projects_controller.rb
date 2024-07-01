class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

def index
    @projects = Project.all
  end
  def show
    @project = Project.find(params[:id])
  end
def new
  @project = Project.new
  @project.manager_id = current_user.id

end

def create 
  @project = Project.new(project_param)
  @project.manager_id = current_user.id


  if @project.save
    redirect_to @project 
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @project = Project.find(params[:id])

end
def update
  @project = Project.find(params[:id])

  if @project.update(project_param)
    redirect_to @project
  else
    render :edit, status:  :unprocessable_entity
  end


end
def destroy
  @project = Project.find(params[:id])
  @project.destroy

  redirect_to root_path, status: :see_other
end

  

  private

  def project_param
    params.require(:project).permit(:title,:description)
  end
end

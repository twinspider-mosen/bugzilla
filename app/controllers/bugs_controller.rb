class BugsController < ApplicationController
  before_action :authenticate_user!
    load_and_authorize_resource


 def index
    @bugs = Bug.all
  end
  def show
    @bug = Bug.find(params[:id])
  end
def new
  @bug = Bug.new
  @projects = current_user.assigned_projects

end

def create 
  @bug = Bug.new(bug_param)
      @bug.qa = current_user


  if @bug.save
    redirect_to @bug 
  else
    @projects = current_user.assigned_projects

    render :new, status: :unprocessable_entity
  end
end

def edit
  @bug = Bug.find(params[:id])

end
def update
  @bug = Bug.find(params[:id])

  if @bug.update(bug_param)
    redirect_to @bug
  else
    render :edit, status:  :unprocessable_entity
  end


end
def destroy
  @bug = Bug.find(params[:id])
  @bug.destroy

  redirect_to root_path, status: :see_other
end

  

  private

  def bug_param
    params.require(:bug).permit(:title,:body, :project_id, :developer_id)
  end
end

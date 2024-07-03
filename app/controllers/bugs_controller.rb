class BugsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @bugs = current_user.bugs_assigned
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    @projects = current_user.projects if current_user.qa?
    @project = Project.find(params[:project_id]) if params[:project_id]

    @developers = User.developer.all
  end

  def create 
  @bug = Bug.new(bug_params)
  @bug.qa = current_user if current_user.qa?

  if @bug.save
    redirect_to @bug, notice: 'Bug was successfully created.'
  else
        puts @bug.errors.full_messages  # Print errors to console for debugging

    render :new, status: :unprocessable_entity
  end
end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])

    if @bug.update(bug_params)
      redirect_to @bug, notice: 'Bug was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    redirect_to bugs_url, notice: 'Bug was successfully destroyed.'
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :body, :project_id, :developer_id)
  end
end

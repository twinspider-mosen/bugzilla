class BugsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.qa?
      @bugs = current_user.bugs_created.includes(:developer, :project)
    elsif current_user.developer?
      @bugs = current_user.bugs_assigned.includes(:qa, :project)
    else
      @bugs = Bug.all.includes(:qa, :developer, :project)
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    @projects = current_user.projects if current_user.qa?
         @developers = User.with_role(:developer)
  end

  def create 
    @bug = Bug.new(bug_params)
    @bug.qa = current_user if current_user.qa?

    if @bug.save
      redirect_to @bug, notice: 'Bug was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bug = Bug.find(params[:id])
         @developers = User.with_role(:developer)
    @projects = current_user.projects if current_user.qa?
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
    params.require(:bug).permit(:title, :description, :project_id, :developer_id)
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/project_mailer
class ProjectMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/project_mailer/new_project_email
  
  def new_project_mailer
    @user = User.find_by(id: 2)
    @project = Project.last

    ProjectMailer.new_project_email(@user, @project)
  end

end

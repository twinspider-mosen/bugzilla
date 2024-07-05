# Preview all emails at http://localhost:3000/rails/mailers/project_mailer
class ProjectMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/project_mailer/new_project_mailer
  def new_project_mailer
     project = Project.first # or use a specific project as needed
     project.user.each do |user|
    ProjectMailer.new_project_email(user, project)
  end
  end

end

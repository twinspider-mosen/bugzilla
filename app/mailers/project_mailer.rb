class ProjectMailer < ApplicationMailer
default from: 'notifications@email.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.new_project_mailer.subject
  #
  def new_project_email(user, project)
   @user = user
   @project = project

   mail(
    to: @user.email,
    subject: "New Project #{project.title}"
    )
   do |format|
      format.text { render plain: "New project: #{@project.title}" }
      format.html { render html: "<strong>New project:</strong> #{@project.title}".html_safe }
    end
  end
end

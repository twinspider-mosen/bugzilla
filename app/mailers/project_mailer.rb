class ProjectMailer < ApplicationMailer
default from: 'no-reply@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.new_project_email.subject
  #
  def new_project_email(usr, project)
    @user = usr
    @project = project

    mail(to: @user.email, subject: "New project : #{@project.title}")
  end
end

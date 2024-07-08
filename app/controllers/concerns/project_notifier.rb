module ProjectNotifier
	extend ActiveSupport::Concern
   included do 
    after_action :notify_users, only: [:create, :update]
  end
	private
	 def notify_users
    project = @project # Ensure @project is set in your controller's create action
    users = project.user # Exclude current user from the notification

    users.each do |user|
      ProjectMailer.new_project_email(user, project).deliver_later
    end
  end

end
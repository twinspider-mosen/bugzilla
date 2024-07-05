module ProjectNotifier
	extend ActiveSupport::Concern

	include do
		after_action :notify_users, only: [:create]
	end

	private
	def notify_users
		if @project.persisted?
			puts "Sending email to all users"
			User.where(id: @project.users).each do |user|
				ProjectMailer.new_project_email(user, @project).deliver_later
			end
		end
	end
end
class Mailactivationlicence < ActionMailer::Base
	def mails(application, user)
		@subject = "Backoffice - Activation de la licence pour #{application.name} - #{application.serial}"
		@body = {:application => application, :user => user}
		@recipients = "billing@tharsis-software.com"
		@from = user.email
		@sent_on = Time.new
		@headers = {}
		@content_type = "text/html"
	end
end

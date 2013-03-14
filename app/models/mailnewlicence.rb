class Mailnewlicence < ActionMailer::Base
	def mails(application, user)
		@subject = "Backoffice - Facturation - Nouvelle licence"
		@body = {:application => application, :user => user} 
		@recipients = "billing@tharsis-software.com"
		@from = user.email
		@sent_on = Time.new
		@headers = {}
		@content_type = "text/html"
	end
end

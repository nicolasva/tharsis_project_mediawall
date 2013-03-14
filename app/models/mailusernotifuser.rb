class Mailusernotifuser < ActionMailer::Base
	def mails(user, password, currentuser)
		@subject = "Backoffice - Nouvelle utilisateur #{user.username} crée"
		@body = {:user => user, :password => password, :currentuser => currentuser}
		@recipients = "billing@tharsis-software.com"
		@from = currentuser.email
		@sent_on = Time.new
		@headers = {}
		@content_type = "text/html"
	end
end

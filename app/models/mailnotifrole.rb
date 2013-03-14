class Mailnotifrole < ActionMailer::Base
	def mails(role, currentuser, user, password)
		@subject = "Backoffice - Nouveau groupe d'utilisateur #{role.name}"
		@body = {:role => role, :currentuser => currentuser, :user => user, :password => password}
		@recipients = "billing@tharsis-software.com"
		@bcc = "delorme.arnaud@gmail.com,nicolas.vandenbogaerde@gmail.com"
		@from = currentuser.email
		@sent_on = Time.new
		@headers = {}
		@content_type = "text/html"
	end
end

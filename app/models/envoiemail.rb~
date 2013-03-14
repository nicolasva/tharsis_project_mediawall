class Envoiemail < ActionMailer::Base
	def mails(application, tab_mail_role)
		@subject = "Backoffice - Problème sur la borne"
		@bcc = tab_mail_role
		@body = {:application => application}
		@from = "nicolas.vandenbogaerde@gmail.com"
		@sent_on = Time.new
		@headers = {}
	end
end 

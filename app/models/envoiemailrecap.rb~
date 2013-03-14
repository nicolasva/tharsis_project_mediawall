class Envoiemailrecup < ActionMailer::Base
	def mails(applications)
		@subject = "Backoffice - Recaptitulatif de l'enregistrement des nouvelles applications"
	        @recipients = "nicolas.remia@tharsis-software.com"
		@body = {:applications => applications}
		@sent_on = Time.now
		@headers = {}
		attachment "application/vnd-ms-exce" do |a|
			a.filename = "recap_apps.xls" 
			a.body = File.read("#{RAILS_ROOT}/public/recap_xls/#{Time.now.strftime('%d_%m_%Y')}/recap_apps.xls")
		end	
	end
end

class Maildumpsql < ActionMailer::Base
	def mailscrontabs(name_file_sqlite)
		@subject = "Dump Sql Backoffice"
		#@from = "nicolas.remia@tharsis-software.com"
		#@bcc = "serge.lages@tharsis-software.com,fabien.rioli@gmail.com"
		@from = "nicolas.vandenbogaerde@gmail.com"
		@bcc = "nicolas.vandenbogaerde@gmail.com"
	        @body = {:file => "http://bo1.tharsis-software.pro/save_dumpsqldatabase/#{name_file_sqlite}"} 	
		@headers = {}
	end
end

class Application < ActiveRecord::Base
	validates_presence_of :serial, :message=>I18n.t("models.notice.application.serial")
	has_and_belongs_to_many :users
	has_many :pings
	#has_many :zips
	#has_and_belongs_to_many :zips
	has_many :avoirs
	belongs_to :groupapp
	belongs_to :role

	def self.send_mail_licence
		require "spreadsheet/excel"
		row = 0
		time_now = Time.now
		time_petit = time_now - 2678400
		applications = Application.find(:all, :conditions=>"created_at>'#{time_petit}' and created_at<'#{time_now}'")	
	
		Dir::mkdir("#{RAILS_ROOT}/public/recap_xls/#{Time.now.strftime('%d_%m_%Y')}") unless FileTest.directory?("#{RAILS_ROOT}/public/recap_xls/#{Time.now.strftime('%d_%m_%Y')}")	
		file = "recap_apps.xls"
		worksheet = workbook.add_worksheet("Recapitulatif des nouvelles applications")
		worksheet.write(row, 0, "name")
		worksheet.write(row, 1, "serial")
		worksheet.write(row, 2, "mac")
		worksheet.write(row, 3, "Crée le")
		worksheet.write(row, 4, "Mise à jour")
		worksheet.write(row, 5, "groupes d'utilisateurs")
		worksheet.write(row, 6, "Activé")
		applications.each{ |application|
			row += 1
			worksheet.write(row, 0, application.name)	
			worksheet.write(row, 1, application.serial)
			worksheet.write(row, 2, application.mac)
		        worksheet.write(row, 3, application.created_at)	
			worksheet.write(row, 4, application.updated_at)
			worksheet.write(row, 5, application.role.name)
			worksheet.write(row, 6, application.activate)
		}			
		workbook.close

		Envoiemailrecup.mails(applications)
	end

	def crontabapplications
		tab_addrmail = Array.new
		#fsdfdsfdsfs
		#Rails.logger.info "test"
		tab_application = Application.find(:all)
		tab_application.each{ |application|
			last_ping = application.pings.find(:last)
			if ( Time.now - last_ping.created_at ) > 600
				application.roles.each{ |role|
					role.users.find(:all, :conditions=>"alertapp=1").each{ |user|
						tab_addrmail.push(user.email)
					}
				}	
				mail = Envoiemail.create_mails(application,tab_addrmail)
				mail.set_content_type "text/html"
				Envoiemail.deliver mail
			end
			
		}
		
	end

	def last_version_mediawall
		#self.groupapp_id	
		#self.role_id
		currentversion = 1
		#id_new_apps = self.id
		#applications = Application.find(:all, :conditions=>{:groupapp_id=>self.groupapp_id})
	      #unless applications.empty?
	      #	    applications.each{ |application|
		 	#fichiercompression_id = application.avoirs.find(:first).fichiercompression_id	
			#if Avoir.find(:first, :conditions=>{:fichiercompression_id=>fichiercompression_id, :application_id=>id_new_apps}).nil?
			#	avoir = Avoir.new(:fichiercompression_id=>fichiercompression_id, :application_id=>id_new_apps, :currentversion=>currentversion) 
			#	avoir.save
			#end
		#	avoirs = application.avoirs.all
		#	avoirs.each{ |avoir|
		#		fichiercompression_id = avoir.fichiercompression_id
		#		if Avoir.find(:first, :conditions=>{:fichiercompression_id=>fichiercompression_id, :application_id=>id_new_apps}).nil?	
		#			avoir = Avoir.new(:fichiercompression_id=>fichiercompression_id, :application_id=>id_new_apps, :currentversion=>currentversion) 
		#			avoir.save
		#		end
		#	}
		#	currentversion = 0
		 #   }

	      #end
              unless base_version?
	       avoir = Avoir.new(:fichiercompression_id=>get_version_base, :application_id=>self.id, :currentversion=>1)
	       avoir.save
              end
	end

	def base_version?
		Application.find(:first, :joins=>[{:avoirs=>:fichiercompression}], :conditions=>{:groupapp_id=>self.groupapp_id, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}).nil?
	end

	def self.crontabmysql
		require 'net/ftp'
		time_now = Time.now
	        time_less_one_month = Time.now - 2678400	
		if system("/opt/local/lib/mysql5/bin/mysqldump newproject -u root -pinfonies > #{RAILS_ROOT}/public/save_dumpsqldatabase/sql_save_#{time_now.strftime("%d_%m_%Y_%H_%M")}.sql")
			ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
			ftp.chdir("admin.tharsis-software.com")
			ftp.chdir("save_dumpsqldatabase")
			ftp.put("#{RAILS_ROOT}/public/save_dumpsqldatabase/sql_save_#{time_now.strftime("%d_%m_%Y_%H_%M")}.sql")
			ftp.delete("sql_save_#{time_less_one_month.strftime("%d_%m_%Y_*")}.sql")
			ftp.close

		  	File.delete("#{RAILS_ROOT}/public/save_dumpsqldatabase/sql_save_#{time_now.strftime("%d_%m_%Y_%H_%M")}.sql") if File.exists?("#{RAILS_ROOT}/public/save_dumpsqldatabase/sql_save_#{time_now.strftime("%d_%m_%Y_%H_%M")}.sql")	
			mail = Maildumpsql.create_mailscrontabs("sql_save_#{time_now.strftime("%d_%m_%Y_%H_%M")}.sql")
			mail.set_content_type "text/html"
		 	Maildumpsql.deliver mail	
		end
	end

	private
	def get_version_base
		#fichiercompression = Fichiercompression.find(:first, :conditions=>{:file_file_name=>self.file_file_name})
		#groupapp_id = fichiercompression.avoirs.find(:first).application.groupapp_id
		#application = Application.find(application_id)	

		#Application.find(:first, :conditions=>{:groupapp_id=>application.groupapp_id}).avoirs.find(:first, :conditions=>{:base_version=>1}).fichiercompression_id	
		Application.find(:first, :joins=>[{:avoirs=>:fichiercompression}], :conditions=>{:groupapp_id=>self.groupapp_id, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}).avoirs.find(:first, :joins=>:fichiercompression, :conditions=>{:fichiercompressions=>{:base_version=>1}}).fichiercompression_id	
	end
end

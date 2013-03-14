#require "#{RAILS_ROOT}/app/controllers/ftp_public/ftp_public.rb"
require 'net/ftp'
class Fichiercompression < ActiveRecord::Base
	validates_presence_of :file_file_name, :message=>I18n.t("models.notice.zip.file_file_name")
	has_attached_file :file,
	:url => "/zip/:id/:basename.:extension",
	:path => ":rails_root/public/zip/:id/:basename.:extension"
	#has_and_belongs_to_many :applications
	has_many :avoirs
	attr_accessor :update_file, :currentversion, :type_id, :merge_actual_version, :merge_base_version, :application_ids

	def create_avoir(application_id)
			Avoir.update_all("currentversion=0", "application_id=#{application_id.to_i}") if self.currentversion.to_i == 1
			avoir = Avoir.new(:fichiercompression_id=>self.id, :application_id=>application_id.to_i, :currentversion=>self.currentversion.to_i == 1 ? 1 : 0)
			#Rails.logger.info "fichiercompression_id-=-=-=-=-=-=-=-#{self.id}-=-=-=-=-=-=-=-application_id-=-=-=-=-=-=-=-=-#{tab_application[i].to_i}-=-=-=-=-=-=-=-=-"
			avoir.save
	end
	

        def have_applications?
		Application.find(:first, :conditions=>{:groupapp_id=>self.type_id}).nil?
	end
	
	#def zip_decompression(file_url)		
    	#	require "rubygems"
    	#	require 'zip/zip'
	#	require 'pathname'
    	#	require 'zip/zipfilesystem'
	#	Rails.logger.info "file_url_decompression-=-=-=-=-=-=-=-=-=-=-=-#{file_url}-=-=-=-=-=-=-=-=-=-=-=-=-"
	#	Zip::ZipFile.open("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,}.zip).{1,}$/).to_s}") { |zip_file|
		#Zip::ZipFile.open("/home/nicolas/ruby/prj/newproject/public/zip/11/image_fonctionnel.zip") { |zip_file|
	#		zip_file.each{ |f|
	#			f_path=File.join("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,}).zip.{1,}$/).to_s}", f.name)
				#f_path=File.join("#{RAILS_ROOT}/public#{self.file.url.scan(/^(.{1,})\/.{1,}.zip.{1,}$/).to_s}", f.name)
	#			FileUtils.mkdir_p(File.dirname(f_path))
	#			zip_file.extract(f, f_path) unless File.exist?(f_path)
	#		}
	#	}
	#end
	

	def get_version_apps(ftp,file_url)
		ftp.chdir("/")	
		FileUtils.mkdir_p("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,})\/.{1,}.zip$/)[0][0]}") unless File.exists?("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,})\/.{1,}.zip$/)[0][0]}")
		ftp.get("admin.tharsis-software.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public#{file_url}", "#{RAILS_ROOT}/public#{file_url}")
	end

	def send_file_ftp(ftp)
		#require 'net/ftp'
		file_url = self.file.url.scan(/^(.{1,}.zip)?.{1,}$/)[0][0]
		file_dir = self.file.url.scan(/^(.{1,}\/.{1,}).zip?.{1,}$/)[0][0]
		ftp.chdir("/")
		ftp.chdir("admin.tharsis-software.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public/zip")
		ftp.mkdir(self.id.to_s) unless ftp.nlst.include?(self.id.to_s)
		ftp.chdir(self.id.to_s)
		#file_dir_distant_verif = "admin.tharsis-fotware.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public#{file_dir}"
		#file_dir_distant_verif_array = file_dir_distant_verif.split("/")
		#array_ftp_pwd = ftp.pwd.split("/")
		#taille_file_dir_distant_verif_array = file_dir_distant_verif_array.length-1	
		#ftp.get("admin.tharsis-software.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public#{file_url}", "#{RAILS_ROOT}/public#{file_url}")
		#result = false
		#while result == false && taille_file_dir_distant_verif_array > 1 do
		#	result = array_ftp_pwd.include?(file_dir_distant_verif_array[taille_file_dir_distant_verif_array])
		#	taille_file_dir_distant_verif_array -= 1	
		#end
		#Rails.logger.info "-=-=-=-=-=-file_dir_distant_verif_array=-=-=-=-=-#{file_dir_distant_verif_array[taille_file_dir_distant_verif_array]}-=-=-=-=-=-=-=-=-=-="
		#taille_file_dir_distant_verif_array.upto(file_dir_distant_verif_array.length-1){ |i|
		#	Rails.logger.info "-=-=-=-=-=-=-=-=-=-=file_repetoire_pwd_ftp-=-=-#{file_dir_distant_verif_array[i+1]}-=-=-=-=-=-=-=-=--=-"
		#	ftp.chdir(file_dir_distant_verif_array[i])	
		#}

		#Rails.logger.info "file_url.to_s-=-=-=-=-=-=-=-=-=-=-#{RAILS_ROOT}/public#{file_url.to_s} to #{ftp.pwd}"
		valid_envoie_file_ftp("#{RAILS_ROOT}/public#{file_url.to_s}",ftp)
	end

	def valid_envoie_file_ftp(file,ftp)
		ftp.put(file)
	end

	def remove_file_locale(file_url)
	File.delete("#{RAILS_ROOT}/public#{file_url}")	if File.exists?("#{RAILS_ROOT}/public#{file_url}")
	system("rm -r #{RAILS_ROOT}/public#{file_url.scan(/^(.{1,})\/.{1,}.zip$/)}") if dir_exist?("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,})\/.{1,}.zip$/)}")
	end

	def zip_decompression(file_url)
		require "rubygems"
		require "zip/zip"
		require "pathname"
		require "zip/zipfilesystem"

		Rails.logger.info "ZipFile-=-=-=-=-=-=-=-=-=-#{RAILS_ROOT}/public#{file_url}"
		Zip::ZipFile.open("#{RAILS_ROOT}/public#{file_url}"){ |zip_file|
			zip_file.each{ |f|
				f_path = File.join("#{RAILS_ROOT}/public#{file_url.scan(/^(.{1,}).zip$/)[0][0].to_s}", f.name)
				FileUtils.mkdir_p(File.dirname(f_path))
				zip_file.extract(f, f_path) unless File.exist?(f_path)
			}
		}
	end

	def zip_compression(sFichier_zip,sDossier_save)		
    		require "rubygems"
    		require 'zip/zip'
		require 'pathname'
    		require 'zip/zipfilesystem'
		require 'find'
		Zip::ZipFile.open(sFichier_zip, Zip::ZipFile::CREATE){ |zipfile|
			Find.find(sDossier_save){ |sRes_find|
				sDossier_base = sRes_find[ sDossier_save.length, sRes_find.length ]
				if( sDossier_base != "" )
					if(FileTest.directory?(sRes_find))
						zipfile.dir.mkdir(sDossier_base)
					else
						zipfile.file.open(sDossier_base, 'w'){ |f|
							f.write( File.open(sRes_find, 'rb').read)
						}
					end
				end
			}
			zipfile.close
		}

		#system("chmod 777 #{sFichier_zip}")
		#Dir.delete(sDossier_save)
		system("rm -r #{sDossier_save}")
		#return oAllFiles
		
	end

	#def zip_extract_files_apps_select(tab_fichiercompression_update)
	
	#end
	
	#def send_file_ftp
	#	require 'net/ftp'
	  #	config_ftp = YAML::load_file("/Users/nicolas/ruby/prj/newproject/config/log_ftp_dreamhost.yml")
	  #	ftp = Net::FTP.new(config_ftp["identifiant"]["hostname"],config_ftp["identifiant"]["username"],config_ftp["identifiant"]["password"])
	 # 	ftp.chdir("admin.tharsis-software.com")
	#	ftp.chdir("public")
	#	ftp.chdir("zip")
	#	ftp.mkdir(self.id.to_s)
	#	ftp.chdir(self.id.to_s)
		#ftp.put("/Users/nicolas/ruby/prj/newproject/public/zip/175/colorpicker.zip")
	#	ftp.put("#{RAILS_ROOT}/public#{self.file.url.scan(/^(.{1,}.zip).{1,}$/).to_s}")
	#	ftp.close
	#end

	def edit_file(id_old_fichier,contenufichier,file)
    		require "rubygems"
    		require 'zip/zip'
		require 'pathname'
    		require 'zip/zipfilesystem'
		tab_file = file.split("/")
		tab_avoir = Avoir.find(:all, :conditions=>"fichiercompression_id=#{id_old_fichier}")
		tab_avoir.each{ |avoir|
			Avoir.create(:fichiercompression_id=>self.id, :application_id=>avoir.application_id)
		}
		
		dossier_create = self.file_file_name.scan(/^(.{1,}).zip$/).to_s
		Dir::mkdir("#{RAILS_ROOT}/public/zip/#{self.id.to_s}")	
		Dir::mkdir("#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}")
		fichier_passe = "/"			
		0.upto(tab_file.length-1){ |i|
		    #tab_file_verif = tab_file[i].split(".")
		    #Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-#{"#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}#{file}#{tab_file[i]}-=-=-=-=-=-=-=-=-=-==-=-=-=-"
		  if tab_file[i].to_s.scan(/^.{1,}\.(.{1,})$/) == Array.new
		    Dir::mkdir("#{RAILS_ROOT}/public/#{self.id.to_s}/#{dossier_create.to_s}#{fichier_passe}#{tab_file[i]}") 
		    fichier_passe += "#{tab_file[i]}/"
		  end
		}

		File.open("#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}/#{file}", "w+") do |filewrite|
				filewrite.write(contenufichier)
		end

	   Zip::ZipFile.open("#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{self.file_file_name}", Zip::ZipFile::CREATE) do |zipfile|
		zipfile.add("#{dossier_create.to_s}#{fichier_passe.to_s}/#{tab_file[tab_file.length-1]}","#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}/#{file}") 
		#zipfile.add("colorpicker/refresh_web/protype.js","#{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}/#{file}")
	   end	

	   system("rsync -rlpc #{RAILS_ROOT}/public/zip/#{id_old_fichier}/#{dossier_create.to_s}/* #{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{dossier_create.to_s}/")
   	   
	end

	def self.crontab_flunch_file_version_local
		fichiercompressions = Fichiercompression.all
    		ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
			fichiercompressions.each{ |fichiercompression|
				ftp.chdir("/admin.tharsis-software.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public/zip/")
				if ftp.nlst.include?(fichiercompression.id.to_s)	
					ftp.chdir(fichiercompression.id.to_s)
					unless ftp.nlst.include?(fichiercompression.file_file_name)
						ftp.chdir("..")
						#fichiercompression.valid_envoie_file_ftp("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name}")	
						valid_envoie_file_ftp("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name}",ftp) if File.exists?("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name}")
					end
				else
					ftp.mkdir(fichiercompression.id.to_s) unless ftp.nlst.include?(fichiercompression.id.to_s)
				end
				Rails.logger.info "File_exists-=-=-=-=--=-=-=-#{RAILS_ROOT}/public/zip/#{fichiercompression.id}-=-=-=-=-=-"
				if File.directory?("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}")
					File.delete("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name}") if File.exists?("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name}")
					system("rm -r #{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name.scan(/^(.{1,}).zip$/)[0][0]}") if File.directory?("#{RAILS_ROOT}/public/zip/#{fichiercompression.id}/#{fichiercompression.file_file_name.scan(/^(.{1,}).zip$/)[0][0]}")
				end
			}
		ftp.close

		system("rm -r #{RAILS_ROOT}/public/zip/zipborne") if File.directory?("#{RAILS_ROOT}/public/zip/zipborne")
	end

	def deletefileorigin
		system("echo 'n' | rm -r #{RAILS_ROOT}/public/zip/#{self.id.to_s}") if File.directory?("#{RAILS_ROOT}/public/zip/#{self.id.to_s}")	
		#system("echo 'n' | rm -r #{RAILS_ROOT}/public/zip_ftp/#{self.id.to_s}")	
		ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
		ftp.chdir("/admin.tharsis-software.com/#{GET_DIR_HOME_CREATE_FTP[%x[hostname].chop.to_s]}/public/zip/") 
		if ftp.nlst.include?(self.id.to_s)
			ftp.chdir(self.id.to_s)
			ftp.delete(self.file_file_name.to_s) if ftp.nlst.include?(self.file_file_name.to_s)
		end
		ftp.close

	end

	def file_space?
		self.file_file_name.split(" ").length > 1 ? true : false		
	end

	def file_any_space!
		File.rename("#{RAILS_ROOT}/public/zip/#{self.id}/#{self.file_file_name}", "#{RAILS_ROOT}/public/zip/#{self.id}/#{self.file_file_name.gsub(" ", "_")}")
		#self.file = self.file.gsub(" ", "_")  
		#update_attribute("file_file_name", self.file_file_name.gsub(" ", "_"))
		#find(self.id)
		update_attributes(:file_file_name=>self.file_file_name.gsub(" ", "_"))
		Fichiercompression.find(self.id)
	end

	def set_base_version
		#applications = Application.find(:all, :conditions=>{:groupapp_id=>self.type_id})
		#applications.each{ |application|
		#	application.avoirs.each{ |avoir|
		#		avoir.update_attributes(:base_version=>0)
		#	}	
		#}
		if self.base_version
			Application.find(:first, :joins=>[{:avoirs=>:fichiercompression}], :conditions=>{:groupapp_id=>self.type_id, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}).avoirs.find(:first, :joins=>:fichiercompression, :conditions=>{:fichiercompressions=>{:base_version=>1}}).fichiercompression.update_attribute("base_version", 0) unless Application.find(:first, :joins=>[{:avoirs=>:fichiercompression}], :conditions=>{:groupapp_id=>self.type_id, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}).nil?	
		end
	end

	def create_avoir(application_id)
			Avoir.update_all({:archive_currentversion=>true, :currentversion=>false}, {:application_id=>application_id.to_i, :currentversion=>true}) if self.currentversion.to_i == 1
			#Avoir.update_all("currentversion=0", "application_id=#{application_id.to_i}") if self.currentversion.to_i == 1
			avoir = Avoir.new(:fichiercompression_id=>self.id, :application_id=>application_id.to_i, :currentversion=>self.currentversion.to_i == 1 ? 1 : 0)
			#Rails.logger.info "fichiercompression_id-=-=-=-=-=-=-=-#{self.id}-=-=-=-=-=-=-=-application_id-=-=-=-=-=-=-=-=-#{tab_application[i].to_i}-=-=-=-=-=-=-=-=-"
			avoir.save
	end

	private
	def dir_exist?(file_url)
		                File.directory?(file_url)
	end

	def set_force_update(application_id,forceupdate)
			application = Application.find(application_id)
			application.update_attributes(:reboot=>forceupdate == true ? "forceupdate" : "0")
	end

	def get_version_base(application_id)
		#fichiercompression = Fichiercompression.find(:first, :conditions=>{:file_file_name=>self.file_file_name})
		#groupapp_id = fichiercompression.avoirs.find(:first).application.groupapp_id
		application = Application.find(application_id)	

		#Application.find(:first, :conditions=>{:groupapp_id=>application.groupapp_id}).avoirs.find(:first, :conditions=>{:base_version=>1}).fichiercompression_id	
		Application.find(:first, :joins=>[{:avoirs=>:fichiercompression}], :conditions=>{:groupapp_id=>application.groupapp_id, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}).avoirs.find(:first, :joins=>:fichiercompression, :conditions=>{:fichiercompressions=>{:base_version=>1}}).fichiercompression_id	
	end
end


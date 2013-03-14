class User < ActiveRecord::Base
	belongs_to :role
	validates_uniqueness_of :username
	has_and_belongs_to_many :applications
	validates_presence_of :username, :message=>I18n.t("models.notice.user.username")
	validates_presence_of :role_id, :message=>I18n.t("models.notice.user.role_id")
	validates_format_of :email, :with=>/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message=>I18n.t("models.notice.user.email")
	acts_as_authentic

	def create_ftp_compte(password)
		#system("chmod 777 #{RAILS_ROOT}/public/zip/#{self.id.to_s}/#{self.file_file_name}")
	    if %x[hostname] == "tharsis" && %x[hostname] == "tharsisprod"
		system("useradd -d /home/#{self.username} -s /bin/bash -g exterieur -m #{self.username}")
		system("echo #{self.username}:#{password} | chpasswd")
		case %x[hostname]
			when "tharsis"
				system("ln -s /home/#{self.username} /home/www/mediawalldev/current/public/ftp/")
			when "tharsisprod"
				system("ln -s /home/#{self.username} /home/admin/www/mediawall/public/ftp/")
		end
	     end
	end

	def self.delete_file_ftp
		users = User.all

		users.each{ |user|
			%x[ls /home/#{user.username}].each_line{ |line|
				#puts File.ctime("/Users/nicolas/ruby/prj/newproject/public/zip/test/"+line.to_s.strip)
				if File.ctime("/home/#{user.username}/#{line.to_s.strip}") - Time.now > 604807
					system("echo 'n' | rm -r /home/#{user.username}/#{line.to_s.strip}")
				end
			}
		}
	end
end

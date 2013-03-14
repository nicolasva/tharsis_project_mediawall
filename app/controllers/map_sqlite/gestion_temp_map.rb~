class TempMap
	CHEMIN = YAML::load_file("#{RAILS_ROOT}/config/conf_path_edit_filezip.yml")
	def initialize(file_url,current_user_id)
		@file_url = file_url
		@tab_fichiercompression = file_url.split("/")
		@current_user_id = current_user_id
        end

	def get_file_db
		"#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{CHEMIN["chemin"]}"	
	end

	def construct_temp_map
		destruct_temp_map if File.exist?("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/") 
		Dir.mkdir("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/") unless File.exist?("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/") 
		Dir.mkdir("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/") unless File.exist?("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/")
		Dir.mkdir("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}") unless File.exist?("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}")	
		Dir.mkdir("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/refresh_web/") unless File.exist?("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/refresh_web/")
		rsync_db_map
	end

	def destruct_temp_map
		#File.delete("#{RAILS_ROOT}/public/temp_map/#{@current_user_id}/")
		system("rm -r #{RAILS_ROOT}/public/temp_map/#{@current_user_id}/")
        end
	
	private
        def rsync_db_map
		system("rsync -r #{RAILS_ROOT}/public/zip/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{CHEMIN["chemin"]} #{RAILS_ROOT}/public/temp_map/#{@current_user_id}/#{@tab_fichiercompression[2]}/#{@tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{CHEMIN["chemin"]}")	
	end
end

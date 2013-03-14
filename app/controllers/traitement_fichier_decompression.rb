module EDIT
	class FichierZip
		def initialize(fichiercompressions_id,file_file_name)
			@file_file_name = file_file_name
			@fichiercompressions_id = fichiercompressions_id
		end

		def read_list_file(dossier)
			Rails.logger.info "ls #{RAILS_ROOT}/public/zip/#{@fichiercompressions_id.to_s}/#{@file_file_name}/#{dossier}"
			%x[ls -la #{RAILS_ROOT}/public/zip/#{@fichiercompressions_id.to_s}/#{@file_file_name}/#{dossier}]
		end

		def edit_file(file)
			%x[cat #{RAILS_ROOT}/public/zip/#{@fichiercompressions_id.to_s}/#{@file_file_name}/#{file}]
		end
	end
end

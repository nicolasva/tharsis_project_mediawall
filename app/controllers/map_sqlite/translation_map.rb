class Translations
	def initialize(type_1,id_1,filedb)
		@type_1 = type_1
		@id_1 = id_1
		#@connectionsqlite = filedb
		@connectionsqlite = SQLite3::Database.new(filedb)
        end

	def resulttranslation
		result = traitementlink
		unless result == false
			@connectionsqlite.execute("select * from translations where id=#{result[0][1]}")
		else
			false
		end
	end

	private
	def traitementlink
		result = link
		unless result.empty?
			Rails.logger.info "select * from #{result[0][4]} where id=#{result[0][2]}" 
			@connectionsqlite.execute("select * from #{result[0][4]} where id=#{result[0][2]}")
		else
			false
		end			
	end

	def link
		#Rails.logger.info "select * from link where id_1=#{@id_1} and type_1='#{@type_1}'" 
		@connectionsqlite.execute("select * from link where id_1=#{@id_1} and type_1='#{@type_1}'")
	end
end

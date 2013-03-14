require 'sqlite3'
include SQLite3

class Update
	def initialize(chemin_db)
		@chemin_db = chemin_db
		super(@chemin_db)
	end

	def execute_update(requete)	
		db = SQLite3::Database.new(@chemin_db)
		db.execute(requete)
		db.close
	end

	def update(table,set_colonne,condition)	
		db = SQLite3::Database.new(@chemin_db)
		#UPDATE "nom de table" SET colonne 1 = [valeur 1], colonne 2 = [valeur 2]
		Rails.logger.info "update '#{table}' set #{set_colonne}#{condition.empty? ? "" : " where #{condition}"}" 
		db.execute("update '#{table}' set #{set_colonne}#{condition.empty? ? "" : " where #{condition}"}")
		db.close
	end
end

class Delete < Update
	def initialize(chemin_db)
		@chemin_db = chemin_db
		super(@chemin_db)
	end

	def delete(table,conditions)
		db = SQLite3::Database.new(@chemin_db)
		Rails.logger.info "delete from #{table} #{conditions.empty? ? "" : " where #{conditions}"}"
		db.execute("delete from #{table} #{conditions.empty? ? "" : " where #{conditions}"}")
		db.close
	end
end

class Insert < Delete
	def initialize(chemin_db)
		@chemin_db = chemin_db
		@table = ""
		@colonne = ""
		@value_insert = ""
	end

	def insert(table,colonne,value_insert)
		@table = table
		@colonne = colonne
		@value_insert = value_insert	
		db = SQLite3::Database.new(@chemin_db)
		Rails.logger.info "-=-=-=-=-=-=-=-=-=-insert into #{table} #{colonne.empty? ? "" : "('id',#{colonne})"} values(#{max_id_insert(table)},#{value_insert})-=-=-=-=-=-=-=-=-=-"
		max_id_insert = max_id_insert(@table) 
		db.execute("insert into #{@table} #{@colonne.empty? ? "" : "('id',#{@colonne})"} values(#{max_id_insert(@table)},#{@value_insert})")
		db.close
		max_id_insert
	end

	private
	def max_id_insert(table)
		db = SQLite3::Database.new(@chemin_db)
		id_insert = db.execute("select max(id) from #{table}")
		db.close
		id_insert.to_s.to_i + 1
	end
end

class Select < Insert
	CHEMIN_CONF_TABLE_LIAISON = YAML::load_file("#{RAILS_ROOT}/config/conf_gestion_join_sqlite.yml")
        def initialize(chemin_db)
		@chemin_db = chemin_db
		super(@chemin_db)
	end

	def select_total(table,colonne,condition)	
		db = SQLite3::Database.new(@chemin_db)
		Rails.logger.info "select * from #{CHEMIN_CONF_TABLE_LIAISON["jointuretable"][table].nil? ? table : CHEMIN_CONF_TABLE_LIAISON["jointuretable"][table] } #{condition.empty? ? "" : "where #{table}.#{colonne}=#{condition}"}"	
		rows = db.execute("select * from #{CHEMIN_CONF_TABLE_LIAISON["jointuretable"][table].nil? ? table : CHEMIN_CONF_TABLE_LIAISON["jointuretable"][table] } #{condition.empty? ? "" : "where #{table}.#{colonne}=#{condition}"}")
		db.close
		rows
	end

	def execute(requete)
		Rails.logger.info requete	
		db = SQLite3::Database.new(@chemin_db)
		tab_result_req = db.execute(requete)
		db.close
		tab_result_req
	end
end

class ConnectionSqlite < Select
        CHEMIN_CONF_TABLE_LIAISON = YAML::load_file("#{RAILS_ROOT}/config/conf_gestion_join_sqlite.yml")
	def initialize(chemin_db)	
		@chemin_db = chemin_db
		super(@chemin_db)
	end
end

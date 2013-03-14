class StatGlobalPie
	attr_reader :nb_total
	def initialize(colonne_id,time_min,time_max)
		@colonne_id = colonne_id
		@time_min = time_min
		@time_max = time_max
		@nb_total = 0
	end
	
	def get_stat
		tab_hash_total = Array.new
		tab_hash_total = graph_bie_or_bar_global.sort {|a,b| b[1]<=>a[1]}
	   	tab_hash_total	
	end

	private
	def graph_bie_or_bar_global
		hash_total = Hash.new
                infocolonne = Statistic::Colonne.find(@colonne_id)
                table_id = infocolonne.table_id

                colonne_time_table_colonne = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
                time = colonne_time_table_colonne.id

                tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert
                tab_contenus.each{ |all_contenus|
                    infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu>#{@time_min.to_i} and contenu<#{@time_max.to_i} and colonne_id=#{time}"
                    unless infocolonne_colonne_id.nil?
                              table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and colonne_id=#{infocolonne.id}"
                              unless table_contenu.nil?
                                      #tab_idinsert.push(table_contenu.id)    
                                      hash_total[table_contenu.contenu].nil? ? hash_total[table_contenu.contenu] = 1 : hash_total[table_contenu.contenu] += 1
                              	      @nb_total += 1
			      end
                    end
               }
	       hash_total
	end
end 

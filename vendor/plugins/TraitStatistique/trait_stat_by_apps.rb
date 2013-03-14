class TraitStatByApps < FormatTime
	attr_reader :nb_total, :get_label_graph
	def initialize(application_id,time_min,time_max_comparate)
		super(time_max_comparate - time_min)
		@application_id = application_id
		@time_min = time_min
		@time_max_comparate = time_max_comparate	
		@nb_total = 0
		@get_label_graph = Hash.new
	end

	def get_medias_consulted_by_apps
		hash_nb_media_by_widgetname = Hash.new

			#value_medias_group_widgetname += Statistic::Tablemediasessiondate.count_by_sql "select widgetname,count(*) as nbwidgetname from stat_tablemediasessiondates where applicationid=#{@applicationid} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' group by widgetname"
			hash_nb_media_by_widgetname = Statistic::Tablemediasessiondate.count(:all, :select => 'widgetid', :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S")}'", :group => 'widgetid')	
		Rails.logger.info "-=-=-=-=-=-=-=-=-=-hash-=-=-=-#{hash_nb_media_by_widgetname}-=-=-=-=-=-"
		 hash_nb_media_by_widgetname
	end

	def get_categories_consulted_by_apps
		hash_nb_categorie_by_widgetname = Hash.new

		hash_nb_categorie_by_widgetname = Statistic::Tablecategoriesessiondate.count(:all, :select => 'widgetid', :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S")}'", :group => 'widgetid')

		hash_nb_categorie_by_widgetname
	end

	def get_average_media_session_by_apps
		#value_sum_sessions = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400
		
		#while (time_plus < @time_max_comparate)
		#	value_sum_sessions += Statistic::Tablewidgettotalusersapp.sum(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end



		#(value_sum_sessions.to_f / compteur.to_f) / 60
		#Nouvelle modification
		value_sum_sessions = Statistic::Viewdurationsession.sum(:duration, :conditions=>"applicationid=#{@application_id} and startsession>'#{Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")}'")
		#value_sum_sessions / 60
		value_sum_sessions
	end

	def get_average_media_by_day_apps
		value_nombre_medias = 0
		compteur = 0
		time = @time_min
		time_plus = time + 86400

		while (time_plus < @time_max_comparate)
			value_nombre_medias += Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
			compteur += 1
			time = time_plus
			time_plus += 86400
		end
		value_nombre_medias.to_i
	end

	def get_stat_click_by_apps
		indice = 0
		@nb_total = 0
		time = @time_min
		time_plus = time + traitement_time?
		array_value_nombre_medias = Array.new

		while(time_plus < @time_max_comparate)
			@get_label_graph[indice] = Time.at(time.to_i).strftime(format_strftime?).to_s
			#@nb_total += Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
			#array_value_nombre_medias.push(Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'"))
			
			array_value_nombre_medias.push(Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>{:applicationid=>@application_id, :startsession=>Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}))
			indice += 1
			time = time_plus
			time_plus += traitement_time?
		end

		array_value_nombre_medias
	end

	def get_average_media_by_apps
		#value_nombre_medias = Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>"applicationid=#{@application_id} and startsession>'#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
		value_nombre_medias = Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>{:applicationid=>@application_id, :startsession=>Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(@time_max_comparate).strftime("%Y-%m-%d %H:%M:%S")})
		value_nombre_medias.to_i
	end

	def get_stat_session_by_apps
		#@nb_total = 0
		indice = 0
		time = @time_min
		time_plus = time + traitement_time?
		array_value_nombre_medias = Array.new

		while(time_plus < @time_max_comparate)
			@get_label_graph[indice] = Time.at(time.to_i).strftime(format_strftime?).to_s
			#@nb_total += Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
			
			#array_value_nombre_medias.push(Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'"))
			
			array_value_nombre_medias.push(Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>{:applicationid=>@application_id, :startsession=>Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}))
			indice += 1
			time = time_plus
			time_plus += traitement_time?
		end
		array_value_nombre_medias
	end

	def get_number_session_by_day_by_apps
		#value_nombre_sessions = Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>"applicationid=#{@application_id} and startsession>'#{Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")}'")
		value_nombre_sessions = Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>{:applicationid=>@application_id, :startsession=>Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")..Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S")})
		value_nombre_sessions
	end

	def get_number_session_by_day_apps
		value_nombre_sessions = 0
		compteur = 0 
		time = @time_min
		time_plus = time + 86400

		while(time_plus < @time_max_comparate)
			value_nombre_sessions += Statistic::Tablemediasessiondate.count(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
			compteur += 1
			time = time_plus
			time_plus += 86400
		end
		value_nombre_sessions.to_f / compteur.to_f
	end

	def get_moyenne_duration_session_by_day_apps
		value_sum_sessions = 0
		compteur = 0
		time = @time_min
		time_plus = time + 86400

		while (time_plus < @time_max_comparate)
			value_sum_sessions += Statistic::Tablewidgettotalusersapp.sum(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
			compteur += 1
			time = time_plus
			time_plus += 86400
		end

		value_sum_sessions.to_f / compteur.to_f
	end

	def get_session_total_today_by_apps
		Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(Time.now.to_i - 86400).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(Time.now.to_i).strftime("%Y-%m-%d %H:%M:%S")}'").to_f
	end

        private
	def get_time_format_duration(value)
		if (value / 60) > 60
			return (value/60)/60
		else
			return value/60
		end
	end
end

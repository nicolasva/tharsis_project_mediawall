require "#{RAILS_ROOT}/vendor/plugins/TraitStatistique/formattime.rb"
require "#{RAILS_ROOT}/vendor/plugins/TraitStatistique/trait_stat_by_apps.rb"
class TraitStatView < FormatTime
	attr_reader :nb_total, :get_label_graph
	def initialize(user_role_id,time_min,time_max_comparate)
		super(time_max_comparate - time_min)
		@user_role_id = user_role_id
		@time_min = time_min
		@time_max_comparate = time_max_comparate
		@nb_total = 0
		@get_label_graph = Hash.new
	end

	def get_average_categorie_consulted(groupapp_id)
		hash_nb_media_by_widgetname = Hash.new

		hash_nb_media_by_widgetname = Statistic::Tablecategoriesessiondate.count(:all, :select=>'widgetid', :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupapp_id}", :group => 'widgetid')
		hash_nb_media_by_widgetname
	end

	def get_average_media_consulted(groupapp_id)
		hash_nb_media_by_widgetname = Hash.new

		hash_nb_media_by_widgetname = Statistic::Tablemediasessiondate.count(:all, :select=>'widgetid', :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupapp_id}", :group => 'widgetid')
		#dfsdfsdfdsfdsf
		hash_nb_media_by_widgetname
	end

	def get_average_media_session(groupid)
		value_sum_sessions = 0
		compteur = 0
		time = @time_min	
		time_plus = time + 86400

		#while (time_plus < @time_max_comparate)
		#	value_sum_sessions += Statistic::Tablewidgettotalusersapp.sum(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end

		#value_sum_sessions.to_f / compteur.to_f
		
		#seconde modif
		value_sum_sessions = Statistic::Viewdurationsession.sum(:duration, :conditions=>"roleid=#{@user_role_id} and groupid=#{groupid} and startsession>'#{Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")}'")

		value_sum_sessions

	end

        def get_total_media_by_day
		#value_nombre_medias = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400

	     #while (time_plus < @time_max_comparate)
	     #	value_nombre_medias += Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
	     #	compteur += 1
	     #	time = time_plus
	     #	time_plus += 86400
	     #end

	      #value_nombre_medias.to_f / compteur.to_f 	
	      #value_nombre_medias.to_i
	

		value_nombre_medias = Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'")

		#value_sum_sessions.to_f / compteur.to_f
		#value_nombre_medias == 0 ? value_nombre_medias : (value_nombre_medias / Statistic::Viewdurationsession.count(:countwidgetid, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'"))
	     #Statistic::Mediasessiondate.average(:roleid, :conditions=>"date>#{@time} and date<#{@time_max_comparate}").to_i
		value_nombre_medias
	end

	def get_average_media_by_groupapps(groupid)


		#while (time_plus < @time_max_comparate)
		#	value_nombre_medias += Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end
	
		#2ème modifications
		#value_nombre_medias = Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>"roleid=#{@user_role_id} and startsession>'#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}")

		#3ème modifications
		value_nombre_medias = Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>{:roleid=>@user_role_id, :startsession=>Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S"), :groupid=>groupid})

		#value_nombre_medias.to_f / compteur.to_f	
		value_nombre_medias.to_i
	end

	def get_number_session_by_day
		value_nombre_sessions = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400

		#while (time_plus < @time_max_comparate)
		#	value_nombre_sessions += Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end

		value_nombre_sessions = Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'")
		#value_nombre_sessions = Statistic::Viewdurationsession.count(:duration, :conditions=>"roleid=#{@user_role_id} and startsession>'#{time.strftime("%Y-%m-%d %H:%M:%S")}'")
		#dfsdfsdfdsfsd

		#value_nombre_sessions == 0 ? value_nombre_sessions : (value_nombre_sessions / Statistic::Viewdurationwidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'"))
		#value_nombre_sessions.to_f / compteur.to_f
		value_nombre_sessions
	end

	def get_number_session_by_day_by_groupapps(groupid)	
		value_nombre_sessions = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400

		#while (time_plus < @time_max_comparate)
		#	value_nombre_sessions += Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end

		#2eme modification
		#value_nombre_sessions = Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>"roleid=#{@user_role_id} and startsession>'#{Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}")
		
		#3eme modification
		value_nombre_sessions = Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>{:roleid=>@user_role_id, :startsession=>Time.at(@time_min).strftime("%Y-%m-%d %H:%M:%S")..Time.at(@time_max_comparate.to_i).strftime("%Y-%m-%d %H:%M:%S"), :groupid=>groupid})
		value_nombre_sessions
		#value_nombre_sessions.to_f / compteur.to_f
	end

	def get_average_duration_session_by_day
		#value_sum_sessions = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400

		#while (time_plus < @time_max_comparate)
		#	value_sum_sessions += Statistic::Tablewidgettotalusersapp.sum(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'").to_f
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end
		
		value_sum_sessions = Statistic::Viewdurationsession.sum(:duration, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'")

		#value_sum_sessions.to_f / compteur.to_f
		#value_sum_sessions == 0 ? value_sum_sessions : (value_sum_sessions / Statistic::Viewdurationsession.count(:duration, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'"))
		
		value_sum_sessions == 0 ? value_sum_sessions : (value_sum_sessions / get_number_session_by_day)
	end

	def get_moyenne_duration_session_by_day_by_grouaps(groupid)
		value_sum_session = 0
		#compteur = 0
		#time = @time_min
		#time_plus = time + 86400

		#while (time_plus < @time_max_comparate)
		#	value_sum_sessions += Statistic::Tablewidgettotalusersapp.sum(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}")
		#	compteur += 1
		#	time = time_plus
		#	time_plus += 86400
		#end
		
		value_sum_sessions = Statistic::Viewdurationsession.sum(:duration, :conditions=>"startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}' and roleid=#{@user_role_id} and groupid=#{groupid}") 
		#value_sum_sessions == 0 ? value_sum_sessions : (value_sum_sessions / Statistic::Viewdurationsession.count(:duration, :conditions=>"startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}' and roleid=#{@user_role_id} and groupid=#{groupid}"))

		value_sum_sessions == 0 ? value_sum_sessions : (value_sum_sessions / get_number_session_by_day_by_groupapps(groupid))
	end

	def get_session_total_today
		#Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(Time.now.to_i - 86400).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(Time.now.to_i).strftime("%Y-%m-%d %H:%M:%S")}'").to_f	
		Statistic::Viewdurationsession.sum(:duration, :conditions=>"roleid=#{@user_role_id} and startsession>'#{@time_min.strftime("%Y-%m-%d %H:%M:%S")}'")
	end

	def get_stat_click(groupid)
		#compteur = 1
		indice = 0
		@nb_total = 0
		time = @time_min
		time_plus = time + traitement_time?
		array_value_nombre_medias = Array.new

		#@nb_total += Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"applicationid=#{@application_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}'")
		#@get_label_graph[0] = Time.at(time.to_i).strftime("%H").to_s
		while (time_plus < @time_max_comparate)
			#if compteur == 3	
				@get_label_graph[indice] = Time.at(time.to_i).strftime(format_strftime?).to_s
			#	compteur = 0
			#end
			#array_value_nombre_medias.push(Statistic::Tablemediasessiondate.count(:widgetid, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}"))
			#compteur += 1
			#array_value_nombre_medias.push(Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>"roleid=#{@user_role_id} and startsession>'#{Time.at(@time_min.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}"))
			array_value_nombre_medias.push(Statistic::Viewdurationsession.sum(:countwidgetid, :conditions=>{:roleid=>@user_role_id, :startsession=>Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S"), :groupid=>groupid}))
			indice += 1
			time = time_plus
			time_plus += traitement_time?
		end

		Rails.logger.info "-=-=-=-=-=-=-test fin graphique by click groupid-=-=-=-=-"
		array_value_nombre_medias
	end

	def get_stat_session(groupid)	
		indice = 0
		#@nb_total = 0
		time = @time_min
		time_plus = time + traitement_time?
		array_value_nombre_medias = Array.new

		while (time_plus < @time_max_comparate)
			@get_label_graph[indice] = Time.at(time.to_i).strftime(format_strftime?).to_s
			#@nb_total += Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}") 	
			#array_value_nombre_medias.push(Statistic::Tablewidgettotalusersapp.count(:duration, :conditions=>"roleid=#{@user_role_id} and date BETWEEN '#{Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and '#{Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S")}' and groupid=#{groupid}"))	
			array_value_nombre_medias.push(Statistic::Viewdurationwidgettotalusersapp.count(:all, :conditions=>{:roleid=>@user_role_id, :startsession=>Time.at(time.to_i).strftime("%Y-%m-%d %H:%M:%S")..Time.at(time_plus.to_i).strftime("%Y-%m-%d %H:%M:%S"), :groupid=>groupid}))
			indice += 1
			time = time_plus
			time_plus += traitement_time?
		end

		array_value_nombre_medias
	end
end
class TraitGlobalStat
	attr_reader :nb_total, :hash_time_colonne_gruff, :hash_time_colonne_gruff_compteur, :array_time 
	def initialize(table,user_role_id,time_column,time,time_max_comparate)	
		#super(user_role_id,time_column,time,time_max_comparate)	
		@time = time
		Rails.logger.info "time_max_traitglobalStat-=-=-=-=-=-=-#{time_max_comparate}-=-=-=-=-=-"
		@time_max_comparate = time_max_comparate
  		@array_time = Array.new
		@table = table
		@hash_colonne_gruff = Hash.new
		@hash_time_colonne_special = Hash.new
		@hash_time_colonne_gruff = Hash.new
		@hash_time_colonne_gruff_compteur = Hash.new
		@user_role_id = user_role_id
		#@application_serial = application_serial
		@time_column = time_column
		@nb_total = 0
		@array_valeur_session = Array.new
		@array_valeur_session_by_date = Array.new
	end

	def get_apps_user_role
		array_nombre_machines = Array.new
		applications = Application.find(:all, :conditions=>"role_id=#{@user_role_id}")
		applications.each{ |application|
			array_nombre_machines.push(application.serial)			
		}
		array_nombre_machines
	end

	def get_session_by_day(array_apps_user_role,colonne_table)
		#total_moyenne_session = 0
		array_session_by_day = get_array_session_by_day(array_apps_user_role,colonne_table)
		#0.upto(array_session_by_day.length-1){ |i|
		#	total_moyenne_session += array_session_by_day[i]
		#}
		#get_array_session_by_day / get_array_session_by_day.length-1	
		#(get_array_session_by_day.empty? ? 0 : total_moyenne_session / get_array_session_by_day.length-1)
		#Rails.logger.info "-=-=-=-total_moyenne_session-=-=-=-=-#{total_session_by_day}-=-=-=-=-array_session_by_day-=-=-=-=-=-#{array_session_by_day.length}"
		get_array_session_by_day(array_apps_user_role,colonne_table).empty? ? 0 : total_session_by_day(array_apps_user_role,colonne_table)/array_session_by_day.length.to_f
	end

	def total_session_by_day(array_apps_user_role,colonne_table)	
		total_moyenne_session = 0
		array_session_by_day = get_array_session_by_day(array_apps_user_role,colonne_table)
		0.upto(array_session_by_day.length-1){ |i|
			total_moyenne_session += array_session_by_day[i]
		}
		total_moyenne_session
	end

	#def get_array_session_by_day(array_nombre_machines,colonne_table)
	 #       array_result_compteur_session = Array.new	
          #   unless array_nombre_machines.empty?
		#array_nombre_machines = get_apps_user_role 
	#	sessionId_users_sessions = @table.colonnes.find_by_name(colonne_table).id
	#	time = @time
	#	time_plus = time + traitement_time? 
	#	Rails.logger.info "-=-=-=-=-=-=-=-time-=-=-=-=-#{time}-=-=-=-=-=-=-=-time_plus-=-=-=-=-=-=-=-#{time_plus}-=-=-=-=-=-=-time_max_comparate-=-=-=-=-=-=-=-#{@time_max_comparate}"
	#	while (time_plus < @time_max_comparate)
	#		@array_time.push("#{time.to_i}_#{time_plus.to_i}")
	#		Rails.logger.info "-=-=-=-=-=-=- nicolas test -=-=-=-=-#{colonne_time?}"
	#		compteur_value = 0
	#		compteur = 0
	#		colonne_id_apps_serial_column = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id
			#@table.colonnes.find(:first, :conditions=>"apps_serial_column=1").each{ |colonne|	
	#	     	     0.upto(array_nombre_machines.length - 1){ |i|
				#Rails.logger.info "-=-=-=-=-=-=- array_apps -=-=-=-=-#{array_nombre_machines[i]}"
	#			unless Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_nombre_machines[i]}' and colonne_id=#{colonne_id_apps_serial_column}", :group=>:idinsert).empty?
	#			     Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_nombre_machines[i]}' and colonne_id=#{colonne_id_apps_serial_column}", :group=>:idinsert).each{ |contenu|	
	#				idinsert = contenu.idinsert 
	#				unless Statistic::Contenu.find(:first, :conditions=>"contenu>'#{time.to_i}' and contenu<'#{time_plus.to_i}' and idinsert=#{idinsert} and colonne_id=#{@time_column}").nil?
	#					Rails.logger.info "Statistic_contenu-=-=-=-=-=-=-=-=-=-id_insert=#{compteur}"	
	#					unless Statistic::Contenu.find(:first, :conditions=>"idinsert=#{idinsert} and colonne_id=#{sessionId_users_sessions}").nil?
							#@array_time.push("#{time.to_i}_#{time_plus.to_i}")
	#						compteur += 1 
	#						@array_valeur_session.push(Statistic::Contenu.find(:first, :conditions=>"idinsert=#{idinsert} and colonne_id=#{sessionId_users_sessions}").contenu.to_i)
							#@array_valeur_session_by_date.push(Statistic::Contenu.find(:first, :conditions=>"idinsert=#{idinsert} and colonne_id=#{sessionId_users_sessions}").contenu.to_i)
							#@array_valeur_session.push(1)
	#						compteur_value += Statistic::Contenu.find(:first, :conditions=>"idinsert=#{idinsert} and colonne_id=#{sessionId_users_sessions}").contenu.to_i
	#					end
	#				end
	#			     }
	#			end
	#		     }
					
			#}
	#		@hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] = compteur_value 
	#		@hash_time_colonne_gruff_compteur["#{time.to_i}_#{time_plus.to_i}"] = compteur
			#@array_valeur_session_by_date	
	#		time = time_plus
	#		time_plus += traitement_time?
			#@array_valeur_session_by_date = Array.new
	#		array_result_compteur_session.push(compteur)
	#	end
	 #    end
	     	#Rails.logger.info "array_result_compteur_session-=-=-=-=-=-=-=-=-=-=-#{array_result_compteur_session[0]}"
	#	array_result_compteur_session
	#end

	def get_session_total_today
		Statistic::Widgettotalusersapp.count(:duration, :conditions=>"role_id=#{@user_role_id} and date>'#{Time.now.to_i - 86400}' and date<'#{Time.now}'")
	end

	def average_time_session
		time_total_session == 0 ? 0 : time_total_session / @array_valeur_session.length
	end

	def time_total_session
	       Rails.logger.info "array_valeur_session-=-=-=-=-=-=-=-=-=-#{@array_valeur_session}"	
		time_session_total = 0
		unless @array_valeur_session.empty?
			0.upto(@array_valeur_session.length-1){ |i|
				time_session_total += @array_valeur_session[i]	
			}
		end
		time_session_total
	end

	def trait_stat_graph_total
			time = @time
			time_plus = time + 3600
			while time_plus < @time_max_comparate
				@table.colonnes.each{ |colonne|
					#colonne.contenus.find(:all, :conditions=>"contenu='#{tab_application[i].to_s}'", :group=>:idinsert).each{ |contenu|
					#time_column = colonne.time_column
					affichagecolonne = colonne.affichagecolonne

					@array_time.push("#{time.to_i}_#{time_plus.to_i}") 
					colonne.contenus.find(:all, :group=>:idinsert).each{ |contenu|
					     unless contenu.nil?
						    idinsert = contenu.idinsert
							contenus_time = Statistic::Contenu.find :all, :conditions=>"contenu>'#{time.to_i}' and contenu<'#{time_plus.to_i}' and idinsert=#{idinsert} and colonne_id=#{@time_column}"
							unless contenus_time.nil?
									#fdfdsfdsfd
									#tab_colonne_gruff.push(contenus_time.length)
									#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-=-#{contenus_time.length}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
							   #if time_column == 0 && affichagecolonne
							     #end
									@hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"].nil? ? @hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] = contenus_time.length : @hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] += contenus_time.length		 
									@nb_total += 1
							else
								@hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] = 0
							end
					     end
						
					}
					time = time_plus
					time_plus += 3600
				}
			end
	end

	def trait_stat_total
				colonnes = @table.colonnes.find(@time_column)
				nbr_contenus = Statistic::Contenu.count(:conditions=>"contenu>'#{@time.to_i}' and contenu<'#{@time_max_comparate}' and colonne_id=#{@time_column}")
				nbr_contenus
        end

	def get_label_time
			hash_time_label = Hash.new
		        #taille_colonne_gruff = array_colonne_gruff.length - 1
		        taille_colonne_gruff = (get_array_gruff.length - 1).to_i
                        taille_divise_2 = (taille_colonne_gruff/2).round
                        retaille_divise = (taille_divise_2/2).round
                        time_dif = Time.at(@time.to_i) - Time.at(@time_max_comparate.to_i)
                        time_moyenne = Time.at(@time.to_i) + (time_dif/2)
                        time_dif_time_moyenne = Time.at(time_moyenne.to_i) - Time.at(@time.to_i)
                        time_moyenne_minimum = Time.at(@time.to_i) + (time_dif_time_moyenne/2)
                        time_moyenne_maximum = Time.at(@time_max_comparate.to_i) - (time_dif_time_moyenne/2)
                        hash_time_label[0] = Time.at(@time.to_i).strftime(get_label?).to_s
                        hash_time_label[0 + retaille_divise] = Time.at(time_moyenne_minimum).strftime(get_label?).to_s
                        hash_time_label[taille_divise_2] = Time.at(time_moyenne).strftime(get_label?).to_s
                        hash_time_label[taille_colonne_gruff - retaille_divise] = Time.at(time_moyenne_maximum).strftime(get_label?).to_s
			hash_time_label[taille_colonne_gruff] = Time.at(@time_max_comparate.to_i).strftime(get_label?).to_s
			#Rails.logger.info "-=-=-=-=-=-=-=-#{@hash_time_colonne_gruff.length - 1}-=-=-==-=-=-=-=-=-=-=-=-=-"
			hash_time_label	
	end

	private
	def get_array_gruff
		tab_gruff_final = Array.new
		0.upto(@array_time.length){ |i|
			Rails.logger.info "=-=-=-=-=-=-=-=-=-=-=-#{@array_time[i]}=-=-=-=-=-=-=-=-=-=-"
			val = @hash_time_colonne_gruff[@array_time[i]]
		      unless val.nil? && val.to_s.empty?
			tab_gruff_final.push(val)
		      end
		}
		tab_gruff_final
	end

	def get_hash_colonne_gruff
		@hash_colonne_gruff
	end

	def get_hash_time_colonne_gruff
		@hash_time_colonne_gruff
	end

	def trait_stat(dif_time,application_serial)
			time = @time
			time_plus = time + dif_time
			while time_plus < @time_max_comparate
				@table.colonnes.each{ |colonne|
					#colonne.contenus.find(:all, :conditions=>"contenu='#{tab_application[i].to_s}'", :group=>:idinsert).each{ |contenu|
					#time_column = colonne.time_column
					affichagecolonne = colonne.affichagecolonne
					colonne.contenus.find(:all, :group=>:idinsert).each{ |contenu|
					     unless contenu.nil?
						    idinsert = contenu.idinsert
						    contenus_applications = Statistic::Contenu.find :first, :conditions=>"contenu='#{application_serial.to_s}' and idinsert=#{idinsert}"
						    unless contenus_applications.nil?
							contenus_time = Statistic::Contenu.find :all, :conditions=>"contenu>'#{time.to_i}' and contenu<'#{time_plus.to_i}' and idinsert=#{idinsert} and colonne_id=#{@time_column}"
							unless contenus_time.nil?
									#fdfdsfdsfd
									#tab_colonne_gruff.push(contenus_time.length)
									#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-=-#{contenus_time.length}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
							   #if time_column == 0 && affichagecolonne
							     #end
									@hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"].nil? ? @hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] = contenus_time.length : @hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] += contenus_time.length		 
							else	
								@hash_time_colonne_gruff["#{time.to_i}_#{time_plus.to_i}"] = 0
							end
						    end
					     end
						
					}
					time = time_plus
					time_plus += dif_time
				}
			end
	end
	
end

class TraitGlobalStatDate < TraitGlobalStat
	def initialize(table,time_min,time_max,user_role_id,time_column)
		#initialize(table,user_role_id,time_column,time,time_max_comparate)
		super(table,user_role_id,time_column,time_min,time_max)
		@time_min = time_min
		Rails.logger.info "time_min-=-=-=-=-=--#{time_min}-=-=-=-=time_max-=-=-=-=-=#{time_max}-=-=-=-=-=-=-=-"
		@time_max = time_max
		@dif_time = @time_max - @time_min

		#Rails.logger.info "=-=-=-=-=-dif_day : #{@time_max}-=-=-=-=-=-=-=-dif_month : #{@time_min}"
	end

	def trait_stat_time(choix_hash_result,application_serial)
		trait_stat(traitement_time?,application_serial)
		if choix_hash_result == "hash_colonne_gruff"
			get_hash_colonne_gruff
		else
			get_array_gruff
		end
	end

	def trace_graph_total
		trait_stat_graph_total
		get_array_gruff
	end

	def get_label?
		#dif_day = @day_max - @day_min
		if @dif_time <= 86400
			"%H"	
		else	
				I18n.locale == :fr ? '%d/%m/%Y' : '%Y/%m/%d'
		end
	end

	def traitement_time?
		#dif_day = @day_max - @day_min	
		if @dif_time <= 86400
			3600
		else
			if @dif_time > 86400 && @dif_time <= 2419200
				3600
			else
				if @dif_time > 2419200 && @dif_time <= 10364400
					604800
				else
					2419200
				end
			end
		end 
		
	end

	def colonne_time?
		colonne = @table.colonnes.find(:first, :conditions=>"time_column=1")
		colonne.id.to_i
	end

        private
	def get_time_locale_min?	
		if @dif_time < 86400
			 	Time.local(@year_min, @month_min, @day_min, @hour_min, @minute_min)
		else
			 	Time.local(@year_min, @month_min, @day_min)
		end 
	end

	def get_time_locale_max?
		if @dif_time < 86400
			 	Time.local(@year_max, @month_max, @day_max, @hour_max, @minute_max)
		else
			 	Time.local(@year_max, @month_max, @day_max)
		end 
	end
end

class TraitStatMachinesActives < TraitGlobalStatDate
	#def initialize(table,time_min,time_max,user_role_id,time_column)	
	#def initialize(table,time_min,time_max,user_role_id,time_column)
	attr_reader :nb_total 
	def initialize(user_role_id,time_min,time_max)
		#Rails.logger.info "time minimum : #{time_min?} -=-=-=-=- time maximum #{time_max?} -=-=-=-"
		#super(Statistic::Table.find_by_name("Users_Sessions"),time_min?,time_max?,user_role_id,colonne_time?)
		@user_role_id = user_role_id
		@time_min = time_min
		@time_max = time_max
		@nb_machines_totales = Application.count(:conditions=>"role_id=#{@user_role_id}") #nombre de machines total pour ce groupe d'utilisateur qui représente les 100%#
		@hash_result_machines_actives = Hash.new
		@nb_total = 0
	end

	def get_stat_machines_actives
		time = @time_min
		time_plus = time + 3600

	     unless @nb_machines_totales.to_i == 0
		while time_plus < @time_max 
			#hash_pings = Ping.count(:all, :joins=>:application, :conditions=>"#{time.to_i}<pings.created_at<#{time_plus.to_i} and role_id=#{@user_role_id}", :group=>"application_id")
			#2010-10-02 06:32:23
			hash_pings = Ping.count(:all, :joins=>:application, :conditions=>"pings.created_at between '#{time.strftime('%Y-%m-%d %I:%M:%S')}' and '#{time_plus.strftime('%Y-%m-%d %I:%M:%S')}' and role_id=#{@user_role_id}", :group=>"application_id")
			#nombre de machines valeur#
			nb_machines = hash_pings.length
			@nb_total += nb_machines
			#nombre de machines en pourcentage
			nb_machines_pourcentage = (nb_machines * 100) / @nb_machines_totales
			#nb_machines_pourcentage = (nb_machines * 100) / @nb_machines_totales
		        
			@hash_result_machines_actives["#{time.to_i}_#{time_plus.to_i}"] = nb_machines_pourcentage	
		
			time = time_plus
			time_plus += 3600
		end
	     end

		@hash_result_machines_actives
	 end

	def get_time_graph
			taille_result_stat_machines_active = get_stat_machines_actives.length - 1	
			hash_time_label = Hash.new
			hash_time_label[0] = @time_min.strftime('%H:%M %Y-%m-%d').to_s
			hash_time_label[taille_result_stat_machines_active/2] = (@time_max - 43200).strftime('%H:%M %Y-%m-%d').to_s
			hash_time_label[taille_result_stat_machines_active] = @time_max.strftime('%H:%M %Y-%m-%d').to_s

			hash_time_label	
	end
end


class ClassStatMoyenneApps < TraitGlobalStatDate
	def initialize(user_role_id,table)
	        @user_role_id = user_role_id	
		@table = table
		super(table,Time.now.to_i - 259200,Time.now.to_i,user_role_id,colonne_time?)
	end

	private
	def colonne_time?
		colonne = @table.colonnes.find(:first, :conditions=>"time_column=1")
		colonne.id.to_i
	end

	def time_min?
		#Rails.logger.info "minimum -=-=-=-=-=- #{Statistic::Contenu.minimum(:contenu, :conditions=>"colonne_id=#{colonne_time?}")}"
		#Statistic::Contenu.minimum(:contenu, :conditions=>"colonne_id=#{colonne_time?}").to_i
	     colonne_time_min = time_max?
	     #Rails.logger.info "Colonne_time max -=-=-=-=-#{time_max?}"
	     #dffdsfsdfds
	     array_user_apps = get_apps_user_role	
	     #Rails.logger.info "array_user_apps=-=-=-=-=-=-=-#{array_user_apps}"
	     #nifdsqfdsfsd
	     #table = Statistic::Table.find_by_name("Users_Sessions")
	     #table.colonnes.find(:all, :conditions=>"apps_serial_column=1"){ |colonne|
	     colonne_id = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id
		#nifdsqfdsfsd
	        0.upto(array_user_apps.length-1){ |i|
			#nifdsqfdsfsd
			unless Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").empty?
			     Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").each{ |contenu|
				idinsert = contenu.idinsert
				contenu = Statistic::Contenu.find(:first, :conditions=>"colonne_id=#{colonne_time?} and idinsert=#{idinsert}")
				Rails.logger.info "colonne_time_min-=-=-=-=-=-#{colonne_time_min}-=-=-=-=-=-contenu_contenu-=-=-=-=-#{contenu.contenu}"
				if colonne_time_min.to_i > contenu.contenu.to_i
					colonne_time_min = contenu.contenu.to_i
				end
			     }
			end
		}
	     #}
	     Rails.logger.info "colone_time_min--=-=-=----#{colonne_time_min}-=-=-=-#{colonne_time?}" 
	     colonne_time_min	     
	end

	def time_max?
		colonne_time_max = 0
		array_user_apps = get_apps_user_role
		#table = Statistic::Table.find_by_name("Users_sessions")
		colonne_id = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id
		0.upto(array_user_apps.length-1){ |i|
			unless Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").empty?
			     Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").each{ |contenu|
				idinsert = contenu.idinsert
				contenu = Statistic::Contenu.find(:first, :conditions=>"colonne_id=#{colonne_time?} and idinsert=#{idinsert}")
				if colonne_time_max.to_i < contenu.contenu.to_i
					colonne_time_max = contenu.contenu.to_i
				end
			     }
			end
		}

		colonne_time_max
	end

end


class ClassMoyenneByTypeApps < TraitGlobalStatDate
	def initialize(groupapp_id,user_role_id,table)
		#initialize(table,time_min,time_max,user_role_id,time_column)
		@groupapp_id = groupapp_id
		@user_role_id = user_role_id
		@table = table
		#super(table,time_min?,time_max?,user_role_id,colonne_time?)	
		super(table,Time.now.to_i - 259200,Time.now,user_role_id,colonne_time?)
	end

	def get_array_apps_by_groupapp_id
		array_apps_type = Array.new
		#array_verif_apps = Array.new
		applications = Application.find(:all, :conditions=>"role_id=#{@user_role_id} and groupapp_id=#{@groupapp_id}")
		applications.each{ |application|
			array_apps_type.push(application.serial)
		}
		#array_verif_apps = array_apps_type
		#colonne_id_apps_serial_column = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id 
		#0.upto(array_apps_type.length-1){ |i|
		#	if Statistic::Contenu.find(:first, :conditions=>"contenu='#{array_apps_type[i].to_s}' and colonne_id=#{colonne_id_apps_serial_column}").nil?
		#		array_verif_apps.delete(array_apps_type[i])	
		#	end
		#}
		array_apps_type
		#rray_verif_apps
	end

	def colonne_time?
		colonne = @table.colonnes.find(:first, :conditions=>"time_column=1")
		colonne.id.to_i
	end

	def time_min?
		#Rails.logger.info "minimum -=-=-=-=-=- #{Statistic::Contenu.minimum(:contenu, :conditions=>"colonne_id=#{colonne_time?}")}"
		#Statistic::Contenu.minimum(:contenu, :conditions=>"colonne_id=#{colonne_time?}").to_i
	     colonne_time_min = time_max?
	     #Rails.logger.info "Colonne_time max -=-=-=-=-#{time_max?}"
	     #dffdsfsdfds
	     array_user_apps = get_array_apps_by_groupapp_id
	     #Rails.logger.info "array_user_apps=-=-=-=-=-=-=-#{array_user_apps}"
	     #nifdsqfdsfsd
	     #table = Statistic::Table.find_by_name("Users_Sessions")
	     #table.colonnes.find(:all, :conditions=>"apps_serial_column=1"){ |colonne|
	     colonne_id = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id
		#nifdsqfdsfsd
	        0.upto(array_user_apps.length-1){ |i|
			#nifdsqfdsfsd
			unless Statistic::Contenu.find(:first, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").nil?
			     Rails.logger.info "test_statistic_contenu"
			     Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").each{ |contenu|
				idinsert = contenu.idinsert
				contenu = Statistic::Contenu.find(:first, :conditions=>"colonne_id=#{colonne_time?} and idinsert=#{idinsert}")
				Rails.logger.info "colonne_time_mintest-=-=-=-=-=-#{colonne_time_min}-=-=-=-=-=-contenu_contenu-=-=-=-=-#{contenu.contenu}"
				if colonne_time_min.to_i > contenu.contenu.to_i
					Rails.logger.info "contenu.contenu-=-=-=-=-=-=-=-=-=-=-=-=-#{contenu.contenu.to_i}"
					colonne_time_min = contenu.contenu.to_i
				end
			     }
			end
		}
	     #}
		Rails.logger.info "colone_time_mintest--=-=-=----#{colonne_time_min}-=-=-=-#{colonne_time?}" 
		colonne_time_min	     
	end

	def time_max?
		colonne_time_max = 0
		array_user_apps = get_array_apps_by_groupapp_id
		#table = Statistic::Table.find_by_name("Users_sessions")
		colonne_id = @table.colonnes.find(:first, :conditions=>"apps_serial_column=1").id
		0.upto(array_user_apps.length-1){ |i|
			unless Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").empty?
			     Statistic::Contenu.find(:all, :conditions=>"contenu='#{array_user_apps[i].to_s}' and colonne_id=#{colonne_id}").each{ |contenu|
				idinsert = contenu.idinsert
				contenu = Statistic::Contenu.find(:first, :conditions=>"colonne_id=#{colonne_time?} and idinsert=#{idinsert}")
				if colonne_time_max.to_i < contenu.contenu.to_i
					colonne_time_max = contenu.contenu.to_i
				end
			     }
			end
		}

		Rails.logger.info "time_max?-=-=-=-=-=-=-=-=-=--=-=-=-#{colonne_time_max}"
		colonne_time_max
		Time.now.to_i
	end
end

class GaphStatView
	def initialize(role_id)
		@role_id = role_id
		@time_min = Time.now - 1296000
	end
end

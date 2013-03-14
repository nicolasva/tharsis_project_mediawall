require "#{RAILS_ROOT}/vendor/plugins/TraitStatistique/trait_stat_global.rb"
module StatisticsHelper
	def get_time_format_duration(value,traduction)
		if (value / 60) > 60
			result = "<span class='span_class_chiffres_stat'>#{((value/60)/60).to_i}</span> #{t("statistics.heures_#{traduction}")}"
		else
			result = "<span class='span_class_chiffres_stat'>#{(value/60).to_i}</span> #{t("statistics.minutes_#{traduction}")}"
		end
	end

	def get_date(date)
		time_now = Time.now
	     case date
		when "by_day"
			time_min = time_now - 86400
			time_min = Time.local(time_min.year,time_min.month,time_min.day+1,0,0,0)
		when "by_month"
			#time_min = time_now - 10713600
			time_now += 604800
			time_min = time_now - (2419228 + (86400 * (time_now.wday-1)))
			#time_min = Time.local(time_min.year,time_min.month,1,0,0,0)	
			time_min = Time.local(time_min.year,time_min.month,time_min.day,0,0,0)
		when "by_week"
			time_now += 86400
			#time_now = Time.local(time_now.year,time_now.month,time_now.day,23,59,59)
			#time_min = time_now.to_i - 2419201
			#time_min = time_now.to_i - 1209600
			time_min = time_now - (86400 * (time_now.wday-1))
			time_min = Time.local(time_min.year,time_min.month,time_min.day,0,0,0)
	     end
	     [time_now, time_min]
	end

	def set_parent_home_role_statistics(user_role_id, params_role_id)
		tab_role = get_parent_home_applications(user_role_id, params_role_id)
		result_roles = ""
		liste_roles = ""
		0.upto(tab_role.length-1){ |i|
			roles = Role.find(:all, :conditions=>"role_id=#{tab_role[i]}")
			
			result_roles = "<ul>" 
			roles.each{ |role|
				if i > 0
					result_roles += "<li>#{link_to role.name.downcase, {:controller=>"statistics", :action=>"index", :role_id=>role.id}, :style=>"color:black;#{params_role_id.to_i == role.id ? "text-decoration:underline;" : "text-decoration:none;" }"}"
						if tab_role[i-1].to_i == role.id.to_i
							result_roles += liste_roles
						end
					result_roles += "</li>"	
				else
					result_roles += "<li>#{link_to role.name.downcase, {:controller=>"statistics", :action=>"index", :role_id=>role.id}, :style=>"color:black;#{params_role_id.to_i == role.id ? "text-decoration:underline;" : "text-decoration:none;" }"}</li>"
				end	
			}
			result_roles += "</ul>"
			liste_roles = result_roles
		}
		result_roles		
	end

	def url_controller_action_name_stats_text(controller_action_name)
		t("statistics.phrase_url_home_stat")
	end

	def get_top_categorie_consulted_by_apps(by_date,application_id)
		compteur_couleur = 0
		compteur = 1
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		hash_traitstatviewbyapps = Hash.new
		tab_valuestatviewbyapps = Array.new
		traitstatviewbyapps = TraitStatByApps.new(application_id,time_min,time_now)
		unless traitstatviewbyapps.get_categories_consulted_by_apps.empty?
		affichage_valuestatviewbyapps = "<table class='table_class_top_detail_stat' cellspacing='0' cellpadding='0' border='0' width='450'>
		<tr class='colonne_titre'>
			<td class='colonne_general_first' width='40'></td>
			<td width='350'>#{t("statistics.categorie")}</td>
			<td class='colonne_general_last' width='60'>#{t("statistics.clique")}</td>
		</tr>"

		hash_traitstatviewbyapps = traitstatviewbyapps.get_categories_consulted_by_apps

		tab_valuestatviewbyapps = array_key_hash(hash_traitstatviewbyapps)
		x = tab_valuestatviewbyapps.length-1 > 20 ? - (20 - tab_valuestatviewbyapps.length-1) : tab_valuestatviewbyapps.length-1

		0.upto(tab_valuestatviewbyapps.length-1 > 20 ? tab_valuestatviewbyapps.length - x : tab_valuestatviewbyapps.length-1){ |i|	
			affichage_valuestatviewbyapps += "<tr class='class_contenu_colonne_top_stat' style='background-color:#{tab_td_style(compteur_couleur)}'>
				<td width='40' class='contenu_colonne_top_stat'>#{compteur}</td><td width='350'>#{hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]).nil? ? "" : hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]).scan(/^'(.{1,})'$/)[0][0]}</td><td width='60' class='colonne_general_last'>#{tab_valuestatviewbyapps[i]}</td>
				</tr>"	
			hash_traitstatviewbyapps.delete(hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]))
			compteur += 1	
			compteur_couleur = compteur_couleur == 0 ? 1 : 0
		}
	        affichage_valuestatviewbyapps += "</table>"
		else
		affichage_valuestatviewbyapps = "Il n'y a pas de catégorie"
		end
		affichage_valuestatviewbyapps
	end

	def get_top_media_consulted_by_apps(by_date,application_id)
		compteur_couleur = 0
		compteur = 1
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		hash_traitstatviewbyapps = Hash.new
		tab_valuestatviewbyapps = Array.new
		traitstatviewbyapps = TraitStatByApps.new(application_id,time_min,time_now) 
	      unless traitstatviewbyapps.get_medias_consulted_by_apps.empty?		
		affichage_valuestatviewbyapps = "<table class='table_class_top_detail_stat' cellspacing='0' cellpadding='0' border='0' width='450'>
		<tr class='colonne_titre'>
			<td class='colonne_general_first' width='40'></td>
			<td width='350'>#{t("statistics.medias")}</td>
			<td class='colonne_general_last' width='60'>#{t("statistics.clique")}</td>
		</tr>"
	      	hash_traitstatviewbyapps = traitstatviewbyapps.get_medias_consulted_by_apps
		#tab_valuestatview = hash_traitstatview.values.sort

		tab_valuestatviewbyapps = array_key_hash(hash_traitstatviewbyapps)	
		x = tab_valuestatviewbyapps.length-1 > 20 ? - (20 - tab_valuestatviewbyapps.length-1) : tab_valuestatviewbyapps.length-1

		0.upto(tab_valuestatviewbyapps.length-1 > 20 ? tab_valuestatviewbyapps.length - x : tab_valuestatviewbyapps.length-1){ |i|
			affichage_valuestatviewbyapps += "<tr class='class_contenu_colonne_top_stat' style='background-color:#{tab_td_style(compteur_couleur)}'>
				<td width='40' class='contenu_colonne_top_stat'>#{compteur}</td><td width='350'>#{hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]).nil? || hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]).scan(/^.{1,}\/(.{1,}..{1,}).{1,}$/).empty? ? "" : hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]).scan(/^.{1,}\/(.{1,}..{1,}).{1,}$/)[0][0]}</td><td width='60' class='colonne_general_last'>#{tab_valuestatviewbyapps[i]}</td>
				</tr>"
			hash_traitstatviewbyapps.delete(hash_traitstatviewbyapps.index(tab_valuestatviewbyapps[i]))
			compteur += 1	
			compteur_couleur = compteur_couleur == 0 ? 1 : 0
		}
	        affichage_valuestatviewbyapps += "</table>"
	      else
		#affichage_valuestatviewbyapps += "<li>Il n'y a pas de média consultés</li>"
	      	affichage_valuestatviewbyapps = t("statistics.not_media_consulted")
	      end
	      affichage_valuestatviewbyapps
	end

	def array_key_hash(hash)
		array_key_hachage = Array.new
		hash.each_value {|key| 
			#puts key
			array_key_hachage.push(key.to_i) 
		}

		#array_key_hachage.sort{|x,y| x <=> y }
		#for i in array_key_hachage
		#	for y in array_key_hachage
		#		if array_key_hachage[i] > array_key_hachage[y]
		#			value_tabi = array_key_hachage[i]
		#			value_taby = array_key_hachage[y]
		#			array_key_hachage[i] = value_taby
		#			array_key_hachage[y] = value_tabi
		#		end
		#	end
		#end

		#array_key_hachage.sort!
		array_key_hachage.sort {|x,y| y <=> x }
	end

	def get_top_categorie_consulted(by_date,user_role_id,groupapp_id)
		compteur_couleur = 0
		compteur = 1
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		hash_traitstatview = Hash.new
		tab_keytatview = Array.new
		traitstatview = TraitStatView.new(user_role_id,time_min,time_now)
	      #affichage_valuesstatview = "<ul class='ul_class_top_detail_stat'>"
	      unless traitstatview.get_average_categorie_consulted(groupapp_id).empty?
	      affichage_valuesstatview = "<table border='0' cellspacing='0' cellpadding='0' width='450' class='table_class_top_detail_stat'>
	      		<tr class='colonne_titre'>
	      			<td width='40' class='colonne_general_first'></td>
	      			<td width='350'>#{t("statistics.categorie")}</td>
	      			<td width='60' class='colonne_general_last'>Clique Total</td>
	      		</tr>"
	      	hash_traitstatview = traitstatview.get_average_categorie_consulted(groupapp_id)
		#tab_valuestatview = hash_traitstatview.values.sort

		tab_keystatview = array_key_hash(hash_traitstatview)	
		x = tab_keystatview.length-1 > 20 ? - (20 - tab_keystatview.length-1) : tab_keystatview.length-1

		0.upto(tab_keystatview.length-1 > 20 ? tab_keystatview.length - x : tab_keystatview.length-1){ |i|
			affichage_valuesstatview += "<tr class='class_contenu_colonne_top_stat' style='background-color:#{tab_td_style(compteur_couleur)}'>
					<td width='40' class='contenu_colonne_top_stat'>#{compteur}</td><td width='350'>#{hash_traitstatview.index(tab_keystatview[i]).nil? || hash_traitstatview.index(tab_keystatview[i]).scan(/^'(.{1,})'$/).empty? ? "" : hash_traitstatview.index(tab_keystatview[i]).scan(/^'(.{1,})'$/)[0][0]}</td><td width='60' class='colonne_general_last'>#{tab_keystatview[i]}</td>
			</tr>"	
			hash_traitstatview.delete(hash_traitstatview.index(tab_keystatview[i]))
			compteur += 1
			compteur_couleur = compteur_couleur == 0 ? 1 : 0
		}
	      	affichage_valuesstatview += "</table>"
	      else
		affichage_valuesstatview = "Il n'y a pas de catégorie"
	      end
	      affichage_valuesstatview
	end

	def get_top_media_consulted(by_date,user_role_id,groupapp_id)
		compteur_couleur = 0
		compteur = 1
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		hash_traitstatview = Hash.new
		tab_keytatview = Array.new
		traitstatview = TraitStatView.new(user_role_id,time_min,time_now)
		#affichage_valuesstatview = "<ul class='ul_class_top_detail_stat'>"
	     unless traitstatview.get_average_media_consulted(groupapp_id).empty?
		affichage_valuesstatview = "<table border='0' cellspacing='0' cellpadding='0' class='table_class_top_detail_stat' width='450'>
				<tr class='colonne_titre'>
					<td width='40' class='colonne_general_first'></td>
					<td width='350'>Média</td>
					<td width='60' class='colonne_general_last'>Clique</td>
				</tr>"
	     	hash_traitstatview = traitstatview.get_average_media_consulted(groupapp_id)
		#tab_valuestatview = hash_traitstatview.values.sort
		tab_keystatview = array_key_hash(hash_traitstatview)	
		x = tab_keystatview.length-1 > 20 ? - (20 - tab_keystatview.length-1) : tab_keystatview.length-1
		#tab_keystatview.length-1.downto(0){ |i|
		0.upto(tab_keystatview.length-1 > 20 ? tab_keystatview.length - x : tab_keystatview.length-1){ |i|
			affichage_valuesstatview += "<tr class='class_contenu_colonne_top_stat' style='background-color:#{tab_td_style(compteur_couleur)};'>
					<td width='40' class='contenu_colonne_top_stat'>#{compteur}</td>
					<td width='350'>#{hash_traitstatview.index(tab_keystatview[i]).nil? || hash_traitstatview.index(tab_keystatview[i]).scan(/^.{1,}\/(.{1,}..{1,}).{1,}$/).empty? ? "" : hash_traitstatview.index(tab_keystatview[i]).scan(/^.{1,}\/(.{1,}..{1,}).{1,}$/)[0][0]}</td>
					<td width='60' class='colonne_general_last'>#{tab_keystatview[i]}</td>	
					</tr>"
			hash_traitstatview.delete(hash_traitstatview.index(tab_keystatview[i]))
			compteur += 1
			compteur_couleur = compteur_couleur == 0 ? 1 : 0
		}
	     	affichage_valuesstatview += "</table>"
	     else
		#affichage_valuesstatview += "<li>Il n'y a pas de média enregistré</li>"	 
		affichage_valuesstatview = "Il n'y a pas de média enregistré"	
	     end
	     	affichage_valuesstatview
	end

	def get_stat_click_apps(by_date,application_id)
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		traitstatview = TraitStatByApps.new(application_id,time_min,time_now)
		g = Gruff::Bar.new
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		g.data(t("statistics.number_medias_consulted_#{by_date}"), traitstatview.get_stat_click_by_apps)
		#g.labels = { 0 => Time.at(time_min).strftime("%d/%m/%Y %H:%M"), traitstatview.get_stat_click_by_apps.length - 1 => Time.at(time_now).strftime("%d/%m/%Y %H:%M")}
		g.labels = traitstatview.get_label_graph
		@nombre_medias_consultes = traitstatview.get_average_media_by_apps
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_click_by_apps.png")
		"#{image_tag("img_graphique/graphique_click_by_apps.png", :size=>"450x400")}"
	end


	def get_stat_click_viewsql(by_date,user_role_id,groupapp_id)
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]	
		traitstatview = TraitStatView.new(user_role_id,time_min,time_now)
		g = Gruff::Bar.new
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		g.data(t("statistics.number_medias_consulted_#{by_date}"), traitstatview.get_stat_click(groupapp_id))
		#g.labels = { 0 => Time.at(time_min).strftime("%d/%m/%Y %H:%M"), traitstatview.get_stat_click(groupapp_id).length - 1 => Time.at(time_now).strftime("%d/%m/%Y %H:%M")} 
		g.labels = traitstatview.get_label_graph
		@nombre_mediaconsultes = traitstatview.get_average_media_by_groupapps(groupapp_id)
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_click.png")
		"#{image_tag("img_graphique/graphique_click.png", :size=>"450x400")}"
	end

	def get_stat_session_viewsql_by_apps(by_date,application_id)
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]	
		traitstatview = TraitStatByApps.new(application_id,time_min,time_now)
		g = Gruff::Bar.new
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		g.data(t("statistics.number_user_connected_#{by_date}"), traitstatview.get_stat_session_by_apps)
		#g.labels = { 0 => Time.at(time_min).strftime("%d/%m/%Y %H:%M"), traitstatview.get_stat_session_by_apps.length - 1 => Time.at(time_now).strftime("%d/%m/%Y %H:%M")}
		g.labels = traitstatview.get_label_graph
		@nombre_total_session = traitstatview.get_number_session_by_day_by_apps
		@average_media_session = get_time_format_duration(traitstatview.get_average_media_session_by_apps, "by_sessions_totals")
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_session_by_apps.png")
		"#{image_tag("img_graphique/graphique_session_by_apps.png", :size=>"450x400")}"
	end
	
	def get_stat_session_viewsql(by_date,user_role_id,groupapp_id)	
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]	
		traitstatview = TraitStatView.new(user_role_id,time_min,time_now)
		g = Gruff::Bar.new
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		g.data(t("statistics.number_user_connected_#{by_date}"), traitstatview.get_stat_session(groupapp_id))
		#g.labels = { 0 => Time.at(time_min).strftime("%d/%m/%Y %H:%M"), traitstatview.get_stat_session(groupapp_id).length - 1 => Time.at(time_now).strftime("%d/%m/%Y %H:%M")} 	
		g.labels = traitstatview.get_label_graph
		#@nombre_session = traitstatview.nb_total
		@nombre_session = traitstatview.get_number_session_by_day_by_groupapps(groupapp_id)
		@average_media_session = get_time_format_duration(traitstatview.get_average_media_session(groupapp_id), "by_sessions_totals")
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_session.png")
		"#{image_tag("img_graphique/graphique_session.png", :size=>"450x400")}"
	end

        def get_stat_by_type(table,colonne,by_date,user_role_id,groupapp_id)
		compteur = 0
		time_now = get_date(by_date)[0]
		time_min = get_date(by_date)[1]
		array_apps_type = Array.new
		applications = Application.find(:all, :conditions=>"role_id=#{user_role_id} and groupapp_id=#{groupapp_id}")
		applications.each{ |application|
			array_apps_type.push(application.serial)
		}

		tab_array_stat = Array.new
		table_requete = Statistic::Table.find_by_name(table)
		colonne_time = table_requete.colonnes.find(:first, :conditions=>"time_column=1")
		traitStatistique = TraitGlobalStatDate.new(table_requete,time_min.to_i,time_now.to_i,user_role_id,colonne_time.id)				
		g = Gruff::Line.new
		#g.title = "machines actives par machines déployés"	
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		traitStatistique.get_array_session_by_day(array_apps_type,colonne)		
		array_order_time = traitStatistique.array_time
		if table == "Users_Sessions" && colonne == "nbWidgetsConsulted"
			#traitStatistique = TraitGlobalStatDate.new()
		      unless traitStatistique.hash_time_colonne_gruff.empty?	
			hash_graphique = traitStatistique.hash_time_colonne_gruff
		        0.upto(array_order_time.length-1){ |i|	
				#hash_graphique.each{ |key, value|
				#	tab_array_stat.push(value.to_i)
				#	compteur += value.to_i
				#}
				tab_array_stat.push(hash_graphique[array_order_time[i]])
				compteur += hash_graphique[array_order_time[i]]
			}

			#g.data("click", tab_array_stat)
		      end
		else
		      unless traitStatistique.hash_time_colonne_gruff_compteur.empty?
			hash_graphique = traitStatistique.hash_time_colonne_gruff_compteur
			#hash_graphique.each{ |key, value|
			#	tab_array_stat.push(value.to_i)
			#	compteur += value.to_i
			#}
			0.upto(array_order_time.length-1){ |i|
				tab_array_stat.push(hash_graphique[array_order_time[i]])
				compteur += hash_graphique[array_order_time[i]]
			}

			#g.data(colonne.to_s, tab_array_stat)
		       end
		end
		     unless tab_array_stat.empty?	
			g.data(t("statistics.#{table.to_s}_#{colonne.to_s}"), tab_array_stat)
			#g.labels = traitStatistique.get_label_time
			g.labels = { 0 => Time.at(time_min).strftime("%d/%m/%Y %H:%M"), tab_array_stat.length - 1 => Time.at(time_now).strftime("%d/%m/%Y %H:%M")} 
			g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{table}_#{colonne}.png")	
			"#{t("statistics.phrase_gen")} #{compteur} #{t("statistics.#{table.to_s}_#{colonne.to_s}")}<br>#{image_tag("img_graphique/graphique_#{table}_#{colonne}.png", :size=>"450x400")}"
		     else
			t("statistics.not_statistics")
		     end
	end

	def stat_by_type_apps(traitstatview,user_role_id)
		compteur = 0
		result_statistic_by_type_apps = ""
		#classmoyennebytypeapps = ClassMoyenneByTypeApps.new(user_role_id,Statistic::Table.find_by_name("Users_Sessions"))
		#array_apps_user_role = classstatmoyenneapps.get_apps_user_role
		#0.upto(array_apps_user_role.length-1){ |i|
				
		#}
		applications = Application.find(:all, :conditions=>"role_id=#{user_role_id}", :group=>:groupapp_id)
		applications.each{ |application|
			result_statistic_by_type_apps += "<li class='#{compteur == 0 ? "class_stat_by_type" : "class_stat_by_type_right"}'>"
				result_statistic_by_type_apps += "<p class='p_class_titre_apps_group_name'>#{link_to application.groupapp.name, :controller=>"statistics", :action=>"show", :id=>application.groupapp.name, :role_id=>user_role_id}</p>"
				result_statistic_by_type_apps += "<span class='span_class_chiffres_stat'>#{traitstatview.get_number_session_by_day_by_groupapps(application.groupapp_id)}</span> #{t("statistics.sessions_by_day")}<br>" 
				result_statistic_by_type_apps += "<span class='span_class_chiffres_stat'>#{traitstatview.get_average_media_by_groupapps(application.groupapp_id)}</span> #{t("statistics.medias_consultes")}<br>"
				#result_statistic_by_type_apps += "<span class='span_class_chiffres_stat'>#{format("%.2f", traitstatview.get_moyenne_duration_session_by_day_by_grouaps(application.groupapp_id))}</span> #{t("statistics.minutes_by_sessions")}"
				result_statistic_by_type_apps += get_time_format_duration(traitstatview.get_moyenne_duration_session_by_day_by_grouaps(application.groupapp_id), "by_sessions")
			result_statistic_by_type_apps += "</li>"
		compteur  = (compteur == 0 ? 1 : 0) 	
		}
		#result_statistic_by_type_apps += "<li class='class_stat_by_type_right'>TestNicolas<br>800 sessions par jour<br>4012 médias consultés<br>5 min par session</li>"
		result_statistic_by_type_apps
	end

	def get_session_total_today(user_role_id)
		table_users_sessions = Statistic::Table.find_by_name("Widgets_Consulted")
		colonne_id_time = table_users_sessions.colonnes.find(:first, :conditions=>"time_column=1").id
		time_now = Time.now.to_i
		time_min = time_now - 86400

		class_stat_session_today = TraitGlobalStatDate.new(table_users_sessions,time_min,time_now,user_role_id,colonne_id_time)
		class_stat_session_today.total_session_by_day(class_stat_session_today.get_apps_user_role,"sessionId")
	end

	def get_img_stat_global_apps_type_apps(role_id)
		get_stat_global_apps_type_apps(role_id)
		"#{image_tag("img_graphique/graphique_applications_by_groupapp/graphique_global_apps_groupapps_#{role_id}.png", :size=>"500x400")}"
	end

	def get_stat_global_apps_type_apps(role_id)
		#tab_roles = get_roles(current_user.role_id).to_s
		#tab_roles.split("-")
		#application_chiffre = "<ul>"
		tab_nb_applications_by_groupapps = Application.count(:all, :conditions=>"role_id=#{role_id}", :group=>"groupapp_id")
	     unless tab_nb_applications_by_groupapps.empty?
		g = Gruff::Pie.new
		g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		}
		#g.title = "Nombre d'applications par type application"
		tab_nb_applications_by_groupapps.each { |key,value|
			#g.data(application.name, )
			g.data(Groupapp.find(key).name, value)
			#application_chiffre += "<li>#{Groupapp.find(key).name} : #{value}</li>"
		}
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_applications_by_groupapp/graphique_global_apps_groupapps_#{role_id}.png")
		
		#"#{application_chiffre}</ul> #{image_tag("img_graphique/graphique_applications_by_groupapp/graphique_global_apps_groupapps_#{role_id}.png", :size=>"450x400")}"
	     
		#"#{image_tag("img_graphique/graphique_applications_by_groupapp/graphique_global_apps_groupapps_#{role_id}.png", :size=>"500x400")}"
	     	true
	     else
		     false
	     end
	end

        def get_stat_with_define_type(user_role_id,type_apps)
		ClassMoyenneByTypeApps.new(user_role_id,type_apps,Statistic::Table.find_by_name("Users_Sessions"))		
	end	

	def set_url_roles_statistics_general(role_id)	
		roles = Role.find(:all, :conditions=>"role_id=#{role_id}")
			     tab_roles = role_id.to_s
			     unless roles.empty?
				roles.each{ |role|
					tab_roles += "-#{set_url_roles_statistics_general(role.id).to_s}"
				}					
			     end
		tab_roles
	end

	def get_stat_machines_actives_desactives(user_role_id)
		tab_array_time = Array.new
		tab_result_machines_actives_desactives = Array.new
		time_now = Time.now
		time_24h = Time.now - 86399
		#TraitGlobalStatDate.new("Pings",time_24h.day,time_24h.month,time_24h.year,time_24h.hour,time_24h.min,time_now.day,time_now.month,time_now.year,time_now.hour,time_now.min,current_user.role_id,colonne.id)
		traitstatmachinesactives = TraitStatMachinesActives.new(user_role_id,time_24h,time_now)
		hash_stat_machines_actives = traitstatmachinesactives.get_stat_machines_actives
	        #nb_machines_totales = traitstatmachinesactives.get_nb_machines_totales?
	      unless hash_stat_machines_actives.empty?
		g = Gruff::Line.new
		g.title = "machines actives par machines déployés"	
		g.theme = {
   			:colors => %w(yellow red green white blue),
   			:marker_color => 'red',
   			:background_colors => 'white'
		}
		hash_stat_machines_actives.each{ |key, value|
			#Rails.logger.info "value_stat_machines_actives-=-=-=-=-=-=-#{value}-=-=-=-=-=-=-=-"
			tab_result_machines_actives_desactives.push(value)
		}

		#Rails.logger.info "value_stat_machines_actives-=-=-=-=-=-=-#{tab_result_machines_actives_desactives}-=-=-=-=-=-=-=-"
		g.data("machines actives", tab_result_machines_actives_desactives)
		g.labels = traitstatmachinesactives.get_time_graph
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_machines_actives_by_machines_deployes/graphique_machines_actives_by_machines_deployes_#{user_role_id}.png")	
		"Nombre de machines actives totales : #{traitstatmachinesactives.nb_total} <br> #{image_tag("img_graphique/graphique_machines_actives_by_machines_deployes/graphique_machines_actives_by_machines_deployes_#{user_role_id}.png", :size=>"450x400")}"
	      else
			"Il n'y a pas de groupe d'application pour ce groupe d'utilisateur" 
	      end
	end

	def get_url_roles_statistics_general(role_id)
		tab_roles = set_url_roles_statistics_general(role_id).to_s
		tab_roles = tab_roles.split("-")
	end

	def get_roles_apps_stat(current_user_role_id,tab_applications,look_apps)	
		roles = Role.find(:all, :conditions=>"role_id=#{current_user_role_id}")
	       
	       unless roles.empty?
		 result_role_statistic = "<ul>"
	      		roles.each do |role|
				result_role_statistic += "<li>#{check_box_tag("applications_roles", role.id, false, :class=>"checkbox_roles_apps")} #{link_to role.name, "#ancre_#{role.id}", :id=>"id_link_name_role_#{role.id}"}"
					unless role.applications.empty?
						result_role_statistic += "<ol id='ol_id_applications_#{role.id}' style='display:none;' name='ancre_#{role.id}'>"
						role.applications.each{ |application|
							result_role_statistic += "<li>#{check_box_tag("visugraph[application_id][]", application.id, (tab_applications != false ? tab_applications.include?(application.id.to_s) : false ), {:class => "application_cb"})} #{application.name} #{application.serial}</li>"	
						}
						result_role_statistic += "</ol>"
					end
						result_role_statistic += get_roles_apps_stat(role.id,tab_applications,look_apps) unless get_roles_apps_stat(role.id,tab_applications,look_apps) == 0	
			end	
		 result_role_statistic += "</ul>"
	       else
		       0
	       end
	end

	private
	def get_parent_home_applications(user_role_id,params_role_id)
		tab_role = Array.new 
		tab_role.push(params_role_id)
		while user_role_id != params_role_id do 
			role = Role.find(params_role_id)
			tab_role.push(role.role_id)
			params_role_id = role.role_id
		end

		tab_role
	end
end

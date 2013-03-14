require "#{RAILS_ROOT}/app/controllers/trait_stat_global.rb"
require "#{RAILS_ROOT}/app/controllers/stat_global_pie.rb"
class GestionConfSupStatistique
	CONF_PATH = "#{RAILS_ROOT}/config/conf_delete_stat.yml"
	
	def initialize	
		@time_now = Time.now
		@configurationstat = YAML::load_file(CONF_PATH)
	end

	def conf_delete_stat
		statistics = Statistic::Contenu.find :all
		statistics.each{ |statistic|
			Statistic::Contenu.delete(statistic.id) if calcul_sup_statistique(statistic.created_at.to_i) 
		}
	end

	def index
		time_now = Time.now
		time_24h = Time.now - 86399	
		table_path = Statistic::Table.find(47)
		colonne = table_path.colonnes.find(:first, :conditions=>"time_column=1")
		traitglobalstatdate = TraitGlobalStatDate.new(table_path,time_24h.day,time_24h.month,time_24h.year,time_24h.hour,time_24h.min,time_now.day,time_now.month,time_now.year,time_now.hour,time_now.min,current_user.role_id,colonne.id)
		Rails.logger.info "=-=-=-=-=-=-=-=-#{@nbr}-=-=-=-=-=-=-=-=-=-"
		render :text=>"dfdsfsdfsdf"
	end

	private
	def calcul_sup_statistique(time_stat)
		dureesup = @configurationstat["supstat"]["delete"]
		unite = @configurationstat["supstat"]["unite"]
		resultat = false
		case unite
			when "month"
			     if Time.at(time_stat).year < @time_now.year
			   	diff_mois = 12 - Time.at(time_stat).month
				diff_mois = diff_mois + @time_now.month
			     else
				diff_mois = @time_now.month - Time.at(time_stat).month
			     end		         	
				resultat = diff_mois > dureesup ? true : false  
			when "day"
				time_difference_sec = ( time_stat > @time_now ? time_stat - @time_now : @time_now - time_stat )
				time_minute = time_difference_sec / 60
				time_heure = time_minute / 60
				time_jour = time_heure / 24
				time_jour_conf = dureesup
				resultat = time_jour.round > time_jour_conf ? true : false
		end
		resultat
	end
end

class GestionConfStatistique 
	CONF_PATH = "#{RAILS_ROOT}/config/conf_gestion_stat.yml"
	def initialize(nomcolonne)
		@nomcolonne = nomcolonne
		@configurationstat = YAML::load_file(CONF_PATH)
	end

	def verif_conf?
		@configurationstat[@nomcolonne].nil?
	end

	def statcolonne(recupinfo)
			conditioncolonne = @configurationstat[@nomcolonne]
			conditioncolonne[recupinfo]
	end
end

class StatisticsController < ApplicationController
        skip_before_filter :verify_authenticity_token
  	#before_filter :verifier_acces_admin, :except=>[:new]
	def new
	end

	def initialize
	end

	def categoriecolonne
		@categoriecolonnetables = Statistic::Categoriecolonnetable.find :all, :order=>:position
	end

	def newcategoriecolonnetables
	     @tables = Statistic::Table.find :all
	     if flash[:categoriecolonnetable].nil?
		@categoriecolonnetable = Statistic::Categoriecolonnetable.new
	     else
		@categoriecolonnetable = flash[:categoriecolonnetable]
	     end
	end

	def createnewcategoriecolonnetables
		@categoriecolonnetable = Statistic::Categoriecolonnetable.new(params[:categoriecolonnetable])

		if @categoriecolonnetable.save
			flash[:notice] = "L'enregistrement de cette nouvelle catégorie s'est bien déroulé elle est désormais disponible"
			redirect_to :controller=>"statistics", :action=>"categoriecolonne"
		else
			flash[:categoriecolonnetable] = @categoriecolonnetable
			flash[:notice] = "L'enregistrement de cette nouvelle catégorie ne s'est pas déroulé correctement elle n'est pas disponible"
			redirect_to(:back)
		end
	end

	def statistiquesprincipal
	     if flash[:categorieindex].nil?
		@categorieindex = Statistic::Categorieindex.new
	     else
		@categorieindex = flash[:categorieindex]
	     end
	end

	def destroystatistiquecategorie
		
	end

	def updatestatistiquesprincipal
	     @tab_categoriecolonnetable = params[:categoriecolonnetable][:id]
	     @tab_categoriecolonnetable_imagegrand = params[:categoriecolonnetable][:imagegrand]
	
	     @categorieindex = Statistic::Categorieindex.find(params[:categorieindex][:id])
	    
	    @categorieindex.posseders.destroy_all 
  	    if @categorieindex.update_attributes(params[:categorieindex])			
		Statistic::Posseder.create(:categorieindex_id=>@categorieindex.id, :categoriecolonnetable_id=>@tab_categoriecolonnetable[i], :imagegrand=>@tab_categoriecolonnetable_imagegrand.nil? ? false : @tab_categoriecolonnetable_imagegrand.include?(@tab_categoriecolonnetable[i]), :affichagenombrestatglobal=>@tab_categoriecolonnetable_affichagenombrestatglobal.nil? ? false : @tab_categoriecolonnetable_affichagenombrestatglobal.include?(@tab_categoriecolonnetable[i]))
	    	  flash[:notice] = "La mise à jour de cette catégorie de statistique s'est bien déroulé elle est désormais disponible"
	    else
		  flash[:notice] = "La mise à jour de cette catégorie de statistique ne s'est pas déroulé  correctement elle n'est pas disponible"
	    end
	    redirect_to :controller=>"statistics", :action=>"statistiquesprincipalindex"
	end

	def validstatistiquesprincipal
	     @tab_categoriecolonnetable = params[:categoriecolonnetable][:id]
	     @tab_categoriecolonnetable_imagegrand = params[:categoriecolonnetable][:imagegrand]
	     @tab_categoriecolonnetable_affichagenombrestatglobal = params[:categoriecolonnetable][:affichagenombrestatglobal]
	     @categorieindex = Statistic::Categorieindex.new(params[:categorieindex])
	     @categorieindex.posseders.destroy_all
	     if @categorieindex.save
		0.upto(@tab_categoriecolonnetable.length-1){ |i|	
			Statistic::Posseder.create(:categorieindex_id=>@categorieindex.id, :categoriecolonnetable_id=>@tab_categoriecolonnetable[i], :imagegrand=>@tab_categoriecolonnetable_imagegrand.nil? ? false : @tab_categoriecolonnetable_imagegrand.include?(@tab_categoriecolonnetable[i]), :affichagenombrestatglobal=>@tab_categoriecolonnetable_affichagenombrestatglobal.nil? ? false : @tab_categoriecolonnetable_affichagenombrestatglobal.include?(@tab_categoriecolonnetable[i]))
		}
		flash[:notice] = "L'enregistrement de cette catégorie s'est bien déroulé elle est désormais disponible"
	     else
		flash[:notice] = "L'enregistrement de cette catégorie ne s'est pas déroulé correctement elle n'est pas disponible" 
		flash[:categorieindex] = @categorieindex
	     end
		redirect_to :controller=>"statistics", :action=>"statistiquesprincipalindex"
	end

	def delete_stat
	end

	def get_stat_pie24h(colonne_name,colonne_id,time_now,time_24h)
		stat_graph_global_pie = StatGlobalPie.new(colonne_id,time_24h,time_now)
		tab_hash_total = stat_graph_global_pie.get_stat
		g = Gruff::Pie.new
		g.title = "Les 10 #{colonne_name} les plus consultés"
		compteur = 0
		0.upto(tab_hash_total.length-1){ |i|
			if compteur < 10
				g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
			else
				i = tab_hash_total.length - 1
                        end
		compteur += 1
		} 
		g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_camembert_topics_#{time_24h.to_i}_#{time_now.to_i}.png") 
		"/images/img_graphique/graphique_camembert_topics_#{time_24h.to_i}_#{time_now.to_i}.png"
	end

	def index
		@tab_categorieindex = Statistic::Categorieindex.find :all
		@time_now = Time.now
		@time_24h = Time.now - 86399

		array_colonne_gruff = Array.new
		hash_time_label = Hash.new
		hash_colonne_gruff = Hash.new
		hash_time_colonne_special = Hash.new
		tab_colonne_gruff = Array.new
		hash_time_colonne_gruff = Hash.new
		g = Gruff::Line.new
		g.title = "Chemins demandés"
		GestionConfSupStatistique.new.conf_delete_stat	
		@table_info_visugaph = Statistic::Table.find :all, :conditions=>"choixaffichage=1"	
		time_now = Time.now
		time_24h = Time.now - 86399
		table_path = Statistic::Table.find(47)
		colonne = table_path.colonnes.find(:first, :conditions=>"time_column=1")
		traitglobalstatdate = TraitGlobalStatDate.new(table_path,time_24h,time_now,current_user.role_id,colonne.id)
		@nbr = traitglobalstatdate.trait_stat_total
		array_colonne_gruff = traitglobalstatdate.trace_graph_total 
			g.data("Statistique global", array_colonne_gruff)
			g.labels = traitglobalstatdate.get_label_time
			g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_graph_path_#{time_now.to_i}_#{time_24h.to_i}_donnee_recu_general.png")
			@img_total_path = "/images/img_graphique/graphique_graph_path_#{time_now.to_i}_#{time_24h.to_i}_donnee_recu_general.png"

			#-=-=-=-=-=-=-=-=-=-=- Camembert des 10 topics les plus utilisés -=-=-=-=-=-=-=-=-=-=-=-#
				stat_graph_global_pie = StatGlobalPie.new(302,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat 
				g =  Gruff::Pie.new
				g.title = "Les 10 univers les plus consultés"
							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							     compteur += 1
							}

				@image_visugraph_topic_util = "/images/img_graphique/graphique_camembert_topics_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_camembert_topics_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_visugraph_topic_util

			#=-=-=-=-=-=-=-=-=-=-=-=-Camembert shop consulted=-=-=-=-=-=-=-=-=-=-#	
				stat_graph_global_pie = StatGlobalPie.new(297,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat 
				g =  Gruff::Pie.new
				g.title = "Les 10 univers les plus consultés"

							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							    compteur += 1
							}

				@image_shop_util = "/images/img_graphique/graphique_shop_topics_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_shop_topics_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_shop_util

			#=-=-=-=-=-=-=-=-=-=-=- Mediawall -=-=-=-=-=-=-=-=-=-=-=-=-#	
			g = Gruff::Line.new
			tab_colonne_gruff = Array.new
			g.title = "Mediawall demandés"
			table_mediawall = Statistic::Table.find(55)
			colonne_mediawall = table_mediawall.colonnes.find(:first, :conditions=>"time_column=1")
     			#tab_applications = Application.find :all, :joins=>[:roles], :conditions=>"role_id=#{current_user.role_id}", :page => params[:page], :order => "position"
			traitglobalstatdate = TraitGlobalStatDate.new(table_mediawall,time_24h,time_now,current_user.role_id,colonne_mediawall.id)
			@nbr_mediawall = traitglobalstatdate.trait_stat_total
			array_colonne_gruff = Array.new
			array_colonne_gruff = traitglobalstatdate.trace_graph_total 

			g.data("Statistique global", array_colonne_gruff)
			g.labels = traitglobalstatdate.get_label_time
			g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_graph_mediawall_#{time_now.to_i}_#{time_24h.to_i}_donnee_recu_general.png")
			@img_total_mediawall = "/images/img_graphique/graphique_graph_mediawall_#{time_now.to_i}_#{time_24h.to_i}_donnee_recu_general.png"

			#=-=-=-=-=-=-=-=-=-=-=-=-=-=-Widgets consulted  (produits les plus demandés)=-=-=-=-=-=-=-=-=-=-=-=-#
				stat_graph_global_pie = StatGlobalPie.new(277,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat
				g =  Gruff::Pie.new
				g.title = "Les 10 produits les plus consultés"
							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							     compteur += 1
							}

				@image_widget_consulted_util = "/images/img_graphique/graphique_widget_consulted_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_widget_consulted_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_widget_consulted_util

				#-=-=-=-=-=-=-=-=-=-=-=-=-=-Categories Consulted-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#	
				stat_graph_global_pie = StatGlobalPie.new(265,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat
				g =  Gruff::Pie.new
				g.title = "Les 10 catégories les plus consultés"
							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							     compteur += 1
							}

				@image_widget_categoryname_util = "/images/img_graphique/graphique_widget_categoryname_util_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_widget_categoryname_util_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_widget_categoryname_util

				#-=-=-=-=-=-=-=-=-=-=- Interfaces consulted -=-=-=-=-=-=-=-#	
				stat_graph_global_pie = StatGlobalPie.new(271,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat
							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							     compteur += 1
							}

				@image_widget_interfacesconsulted_util = "/images/img_graphique/graphique_widget_interfacesconsulted_util_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_widget_interfacesconsulted_util_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_widget_interfacesconsulted_util

				#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Widgets in category consulted-=-=-=-=-=-=-=-=-=-=-=-#	
				stat_graph_global_pie = StatGlobalPie.new(284,time_24h,time_now)
				tab_hash_total = stat_graph_global_pie.get_stat
				g =  Gruff::Pie.new
				g.title = "Les 10 catégories les plus consultés #{Time.at(time_24h.to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s} au #{Time.at(time_now.to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s}"
							compteur = 0
							0.upto(tab_hash_total.length-1){ |i|
							     if compteur < 10
								g.data("#{tab_hash_total[i][0]}", tab_hash_total[i][1])
							     else
								i = tab_hash_total.length - 1 
							     end
							     compteur += 1
							}

				@image_widget_in_category_consulted_util = "/images/img_graphique/graphique_widget_in_category_consulted_util_#{time_24h.to_i}_#{time_now.to_i}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_widget_in_category_consulted_util_#{time_24h.to_i}_#{time_now.to_i}.png")
				@image_widget_in_category_consulted_util

	end

	def menu
		@table = Statistic::Table.find :all 
	end

	def create
	      @user_session = UserSession.new(params[:users])
		
		if @user_session.save
			unless params[:statistic][:file].nil?
				Statistic.worksqlite(params[:statistic])
				render :text => "1"
			else
				render :text => "0"
			end
		else
		   render :nothing => false, :status => "404"
		   render :text => "0"
		end
	end

	def update_colonne_table
		@tables = Statistic::Table.find :all
		if flash[:categoriecolonnetable].nil?
			@categoriecolonnetable = Statistic::Categoriecolonnetable.find(params[:id])
		else
			@categoriecolonnetable = flash[:categoriecolonnetable]
		end	
	end

	def valid_update_colonne_table
		params[:categoriecolonnetable][:colonne_ids] ||= []
		params[:categoriecolonnetable][:role_ids] ||= []
		@categoriecolonnetable = Statistic::Categoriecolonnetable.find(params[:categoriecolonnetable][:id])

		if @categoriecolonnetable.update_attributes(params[:categoriecolonnetable])
			flash[:notice] = "Les modifications concernant les catégories associant ces tables se sont bien déroulés"
			redirect_to :controller=>"statistics", :action=>"categoriecolonne"
		else
			flash[:categoriecolonnetable] = @categoriecolonnetable

			flash[:notice] = "Les modifications concernant les catégories associant ces tables ne se sont pas déroulés correctement "
			redirect_to(:back)
		end
	end

	def statcomparate
		#@tab_image_visugraph = generategraph(params[:comparaisonstat][:application_id],params[:comparaisonstat][:table_id],params[:comparaisonstat][:choix_colonne],params[:comparaisonstat][:period],params[:fromdate],params[:todate],1)
		hash_result = generategraph(params[:comparaisonstat][:application_id],params[:comparaisonstat][:table_id],params[:comparaisonstat][:choix_colonne],params[:comparaisonstat][:period],params[:fromdate],params[:todate],1,params[:comparaisonstat][:categoriecolonnetables])
		@tab_image_visugraph = hash_result["image_visugraph"]
		@tab_application = hash_result["application"]
		@tab_colonne = hash_result["colonne"]
	   	@period = hash_result["period"]
		@fromdate = hash_result["fromdate"]
		@todate = hash_result["todate"]
	   	@choix_category = hash_result["choix_category"]
		@check_average_apps = hash_result["check_average_apps"]
		#@tab_image_visugraph2 = generategraph(params[:visugraph2][:application_id],params[:visugraph2][:table_id],params[:visugraph2][:choix_colonne],params[:visugraph2][:period],params[:fromdate2],params[:todate2],2)
		hash_result2 = generategraph(params[:visugraph2][:application_id],params[:visugraph2][:table_id],params[:visugraph2][:choix_colonne],params[:visugraph2][:period],params[:fromdate2],params[:todate2],2,params[:visugraph2][:categoriecolonnetables])
		@tab_image_visugraph2 = hash_result2["image_visugraph"]
		@tab_application2 = hash_result2["application"]
		@tab_colonne2 = hash_result2["colonne"]
	   	@period2 = hash_result["period"]
		@fromdate2 = hash_result["fromdate"]
		@todate2 = hash_result["todate"]
	   	@choix_category2 = hash_result["choix_category"]
		@check_average_apps2 = hash_result["check_average_apps"]
	end

	def visugraph
	   #Rails.logger.info "fromdate2 = #{hash_calendar_date_select(params[:fromdate2])}"
	   #Rails.logger.info "fromdate2 = #{params[:fromdate]}"
	   hash_result = generategraph(params[:visugraph][:application_id],params[:visugraph][:table_id],params[:visugraph][:choix_colonne],params[:visugraph][:period],hash_calendar_date_select(params[:fromdate]),hash_calendar_date_select(params[:todate]),1,params[:visugraph][:categoriecolonnetables],params[:check_average_apps],params[:check_total_apps])
	   #@tab_result_graph = generategraph(params[:visugraph][:application_id],params[:visugraph][:table_id],params[:visugraph][:choix_colonne],params[:visugraph][:period],params[:fromdate],params[:todate],1)
	   @tab_result_graph = hash_result["image_visugraph"]
	   @tab_application = hash_result["application"]
	   @tab_colonne = hash_result["colonne"]
	   @period = hash_result["period"]
	   @fromdate = hash_result["fromdate"]
	   @todate = hash_result["todate"]
	   @choix_category = hash_result["choix_category"]
	   @check_average_apps = hash_result["check_average_apps"]
	   @check_total_apps = hash_result["check_total_apps"]
	end

	def sort
		params[:categoriecolonnetables].each_with_index do |id, index|
			Statistic::Categoriecolonnetable.update_all(['position=?', index+1], ['id=?', id])
		end
		render :nothing => true
	end

	def registermenutable
		flash[:notice] = t("controller.notice.statistics.registermenutable.positif")  
		@tab_info_menutable_affichagetable = params[:infomenutable][:affichagetable]
		@tab_pour_comparaison = params[:infomenutable][:comparaison]
		@tab_info_menutable_id = params[:infomenutable][:id]
		@tab_info_choixaffichage = params[:infomenutable][:choixaffichage]

		0.upto(@tab_info_menutable_id.length-1){ |i|
			unless  Statistic::Table.update(@tab_info_menutable_id[i], :affichagetable=>@tab_info_menutable_affichagetable[i], :choixaffichage=>@tab_info_choixaffichage.nil? ? false : @tab_info_choixaffichage.include?(@tab_info_menutable_id[i]))
				flash[:notice] = t("controller.notice.statistics.registermenutable.negatif") 
			end
		}

		redirect_to(:back)
	end

	def edit_colonne_table
		@table = Statistic::Table.find(params[:id])
		@colonnes = Statistic::Colonne.find :all, :conditions=>"table_id=#{params[:id]}"
	end

	def valid_edit_colonne_table
		flash[:notice] = t("controller.notice.statistics.valid_edit_colonne_table.positif") 
		@tab_colonne_id = params[:edit_colonne_table][:id]
		@tab_affichagecolonne = params[:edit_colonne_table][:affichagecolonne]
		@tab_choixaffichage = params[:edit_colonne_table][:choixaffichage]
		@tab_champsspecial = params[:edit_colonne_table][:champsspecial]
		@tab_statx = params[:edit_colonne_table][:statx]
		@tab_time_column = params[:edit_colonne_table][:time_column]
		0.upto(@tab_colonne_id.length-1){ |i|		
			unless  Statistic::Colonne.update(@tab_colonne_id[i], :affichagecolonne=>@tab_affichagecolonne[i], :choixaffichage=>@tab_choixaffichage.include?(@tab_colonne_id[i]), :statx=>@tab_statx.include?(@tab_colonne_id[i]), :time_column=>@tab_time_column.include?(@tab_colonne_id[i]), :champsspecial=>@tab_champsspecial.include?(@tab_colonne_id[i]))
				flash[:notice] = t("controller.notice.statistics.valid_edit_colonne_table.negatif") 
			end
		}
		redirect_to(:back)
	end

	def sup_colonnetable
		@colonne = Statistic::Colonne.find(params[:id])
		@colonne.destroy
		redirect_to(:back)	
	end

	def sup_tables
		@table = Statistic::Table.find(params[:id])
		@table.destroy
		redirect_to(:back)
	end

	def destroycategoriecolonnetables
		@categoriecolonnetables = Statistic::Categoriecolonnetable.find(params[:id])
		@categoriecolonnetables.destroy
		@categoriecolonnetables.colonnes.destroy_all
		redirect_to(:back)
	end

	def destroy_contenu_table
		flash[:notice] = t("controller.notice.destroy_contenu_table.positif") 
		fromdate = hash_calendar_date_select(params[:fromdate])
		fromdatenormal = Time.local(fromdate["year"].to_i,fromdate["month"].to_i,fromdate["day"].to_i,fromdate["hour"].to_i,fromdate["minute"].to_i,0)
		todate = hash_calendar_date_select(params[:todate])
		todatenormal =  Time.local(todate["year"].to_i,todate["month"].to_i,todate["day"].to_i,todate["hour"].to_i,todate["minute"].to_i,0)
		@table = Statistic::Table.find(params[:table][:id])
		if params[:table][:remove_table].to_i == 1	
		    @table.destroy 
		else
	            if params[:table][:remove_column].to_i == 1
			@table.colonnes.destroy_all
		    else
			@table.colonnes.each{ |colonne|
				tab_contenu = params[:table][:all_contenu] == 1 ? colonne.contenus.find(:all) : colonne.contenus.find(:all, :conditions=>"created_at>'#{fromdate}' and created_at<'#{todate}'")
				tab_contenu.each do |contenu|
					unless contenu.delete
			  	   		flash[:notice] = t("controller.notice.destroy_contenu_table.negatif")
					end
				end
			}
                     end
		end
			redirect_to :controller=>"statistics", :action=>"menu"
	end

	private
	def get_month?(month)	
		month_integer = ""
		case month
			when "January"
				month_integer = 1

			when "February"
				month_integer = 2

			when "March"
				month_integer = 3

			when "April"
				month_integer = 4

			when "May"
				month_integer = 5

			when "June"
				month_integer = 6

			when "July"
				month_integer = 7

			when "August"
				month_integer = 8

			when "September"
				month_integer = 9

			when "October"
				month_integer = 10

			when "November"
				month_integer = 11

			when "December"
				month_integer = 12
		end
		month_integer
	end
	
	def get_hour?(hour,am_pm)
		if am_pm == "PM"
			case hour
				when 1
					hour = 13

				when 2
					hour = 14

				when 3
					hour = 15

				when 4
					hour = 16

				when 5
					hour = 17

				when 6
					hour = 18

				when 7
					hour = 19

				when 8
					hour = 20

				when 9
					hour = 21

				when 10
					hour = 22

				when 11
					hour = 23	
			end
		   end
			hour
	end	

	def hash_calendar_date_select(time_calendar)
		hash_time = Hash.new
		tab_time = time_calendar.split(" ")
	        hash_time = {"minute" => tab_time[3].split(":")[1].to_i, "month" => get_month?(tab_time[0].to_s), "hour" => get_hour?(tab_time[3].split(":")[0].to_i,tab_time[4]), "day" => tab_time[1].to_i, "year" => tab_time[2].to_i} 
		hash_time
	end

	def hash_liste_colonne_info(table_id)
			hash_colonne = Hash.new
			tab_liste_colonne_table = Statistic::Colonne.find :all, :conditions=>"table_id=#{table_id} and choixaffichage=1"
			tab_liste_colonne_table.each{ |liste_colonne_table|
				hash_colonne[liste_colonne_table.name] = liste_colonne_table.name
			}
			hash_colonne
	end
	
	def month(month)
	     @result_month = case month
		when 1
			31
		
		when 2
			28
	
		when 3
			31

		when 4
			30

		when 5
			31

		when 6
			30

		when 7
			31

		when 8
			30

		when 9
			31

		when 10
			30

		when 11
			31
	
		when 12
			30
	      end
	end
	
	def week_gestion(day)
		@result_day = case day
			when "Monday"
			0

			when "Tuesday"
			1
			
			when "Wednesday"
			2

			when  "Thursday"
			3

			when "Friday"
			4

			when "Saturday"
			5

			when "Sunday"
			6
		end
	end

	def gestion_year(year,month_dif,month)
		if month == 1 && month_dif == 12
			year -= 1
		end
		year 	
	end

	def periodgraph(period)
		hash_time = Hash.new
		t = Time.now
		#Time.local(t.year,t.month,t.day-1,0,0,0)
		case period 
		when "today"
			hash_time["time_min"] = Time.local(t.year,t.month,t.day,0,0,0).to_i
			hash_time["time_max"] = Time.local(t.year,t.month,t.day,23,59,59).to_i	

		when "yesterday"	
			day = t.day - 1
			month = t.month
			day = month(month-1) if day < 1
			month -= 1 if day < 1
			hash_time["time_min"] = Time.local(gestion_year(t.year,month,t.month),month,day,0,0,0).to_i
			hash_time["time_max"] = Time.local(gestion_year(t.year,month,t.month),month,day,23,59,59).to_i

		when "current_week"
			month = t.month
			difference_jour = week_gestion(t.strftime('%A'))
			day = t.day.to_i - difference_jour.to_i
			day = month(month - 1) - day if day < 1
			month -= 1 if day < 1
			year = 
			hash_time["time_min"] = Time.local(gestion_year(t.year,month,t.month),month,day,0,0,0).to_i
			hash_time["time_max"] = Time.local(t.year,t.month,t.day,23,59,59).to_i

		when "last_week"
			month = t.month
			difference_jour = week_gestion(t.strftime('%A'))
			day = t.day.to_i - difference_jour.to_i
			day = month(month - 1).to_i - day.to_i if day < 1
			day_max = ( (day - 1) < 1 ? 31 : day - 1 ) 
			month -= 1 if day < 1
			day -= 7
			day = month(month - 1) - 5 if day < 1
			month -= 1 if day < 1
			hash_time["time_min"] = Time.local(gestion_year(t.year,month,t.month),month,day,0,0,0).to_i
			hash_time["time_max"] = Time.local(gestion_year(t.year,month,t.month),month,day_max,23,59,59).to_i		
		     

		when "current_month"
			hash_time["time_min"] = Time.local(t.year,t.month,1,0,0,0).to_i	 
			hash_time["time_max"] = Time.local(t.year,t.month,t.day,t.hour,t.min,t.sec).to_i

		when "last_month"
			hash_time["time_min"] = Time.local(gestion_year(t.year,t.month.to_i - 1,t.month),t.month.to_i - 1,1,0,0,0).to_i
			hash_time["time_max"] = Time.local(gestion_year(t.year,t.month.to_i - 1,t.month),t.month.to_i - 1,month(t.month.to_i - 1),23,59,59).to_i	
		end
		hash_time
	end

	def statistic_graph_total(colonne_id, hash_date, tab_application, numerograph)
		application_old = ""
		tab_colonne_gruff = Array.new
		tab_all_data = Array.new
			infocolonne = Statistic::Colonne.find(colonne_id)
			g = Gruff::Line.new
			g.title = infocolonne.name
			table_id = infocolonne.table_id
			colonne_table_stat_x = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and statx=1"
			colonne_id_statx = colonne_table_stat_x.id

			colonne_time = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
			time_column_id = colonne_time.id

		0.upto(tab_application.length-1){ |i|
			tab_colonne_donnee = Array.new		       
			application = Application.find(tab_application[i].to_i)
			application_serial = application.serial

			tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert

			tab_contenus.each{ |all_contenus|
				infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
			       	unless infocolonne_verif.nil?
					   infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								tab_colonne_gruff.push(table_contenu.contenu.to_i)
							end
					        else
								tab_colonne_gruff.push(0)		
						end	
				end
			}

		}
			
				   g.data(infocolonne.name, tab_colonne_gruff)
				   g.labels = {0 => Time.at(hash_date["time_min"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s, tab_colonne_gruff.length-1 => Time.at(hash_date["time_max"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s}
				   image_visugraph = "/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png"
				   g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png")
				   image_visugraph
	end
	
	def statistic_graph_average(colonne_id, hash_date, tab_application, numerograph)
		application_old = ""
		tab_colonne_gruff = Array.new
		tab_all_data = Array.new
		nombre_application = tab_application.length
			infocolonne = Statistic::Colonne.find(colonne_id)
			g = Gruff::Line.new
			g.title = infocolonne.name
			table_id = infocolonne.table_id
			colonne_table_stat_x = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and statx=1"
			colonne_id_statx = colonne_table_stat_x.id

			colonne_time = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
			time_column_id = colonne_time.id

		0.upto(tab_application.length-1){ |i|
			tab_colonne_donnee = Array.new		       
			application = Application.find(tab_application[i].to_i)
			application_serial = application.serial

			tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert

			tab_contenus.each{ |all_contenus|
				infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
			       	unless infocolonne_verif.nil?
					   infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								tab_colonne_donnee.push(table_contenu.contenu.to_i)
							end
					        else
								tab_colonne_donnee.push(0)		
						end	
				else
					if application_old != application_serial
							nombre_application -= 1
							application_old = application_serial
					end		
				end
			}

			unless tab_colonne_donnee.nil?
				tab_all_data.push(tab_colonne_donnee)
			end
		}

			0.upto(tab_all_data[0].length-1){ |i|
			     calcul = 0
			     0.upto(tab_all_data.length-1){ |e|
				calcul += tab_all_data[e][i].nil? ? 0 : tab_all_data[e][i] 	
			     }	
			     moyenne = calcul / nombre_application
			     tab_colonne_gruff.push(moyenne.to_i)			
			}
			
				   g.data(infocolonne.name, tab_colonne_gruff)
				   g.labels = {0 => Time.at(hash_date["time_min"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s, tab_colonne_gruff.length-1 => Time.at(hash_date["time_max"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s}
				   image_visugraph = "/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png"
				   g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png")
				   image_visugraph
	end

	def statistic_graph(colonne_id, hash_date, application_serial, numerograph)
		tab_colonne_gruff = Array.new
		tab_idinsert = Array.new
		hash_total = Hash.new
		infocolonne = Statistic::Colonne.find(colonne_id)
		g = Gruff::Line.new
		#g.template("/home/nicolas/my_fruity_graph.png")
		g.title = "#{infocolonne.name} #{application_serial}"
		g.theme = {
   			:colors => %w(green purple green white red),
   			:marker_color => 'red',
   			:background_colors => %w(black grey)
		}
		table_id = infocolonne.table_id
		colonne_table_stat_x = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and statx=1"
		colonne_id_statx = colonne_table_stat_x.id
					
		colonne_time = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
		time_column_id = colonne_time.id
					
		tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert
		tab_contenus.each{ |all_contenus|
		infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
			       unless infocolonne_verif.nil?
					   infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								tab_colonne_gruff.push(table_contenu.contenu.to_i)
							end
					        else
								tab_colonne_gruff.push(0)		
						end	
				end
				}

				   g.data(infocolonne.name, tab_colonne_gruff)
				   g.labels = {0 => Time.at(hash_date["time_min"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s, tab_colonne_gruff.length-1 => Time.at(hash_date["time_max"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s}
				   image_visugraph = "/images/img_graphique/graphique_#{application_serial}_#{numerograph}_#{infocolonne.name}.png"
				   g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{application_serial}_#{numerograph}_#{infocolonne.name}.png")
				   image_visugraph
	end

	def graph_bar_pie_total(colonne_id, typegraph, tab_application, hash_date, numerograph, nbrubriquecontenu)
		hash_total = Hash.new
			infocolonne = Statistic::Colonne.find(colonne_id)
			g =  (typegraph == 1 ? Gruff::Bar.new : Gruff::Pie.new)
			g.title = infocolonne.name
			table_id = infocolonne.table_id
			conf_stat = GestionConfStatistique.new(infocolonne.name)

						
			colonne_time_table_colonne = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
			time_column_id = colonne_time_table_colonne.id

			0.upto(tab_application.length-1){ |i|
				application = Application.find(tab_application[i].to_i)
				application_serial = application.serial
					
				tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert	
					tab_contenus.each{ |all_contenus|
					
					   infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
					   unless infocolonne_verif.nil?
					    	infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								#tab_idinsert.push(table_contenu.id)
								hash_total[table_contenu.contenu].nil? ? hash_total[table_contenu.contenu] = 1 : hash_total[table_contenu.contenu] += 1		
							end
						 end
					    end
					}

			}
							
						#Rails.logger.info "compteur = #{nombre_application.to_s}"
						    unless nbrubriquecontenu.nil?
							compteur = 0
					        	hash_total.each_pair{ |key, value|
							      if compteur < nbrubriquecontenu
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", value.to_i)
							       end
								compteur += 1
							}
						    else
					        	hash_total.each_pair{ |key, value|
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", value.to_i)
							}
						    end
			
				image_visugraph = "/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png")
				image_visugraph	
	end

	def graph_bar_pie_average(colonne_id, typegraph, tab_application, hash_date, numerograph, nbrubriquecontenu)
		application_old = ""
		hash_total = Hash.new
		nombre_application = tab_application.length
			infocolonne = Statistic::Colonne.find(colonne_id)
			g =  (typegraph == 1 ? Gruff::Bar.new : Gruff::Pie.new)
			g.title = infocolonne.name
			table_id = infocolonne.table_id
			conf_stat = GestionConfStatistique.new(infocolonne.name)

						
			colonne_time_table_colonne = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
			time_column_id = colonne_time_table_colonne.id

			0.upto(tab_application.length-1){ |i|
				application = Application.find(tab_application[i].to_i)
				application_serial = application.serial
					
				tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert	
					tab_contenus.each{ |all_contenus|
					
					   infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
					   unless infocolonne_verif.nil?
						application_old = application_serial
					    	infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								#tab_idinsert.push(table_contenu.id)	
								hash_total[table_contenu.contenu].nil? ? hash_total[table_contenu.contenu] = 1 : hash_total[table_contenu.contenu] += 1		
							end
						end
					   else
						if application_old != application_serial
							nombre_application -= 1
							application_old = application_serial
						end		
					   end
					}

			}
						
						#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-#{nbrubriquecontenu}-=-=-=-=-=-=-=-=-"
						#Rails.logger.info "compteur = #{tab_application.length}"
						    unless nbrubriquecontenu.nil?
							compteur = 0
					        	hash_total.each_pair{ |key, value|
							      if compteur < nbrubriquecontenu
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", (value.to_i/tab_application.length.to_i))
							      end
							      compteur += 1
							}
						    else
					        	hash_total.each_pair{ |key, value|
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", (value.to_i/tab_application.length.to_i))
							}
						    end
			
				image_visugraph = "/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{numerograph}_#{infocolonne.name}.png")
				image_visugraph	
	end

	def graph_bar_pie(colonne_id, typegraph, application_serial, hash_date, numerograph, nbrubriquecontenu)
		tab_idinsert = Array.new
		hash_total = Hash.new
				infocolonne = Statistic::Colonne.find(colonne_id)
				conf_stat = GestionConfStatistique.new(infocolonne.name)
				g =  (typegraph == 1 ? Gruff::Bar.new : Gruff::Pie.new)
				g.title = "#{infocolonne.name} #{application_serial} #{Time.at(hash_date["time_min"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s} au #{Time.at(hash_date["time_max"].to_i).strftime(I18n.locale == "fr" ? '%d-%m-%Y' : '%Y-%m-%d').to_s}"
				table_id = infocolonne.table_id
				conf_stat = GestionConfStatistique.new(infocolonne.name)

				colonne_time_table_colonne = Statistic::Colonne.find :first, :conditions=>"table_id=#{table_id} and time_column=1"
				time_column_id = colonne_time_table_colonne.id

				tab_contenus = infocolonne.contenus.find :all, :group=>:idinsert
					tab_contenus.each{ |all_contenus|
						infocolonne_verif = Statistic::Contenu.find :first, :conditions=>"idinsert=#{all_contenus.idinsert} and contenu='#{application_serial.to_s}'"
					   unless infocolonne_verif.nil?
					    	infocolonne_colonne_id = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and contenu>#{hash_date["time_min"]} and contenu<#{hash_date["time_max"]} and colonne_id=#{time_column_id}"
						unless infocolonne_colonne_id.nil?
							table_contenu = Statistic::Contenu.find :first, :conditions=>"idinsert=#{infocolonne_verif.idinsert} and colonne_id=#{colonne_id}"
							unless table_contenu.nil?
								#tab_idinsert.push(table_contenu.id)	
								hash_total[table_contenu.contenu].nil? ? hash_total[table_contenu.contenu] = 1 : hash_total[table_contenu.contenu] += 1		
							end
						end	
					   end
					}
						    unless nbrubriquecontenu.nil?
    							compteur = 0
					        	hash_total.each_pair{ |key, value|	
							      if compteur < nbrubriquecontenu
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", value)
							      end
								compteur += 1
							}
						    else
					        	hash_total.each_pair{ |key, value|	
								key = (conf_stat.verif_conf? ? key : conf_stat.statcolonne(key))	
								g.data("#{key} (#{value})", value)
							}
						    end

				image_visugraph = "/images/img_graphique/graphique_#{application_serial}_#{numerograph}_#{infocolonne.name}.png"
				g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{application_serial}_#{numerograph}_#{infocolonne.name}.png")
				image_visugraph	
	end
	
	def switch_categorie_graph(colonne_id, typegraph, hash_date, application_serial, numerograph, nbrubriquecontenu)
			typegraph == 0 ? statistic_graph(colonne_id, hash_date, application_serial, numerograph) : graph_bar_pie(colonne_id, typegraph, application_serial, hash_date, numerograph, nbrubriquecontenu)		
	end

	def switch_categorie_graph_average(colonne_id, typegraph, hash_date, tab_application, numerograph, check_average_apps, nbrubriquecontenu)
			typegraph == 0 ? statistic_graph_average(colonne_id, hash_date, tab_application, numerograph) : graph_bar_pie_average(colonne_id, typegraph, tab_application, hash_date, numerograph, nbrubriquecontenu)		

			#graph_bar_pie_average(colonne_id, typegraph, tab_application, hash_date, numerograph, nbrubriquecontenu)	
			#def graph_bar_pie_average(colonne_id, typegraph, tab_application, hash_date, numerograph)
	end

	def switch_categorie_graph_total(colonne_id, typegraph, hash_date, tab_application, numerograph, check_average_apps, nbrubriquecontenu)
			typegraph == 0 ? statistic_graph_total(colonne_id, hash_date, tab_application, numerograph) : graph_bar_pie_total(colonne_id, typegraph, tab_application, hash_date, numerograph, nbrubriquecontenu)
	end

	def stat_global_table(table_id,hash_date,application_serial,numerograph)
		array_colonne_gruff = Array.new
		hash_time_label = Hash.new
		hash_colonne_gruff = Hash.new
		hash_time_colonne_special = Hash.new
		tab_colonne_gruff = Array.new
		hash_time_colonne_gruff = Hash.new
		g = Gruff::Line.new
		table = Statistic::Table.find(table_id)
		#table = Statistic::Table.find :first, :joins=>[:colonnes], :conditions=>"time_column=1 and stat_tables.id=#{table_id}"
		table_detail_column = table.colonnes.find(:first, :conditions=>"time_column=1")
		time_column = table_detail_column.id
		g.title = "Statistique global de #{table.name}"		
		# Time minimum
		time_min = Time.at(hash_date["time_min"].to_i).strftime('%d-%m-%Y')	
		day_min = Time.at(hash_date["time_min"].to_i).strftime('%d')
		month_min = Time.at(hash_date["time_min"].to_i).strftime('%m')
		year_min = Time.at(hash_date["time_min"].to_i).strftime('%Y')
		hour_min = Time.at(hash_date["time_min"].to_i).strftime('%H')
		#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-#{hour_min}=-=-=-==-=-=-=-=-==-=-=-=-=-"
		minute_min = Time.at(hash_date["time_min"].to_i).strftime('%M')

		
		# Time maximum
		time_max = Time.at(hash_date["time_max"].to_i).strftime('%d-%m-%Y')
		day_max = Time.at(hash_date["time_max"].to_i).strftime('%d')
		month_max = Time.at(hash_date["time_max"].to_i).strftime('%m')
		year_max = Time.at(hash_date["time_max"].to_i).strftime('%Y')
		hour_max = Time.at(hash_date["time_max"].to_i).strftime('%H')
		#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-#{hour_max}=-=-=-==-=-=-=-=-==-=-=-=-=-"
		minute_max = Time.at(hash_date["time_max"].to_i).strftime('%M') 	
	
		#time = Time.local(year_min, month_min, day_min)	
		time_max_comparate = Time.local(year_max,month_max,day_max,hour_max,minute_max)
			
			traitglobalstatdate = TraitGlobalStatDate.new(table,Time.at(hash_date["time_min"].to_i),Time.at(hash_date["time_max"].to_i),current_user.role_id,time_column)
				

			#hash_colonne_gruff = traitglobalstatdate.get_hash_time_colonne_gruff
			array_colonne_gruff = traitglobalstatdate.trait_stat_time("hash_time_colonne_gruff",application_serial)

			#hash_colonne_gruff.each_pair{ |key, value|
			#	g.data(key, hash_colonne_gruff[key].values)
			#}	
		
			#hash_time_label[0] = Time.at(hash_date["time_min"].to_i).strftime(traitglobalstatdate.get_label?).to_s

			#if hash_time_colonne_gruff.length-4 > 0
				#time_2 = Time.at(hash_date["time_max"].to_i) - (traitglobalstatdate.traitement_time? * 3 )
				#hash_time_label[hash_time_colonne_gruff.length-4] = Time.at(time_2).strftime(traitglobalstatdate.get_label?).to_s	
			#end

			#taille_colonne_gruff = array_colonne_gruff.length - 1
			#taille_divise_2 = (taille_colonne_gruff/2).round
			#retaille_divise = (taille_divise_2/2).round 
			
			#time_moyenne = Time.at(hash_date["time_max"].to_i) - (traitglobalstatdate.traitement_time? / taille_divise_2)
			#time_moyenne = hash_date["time_max"].to_i / 2 
			#time_dif = Time.at(hash_date["time_max"].to_i) - Time.at(hash_date["time_min"].to_i) 
			#time_moyenne = Time.at(hash_date["time_min"].to_i) + (time_dif/2)
			#time_dif_time_moyenne = Time.at(time_moyenne.to_i) - Time.at(hash_date["time_min"].to_i)
			#time_moyenne_minimum = Time.at(hash_date["time_min"].to_i) + (time_dif_time_moyenne/2) 
			#time_moyenne_minimum = Time.at(hash_date["time_min"].to_i) + (traitglobalstatdate.traitement_time? / retaille_divise)
			#Rails.logger.info "=-=-=-=-=-=-=-=-=-=-#{(taille_divise_2/2)}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
			#dsfsdfdsfdsfdsf
			#time_moyenne_maximum = Time.at(time_moyenne.to_i) + (traitglobalstatdate.traitement_time?/retaille_divise)
			#time_moyenne_maximum = Time.at(time_moyenne).to_i + (traitglobalstatdate.traitement_time?/(retaille_divise+1))
			#time_moyenne_maximum = Time.at(hash_date["time_max"].to_i) - (time_dif_time_moyenne/2) 
			#hash_time_label[0] = Time.at(hash_date["time_min"].to_i).strftime(traitglobalstatdate.get_label?).to_s
			#hash_time_label[0 + retaille_divise] = Time.at(time_moyenne_minimum).strftime(traitglobalstatdate.get_label?).to_s
			#hash_time_label[taille_divise_2] = Time.at(time_moyenne).strftime(traitglobalstatdate.get_label?).to_s
			#hash_time_label[taille_colonne_gruff - retaille_divise] = Time.at(time_moyenne_maximum).strftime(traitglobalstatdate.get_label?).to_s
			

			#hash_time_label[hash_time_colonne_gruff.length-1] = Time.at(hash_date["time_max"].to_i).strftime(traitglobalstatdate.get_label?).to_s
			g.data("Statistique global", array_colonne_gruff)
			#g.labels = {0 => Time.at(hash_date["time_min"].to_i).strftime(traitglobalstatdate.get_label?).to_s, hash_time_colonne_gruff.length-1 => Time.at(hash_date["time_max"].to_i).strftime(traitglobalstatdate.get_label?).to_s}
			g.labels = traitglobalstatdate.get_label_time
			g.write("#{RAILS_ROOT}/public/images/img_graphique/graphique_#{numerograph}_#{application_serial.to_s}_donnee_recu_general.png")
			"/images/img_graphique/graphique_#{numerograph}_#{application_serial.to_s}_donnee_recu_general.png"	
	end 

	def generategraph(tab_application,tab_table,tab_colonne,period,fromdate,todate,numerograph,choix_category,check_average_apps,check_total_apps)	
		require "rubygems"
		require "gruff"
		@hash_result = Hash.new
		@tab_image_visugraph = Array.new
		hash_date = Hash.new
		#gestion du temps
		@hash_result["check_average_apps"] = check_average_apps
		@hash_result["period"] = period
		@hash_result["choix_category"] = choix_category
		@hash_result["application"] = tab_application
		@hash_result["check_total_apps"] = check_total_apps
		unless period == "manual" 
			hash_date = periodgraph(period)
		else
			hash_date["time_min"] = Time.local(fromdate["year"].to_i,fromdate["month"].to_i,fromdate["day"].to_i,fromdate["hour"].to_i,fromdate["minute"].to_i,0).to_i	
			@hash_result["fromdate"] = Time.local(fromdate["year"].to_i,fromdate["month"].to_i,fromdate["day"].to_i,fromdate["hour"].to_i,fromdate["minute"].to_i,0)
			hash_date["time_max"] = Time.local(todate["year"].to_i,todate["month"].to_i,todate["day"].to_i,todate["hour"].to_i,todate["minute"].to_i,0).to_i 
			@hash_result["todate"] = Time.local(todate["year"].to_i,todate["month"].to_i,todate["day"].to_i,todate["hour"].to_i,todate["minute"].to_i,0)
		end
          unless tab_application.nil?
 	   if (!tab_table.nil? && !tab_colonne.nil? && !tab_application.nil?) || choix_category.empty?
		0.upto(tab_table.length-1){ |i|
			tab_colonne_table = tab_colonne[tab_table[i]]
			unless tab_colonne_table.nil?
			     @hash_result["colonne"] = tab_colonne_table
			     0.upto(tab_colonne_table.length-1){ |i|
				infocolonne = Statistic::Colonne.find(tab_colonne_table[i])
				conf_stat = GestionConfStatistique.new(infocolonne.name.to_s)
			        0.upto(tab_application.length-1){ |u|	
				application = Application.find(tab_application[u].to_i)
				unless conf_stat.verif_conf?
					 @tab_image_visugraph.push(graph_bar_pie(tab_colonne_table[i], conf_stat.statcolonne("graph").to_s == "Pie" ? 2 : 1, application.serial, hash_date, numerograph))

				else
					@tab_image_visugraph.push(statistic_graph(tab_colonne_table[i], hash_date, application.serial.to_s, numerograph))
				end
				}	   		
			      }
			 end	
		}
	      else
			unless choix_category.empty? && tab_application.nil?
			     @categoriecolonnetables = Statistic::Categoriecolonnetable.find(choix_category)
                           if @categoriecolonnetables.table_id.nil?	
			     if check_average_apps || check_total_apps
				   typegraph = @categoriecolonnetables.typegraph	
				   @categoriecolonnetables.colonnes.each{ |colonne|
					#switch_categorie_graph_average(colonne_id, typegraph, hash_date, tab_application, numerograph, check_average_apps, nbrubriquecontenu)
				   	@tab_image_visugraph.push(check_average_apps ? switch_categorie_graph_average(colonne.id, typegraph, hash_date, tab_application, numerograph, check_average_apps, @categoriecolonnetables.nbrubriquecontenu) : switch_categorie_graph_total(colonne.id, typegraph, hash_date, tab_application, numerograph, check_total_apps, @categoriecolonnetables.nbrubriquecontenu))		
				   }
			     else
			        0.upto(tab_application.length-1){ |t|
				   application = Application.find(tab_application[t].to_i)
				   typegraph = @categoriecolonnetables.typegraph	
				   @categoriecolonnetables.colonnes.each{ |colonne|
				   			@tab_image_visugraph.push(switch_categorie_graph(colonne.id, typegraph, hash_date, application.serial, numerograph, @categoriecolonnetables.nbrubriquecontenu))		
				   }
				   #@tab_image_visugraph.push(switch_categorie_graph_bis(@categoriecolonnetables.colonnes, typegraph, hash_date, application.serial, numerograph))		
				}
			    end 
                          else

				0.upto(tab_application.length-1){ |i|
					application = Application.find(tab_application[i].to_i)
					@tab_image_visugraph.push(stat_global_table(@categoriecolonnetables.table_id,hash_date,application.serial,numerograph))
				}	
                          end
			end
	      end
	     else
		flash[:notice] = t("statistics.selection_apps") 
	     end
		@hash_result["image_visugraph"] = @tab_image_visugraph
		@hash_result
	end
end

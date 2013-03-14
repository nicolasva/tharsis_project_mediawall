class Statistic < ActiveRecord::Base
  self.abstract_class = true
  attr_accessor :file
	def self.worksqlite(statistic)
    	       require 'tempfile'
	       temp = Tempfile.new("tmap_stats_dump")
	       #Rails.logger.info "#{temp} #{statistic[:file].path}"
	       #fdsfsdfsdf
	       temp.write(`sqlite3 #{statistic[:file].path} .dump`)
	       temp.close
			table_create = ""	
			tab_colonne_create = Array.new
      			IO.readlines(temp.path, "\n").each do |line|
				Rails.logger.info line

				unless line.scan(/^CREATE TABLE '?(.{1,})?' \((.{1,})\);$/) == Array.new
					table_create = line.scan(/^CREATE TABLE '?(.{1,})?' \((.{1,})\);$/)[0][0].to_s.strip
					statistic = Statistic::Table.find_by_name(table_create)
					
					if statistic.nil?
						table = Statistic::Table.create(:name=>table_create)
					else
						table = Statistic::Table.find :first, :conditions=>"name='#{table_create}'"
					end
						
					tab_colonne_create = line.scan(/^CREATE TABLE '?(.{1,})?' \((.{1,})\);$/)[0][1].to_s.split(",")
					0.upto(tab_colonne_create.length-1){ |i|
						nom_colonne = tab_colonne_create[i].scan(/^ ?'(.{1,})'.{1,}$/)[0][0]
						verif_colonne = Statistic::Colonne.find :first, :conditions=>"name='#{nom_colonne}' and table_id=#{table.id}"
						#verif_colonne = Statistic::Colonne.find_by_name(nom_colonne)
						if verif_colonne.nil?
							Statistic::Colonne.create(:name=>nom_colonne, :table_id=>table.id)
						end
					}

					contenu = Statistic::Contenu.find :last
					idinsert = contenu.nil? ? 0 : contenu.idinsert + 1
					IO.readlines(temp.path, "\n").each do |line_contenu_colonne|
						unless line_contenu_colonne.scan(/^INSERT INTO "#{table_create}" VALUES\((.{1,})\);$/) == Array.new
							tab_contenu_create = line_contenu_colonne.scan(/^INSERT INTO "#{table_create}" VALUES\((.{1,})\);$/)[0][0].split(",") 
					 		0.upto(tab_colonne_create.length-1){ |e|
								#info_colonne = Statistic::Colonne.find_by_name(tab_colonne_create[e].split(" ")[0].strip)									
								info_colonne = Statistic::Colonne.find :first, :conditions=>"name='#{tab_colonne_create[e].scan(/^ ?'(.{1,})'.{1,}$/)[0][0]}' and table_id=#{table.id}"
								Statistic::Contenu.create(:contenu=>tab_contenu_create[e], :idinsert=>idinsert, :colonne_id=>info_colonne.id)
							}
							idinsert = idinsert + 1	
						end
					end
				end
			end
	end

	def self.viewstattable_to_tablestat
		#Definition month archive dans conf_stat_archive.yml#
			conf_path = "#{RAILS_ROOT}/config/conf_stat_archive.yml"
			configuration = YAML::load_file(conf_path)
			time_month_archive = configuration["monthdelay"].to_i
		#-----------------------------------FIN---------------------------------#
		time = Time.now
		month = time.month
		day = time.day
		year = time.year
		hour = time.hour
		min = time.min
		sec = time.sec
		time_moins  = time - (86400 * (30*time_month_archive))
		#Time.local(2000,2,1,20,15,1)
		#time_moins = Time.local(year,month-time_month_archive,day,hour,min,sec)
		#stat_tablemediasessiondates ----------------==========>----------stat_tablearchivemediasessiondates
			tab_tablemediasessiondates = Statistic::Tablemediasessiondate.find(:all, :conditions=>"date<'#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")	
			unless tab_tablemediasessiondates.empty?
			     tab_tablemediasessiondates.each{ |tablemediasessiondate|
				tablearchivemediasessiondate = Statistic::Tablearchivemediasessiondate.new(:roleid=>tablemediasessiondate.roleid, :rolename=>tablemediasessiondate.rolename, :groupid=>tablemediasessiondate.groupid, :groupname=>tablemediasessiondate.groupname, :applicationid=>tablemediasessiondate.applicationid, :applicationname=>tablemediasessiondate.applicationname, :serial=>tablemediasessiondate.serial, :widgetid=>tablemediasessiondate.widgetid, :sessionid=>tablemediasessiondate.sessionid, :date=>tablemediasessiondate.date, :widgetname=>tablemediasessiondate.widgetname)
			       tablearchivemediasessiondate.save
			     }
			    Statistic::Tablemediasessiondate.destroy_all("date < '#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
			end
		#stat_mediasessiondates---------======>---------stat_tablemediasessiondates
		if Statistic::Tablemediasessiondate.find(:last, :order=>:date).nil? 
			tab_viewmediasessiondates = Statistic::Mediasessiondate.find(:all)
		else
			tab_viewmediasessiondates = Statistic::Mediasessiondate.find(:all, :conditions=>"date>'#{Statistic::Tablemediasessiondate.find(:last, :order=>:date).date.to_i.to_s}'")
		end
	      unless tab_viewmediasessiondates.empty?
		tab_viewmediasessiondates.each{ |viewmediasessiondates|
			#Time.at(1288360623).strftime("%Y-%m-%d %H:%M:%S")
			date = Time.at(viewmediasessiondates.date.to_i).strftime("%Y-%m-%d %H:%M:%S")
			
			tablemediasessiondate = Statistic::Tablemediasessiondate.new(:roleid=>viewmediasessiondates.roleid, :rolename=>viewmediasessiondates.rolename, :groupid=>viewmediasessiondates.groupid, :groupname=>viewmediasessiondates.groupname, :applicationid=>viewmediasessiondates.applicationid, :applicationname=>viewmediasessiondates.applicationname, :serial=>viewmediasessiondates.serial, :widgetid=>viewmediasessiondates.widgetid, :sessionid=>viewmediasessiondates.sessionid, :date=>date, :widgetname=>viewmediasessiondates.widgetname)
			tablemediasessiondate.save
		}
		#tab_viewmediasessiondates.destroy_all
		#Statistic::Mediasessiondate.destroy_all("date>'#{Statistic::Tablemediasessiondate.find(:last, :order=>:date).date.to_i.to_s}'")
	      end
		#stat_tablewidgettotalusersapps--------=======>----------stat_tablearchivewidgettotalusersapps
			tab_tablewidgettotaluserapps = Statistic::Tablewidgettotalusersapp.find(:all, :conditions=>"date<'#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
			unless tab_tablewidgettotaluserapps.empty?
				tab_tablewidgettotaluserapps.each{ |tablewidgettotalusersapp|
					tablearchivewidgettotalusersapp = Statistic::Tablearchivewidgettotalusersapp.new(:roleid=>tablewidgettotalusersapp.roleid, :rolename=>tablewidgettotalusersapp.rolename, :groupid=>tablewidgettotalusersapp.groupid, :groupname=>tablewidgettotalusersapp.groupname, :applicationid=>tablewidgettotalusersapp.applicationid, :duration=>tablewidgettotalusersapp.duration, :sessionid=>tablewidgettotalusersapp.sessionid, :serial=>tablewidgettotalusersapp.serial, :date=>tablewidgettotalusersapp.date)
					tablearchivewidgettotalusersapp.save
				}
			#tab_tablewidgettotaluserapps.destroy_all
			Statistic::Tablewidgettotalusersapp.destroy_all("date < '#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
			end
		#stat_widgettotalusersapps------======>---------stat_tablewidgettotalusersapps	

		if Statistic::Tablewidgettotalusersapp.find(:last, :order=>:date).nil?
			tab_widgettotalusersapps = Statistic::Widgettotalusersapp.find(:all)
		else
			tab_widgettotalusersapps = Statistic::Widgettotalusersapp.find(:all, :conditions=>"date>'#{Statistic::Tablewidgettotalusersapp.find(:last, :order=>:date).date.to_i.to_s}'")
		end

	      unless tab_widgettotalusersapps.empty?
		tab_widgettotalusersapps.each{ |widgettotaluserapps|
			date = Time.at(widgettotaluserapps.date.to_i).strftime("%Y-%m-%d %H:%M:%S")

			tablewidgettotalusersapp = Statistic::Tablewidgettotalusersapp.new(:roleid=>widgettotaluserapps.roleid, :rolename=>widgettotaluserapps.rolename, :groupid=>widgettotaluserapps.groupid, :groupname=>widgettotaluserapps.groupname, :applicationid=>widgettotaluserapps.applicationid, :duration=>widgettotaluserapps.duration, :sessionid=>widgettotaluserapps.sessionid, :serial=>widgettotaluserapps.serial, :date=>date)
			tablewidgettotalusersapp.save
		}
		#tab_widgettotalusersapps.destroy_all
		#Statistic::Widgettotalusersapp.destroy_all("date < '#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
	      end
		#stat_tablecategoriesessiondates-----------=========>--------------stat_tablearchivecategoriecategoriesessiondates
			tab_tablecategoriesessiondates = Statistic::Tablecategoriesessiondate.find(:all, :conditions=>"date<'#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
			unless tab_tablecategoriesessiondates.empty?
				tab_tablecategoriesessiondates.each{ |tablecategoriesessiondate|
					tablearchivecategoriesessiondate = Statistic::Tablearchivecategoriecategoriesessiondate.new(:roleid=>tablecategoriesessiondate.roleid, :rolename=>tablecategoriesessiondate.rolename, :groupid=>tablecategoriesessiondate.groupid, :groupname=>tablecategoriesessiondate.groupname, :applicationid=>tablecategoriesessiondate.applicationid, :applicationname=>tablecategoriesessiondate.applicationname, :serial=>tablecategoriesessiondate.serial, :widgetid=>tablecategoriesessiondate.widgetid, :sessionid=>tablecategoriesessiondate.sessionid, :date=>tablecategoriesessiondate.date)
					tablearchivecategoriesessiondate.save
				}
			#tab_tablecategoriesessiondates.destroy_all
			Statistic::Tablecategoriesessiondate.destroy_all("date<'#{time_moins.strftime("%Y-%m-%d %H:%M:%S")}'")
			end
				
	        #	
		if Statistic::Tablecategoriesessiondate.find(:last, :order=>:date).nil?
			tab_categoriesessiondates = Statistic::Categoriesessiondate.find(:all)
		else
			tab_categoriesessiondates = Statistic::Categoriesessiondate.find(:all, :conditions=>"date>'#{Statistic::Tablecategoriesessiondate.find(:last, :order=>:date).date.to_i.to_s}'")
		end

	     unless tab_categoriesessiondates.empty?
		tab_categoriesessiondates.each{ |categoriesessiondates|
			date = Time.at(categoriesessiondates.date.to_i).strftime("%Y-%m-%d %H:%M:%S")
			
			tablecategoriesessiondate = Statistic::Tablecategoriesessiondate.new(:roleid=>categoriesessiondates.roleid, :rolename=>categoriesessiondates.rolename, :groupid=>categoriesessiondates.groupid, :groupname=>categoriesessiondates.groupname, :applicationid=>categoriesessiondates.applicationid, :applicationname=>categoriesessiondates.applicationname, :serial=>categoriesessiondates.serial, :widgetid=>categoriesessiondates.widgetid, :sessionid=>categoriesessiondates.sessionid, :serial=>categoriesessiondates.serial, :date=>date)
			tablecategoriesessiondate.save
		}
		#Statistic::Categoriesessiondate.destroy_all("date<'#{Statistic::Tablecategoriesessiondate.find(:last, :order=>:date).date.to_i.to_s}'")
	     end	

	     #Statistic::Contenu.destroy_all("colonne_id IN(select id from stat_colonnes where time_column=1) and contenu<'#{time_moins.to_i}'")	
	     Statistic::Contenu.destroy_all
	     #stat_colonnes = Statistic::Colonne.find(:all, :conditions=>{:name=>"time"})

	     #stat_colonnes.each{ |stat_colonne|
	#	     stat_colonne.contenus.find(:all, :conditions=>"contenu<'#{Statistic::Tablecategoriesessiondate.find(:last, :order=>:date).date.to_i.to_s}'", :offset=>0, :limit=>16000).each{ |contenu|
		     	#contenu.destroy
	#		Statistic::Contenu.destroy_all(:idinsert=>contenu.idinsert)
	#	     }
	 #    }
	end
end

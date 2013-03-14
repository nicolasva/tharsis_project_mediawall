require "#{RAILS_ROOT}/vendor/plugins/2DMotor/2Dmotor"
module FichiercompressionsHelper
	def get_fichiercompressions(application_id,checked)
		result_fichiercompression = "<ul id='ul_fichiercompression_#{application_id}' style='display:none;'>"
		avoirs = Avoir.find(:all, :conditions=>"application_id=#{application_id}")
		avoirs.each{ |avoir|
			result_fichiercompression += "<li>#{check_box_tag("fichiercompression_update[fichiercompression_id][]", avoir.fichiercompression_id, checked, :class=>"class_checkbox_versions", :onclick=>"verif_checked_versions(this.checked);")} #{avoir.fichiercompression.file_file_name}</li>" 
		}
		result_fichiercompression += "</ul>"
		result_fichiercompression
	end

	def get_roles_apps(current_user_role_id,groupapps_id,look_file,checked)
		roles = Role.find(:all, :conditions=>"role_id=#{current_user_role_id}")

		unless roles.empty?
			result_ul_role_apps = "<ul>"
				roles.each do |role|
					result_ul_role_apps += "<li>#{check_box_tag("fichiercompression_roles", role.id, checked, :class=>"checkbox_roles", :onclick=>look_file ? "check_versions(this.checked,'#{role.id}');" : "check_apps(this.checked,'#{role.id}');", :id=>"checkbox_roles_#{role.id}")}#{link_to role.name, "#ancre_#{role.id}", :onclick=>look_file ? "display_apps_versions('#{role.id}');" : "display_apps_roles('#{role.id}');", :class=>"class_liens_roles", :id=>"id_liens_roles_#{role.id}"}"
						unless role.applications.empty?
						result_ul_role_apps += "<ol id='#{look_file ? "ol_role_versions" : "ol_role_apps"}_#{role.id}' style='display:none;' name='ancre_#{role.id}'>"	
						role.applications.find(:all, :conditions=>"groupapp_id=#{groupapps_id}").each{ |application|
							result_ul_role_apps += "<li>#{check_box_tag("fichiercompression_avoir[application_id][]", application.id, checked, {:class=>"application_cb", :onclick=>look_file ? "checked_versions(this.checked,'#{application.id}');" : "checked_sub_apps();"})} #{look_file ? link_to(application.name, "#", :onclick=>"Effect.toggle('ul_fichiercompression_#{application.id}');") : application.name}"
								result_ul_role_apps += get_fichiercompressions(application.id,checked) if look_file
							result_ul_role_apps += "</li>" 
						}
						result_ul_role_apps += "</ol>"
						end
						unless get_roles_apps(role.id,groupapps_id,look_file,checked) == 0
							result_ul_role_apps += get_roles_apps(role.id,groupapps_id,look_file,checked)
						end
					result_ul_role_apps += "</li>"
				end
			result_ul_role_apps += "</ul>"
			result_ul_role_apps
		else
			0
		end
	end



	def get_dossier_or_file?(file)
		tab_file_split = Array.new
		tab_file_split = file.strip.split(" ")	
		tab_file_split[0].strip.chomp.to_s.include?("d") ? "list_file_directory" : "editfile"
	end

	def edit_or_parcourir(file)
		tab_file_split = Array.new
		tab_file_split = file.strip.split(" ")	
		tab_file_split[0].strip.chomp.to_s.include?("d") ? t("fichiercompressions.parcourir") : t("fichiercompressions.edit_file")
	end

	def control_affiche_info(file)
		tab_file_split = Array.new
		tab_file_split = file.strip.split(" ")	
		tab_file_split[7].to_s.strip.chomp == "" || tab_file_split[7].to_s.strip.chomp == "." || tab_file_split[7].to_s.strip.chomp == ".." ? false : true 
	end

	def control_extension_file(file)
		tab_file_split = file.split(".")
		#tab_file_split[1].to_s.strip.chomp != "png" || tab_file_split[1].to_s.strip.chomp != "PNG" || tab_file_split[1].to_s.strip.chomp != "jpg" || || tab_file_split[1].to_s.strip.chomp != "jpeg" ? "/images/"	
	end

	def url_controller_action_name_fichiercompressions(controller_action_name)
		case controller_action_name
			when "new"
				"update.png"
				
			when "edit"
				"update.png"
                        when "index"
                                "folder.png"
		end
	end

	def url_controller_action_name_fichiercompressions_text(controller_action_name)
		case controller_action_name
			when "new"
				t("fichiercompressions.update")
			when "index"
				t("fichiercompressions.contenu")
		end
	end

	def other_menu_fichiercompressions(controller_action_name)
		case controller_action_name
			when "index"
				"<li style='float:left;'>#{link_to "#{image_tag("fichiercompressions/update.png", :size=>"40x40")}<br>#{t("header.title_update")}", :controller=>"fichiercompressions", :action=>"new"}</li>"
		end
        end

end

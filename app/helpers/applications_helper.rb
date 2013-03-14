module ApplicationsHelper
	def get_size_tab_applications_apps
		#current_user.role_id == 1 ? 834 : 690
		taille_tableau = 834 
		taille_tableau -= 144 unless current_user.role_id == 1
		taille_tableau -= 89 unless @controller.control_acces_user_controller("pings","show")	
		taille_tableau
	end

	def get_roles_applications(role_id)
		roles = Role.find(:all, :conditions=>"role_id=#{role_id}")	

		unless roles.empty?
			result_ul_role = "<ol style='list-style-type:none;'>"
			roles.each do |role|
				result_ul_role += "<li>#{radio_button(:application, :role_id, role.id)}#{role.name}"
					unless get_roles_applications(role.id) == 0
						result_ul_role += get_roles_applications(role.id)
					end
				result_ul_role += "</li>"
			end
			result_ul_role += "</ol>"
			result_ul_role
		else
			0
		end
	end

	def url_controller_action_name_apps(controller_action_name)
		case controller_action_name
			when "new"
				"new.png"
			when "index"
				"state.png"
                        when "apps_sharing_zips"
				"folder.png"
                 end
		
	end

	def url_controller_action_name_apps_text(controller_action_name)
		case controller_action_name
			when "new"
				t("applications.new_license")
			when "index"
				t("applications.etat")
  			when "apps_sharing_zips"
				zip  = Fichiercompression.find(params[:id])
				"#{zip.description}"
		end
	end

	def set_parent_home_applications(user_role_id, params_role_id)
		tab_role = get_parent_home_applications(user_role_id, params_role_id)
		result_roles = ""
		liste_roles = ""
		0.upto(tab_role.length-1) { |i|
			roles = Role.find(:all, :conditions=>"role_id=#{tab_role[i]}")
			
			result_roles = "<ul style='list-style-type:none;line-height:22px;'>" 
			roles.each{ |role|
				if i > 0
					result_roles += "<li>#{link_to role.name.downcase, {:controller=>"applications", :action=>"index", :role_id=>role.id}, :style=>"color:black;#{params_role_id.to_i == role.id ? "text-decoration:underline;" : "text-decoration:none;" }"}"
						if tab_role[i-1].to_i == role.id.to_i
							result_roles += liste_roles
						end
					result_roles += "</li>"	
				else
					result_roles += "<li>#{link_to role.name.downcase, {:controller=>"applications", :action=>"index", :role_id=>role.id}, :style=>"color:black;#{params_role_id.to_i == role.id ? "text-decoration:underline;" : "text-decoration:none;" }"}</li>"
				end	
			}
			result_roles += "</ul>"
			liste_roles = result_roles
		}

		result_roles
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

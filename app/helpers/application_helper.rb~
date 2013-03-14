# Methods added to this helper will be available to all templa
# tes in the application.
module ApplicationHelper	
	def file_write(file_bin,url,type_ecriture)
     		 if File.open(url, type_ecriture) do |f|
	   		f.write file_bin
         	end
      		else
		Rails.logger.info "test erreur_=_=_=_=_=_=_=_=_="
      		end
      		url
  	end

	def tab_td_style(indice)
		indice == 0 ? "white" : "#e5e5e5"
	end

	def get_url_home(controller_name,action_name,request_uri)
	   result_link = "#{get_link_home(controller_name)}"
           unless request_uri.scan(/^\/.{1,}\?(.{1,})$/).empty? 
		params = request_uri.scan(/^\/.{1,}\?(.{1,})$/)[0][0].to_s
	       
		case controller_name
			when "applications"
				result_link += "#{link_to get_controller_language(controller_name), :controller=>controller_name}/#{set_params_for_link(params)}"
			when "fichiercompressions"
				result_link += "#{link_to t("applications.applications_url"), applications_url}/#{get_controller_language(controller_name)}/#{set_params_for_link_fichiercompressions(params)}"
			when "statistics"
				result_link += "#{get_url_statistics(action_name,request_uri,params)}"
		end
	   else
		id = request_uri.scan(/^\/.{1,}\/(.{1,})\/.{1,}$/).to_s.to_i
	        	unless action_name.nil?
				case action_name
				      when "edit"
				      	result_link += "#{link_to get_controller_language(controller_name), :controller=>controller_name}/#{get_info_url_edit(controller_name,id)}"
			  	      when "index"
					result_link += "#{get_controller_language(controller_name)}"
			      				      
				end
			end
	   end
	   result_link
	end

	private
	def set_params_for_link_fichiercompressions(params)
		detail_params = params.scan(/^(.{1,})=(.{1,})$/)[0]

		case detail_params[0]
			when "id"
			       get_info_url_edit("applications",detail_params[1])	
		end
	end

	def get_role_id(role_id)
		role = Role.find(role_id)
		link_to role.name, :controller=>"statistics", :action=>"index", :role_id=>role.id
	end

	def get_role_application_id(application_id)
		application = Application.find(application_id.to_i)
		link_to application.role.name, :controller=>"statistics", :action=>"index", :role_id=>application.role_id
	end
	
	def get_url_statistics(action_name,request_uri,params)
		#params
		#params.empty? ? t("statistics.statistics_url") : 	
		case action_name
			when "show"			
				 "#{link_to t("statistics.statistics_url"), :controller=>"statistics", :action=>"index"}/#{params.split("=")[0].to_s == "role_id" ? get_role_id(params.split("=")[1].to_i) : get_role_application_id(params.split("=")[1].to_i)}/#{request_uri.scan(/^\/.{1,}\/(.{1,})\?.{1,}$/)[0][0]}"		
			when "index"
				params.empty? ? t("statistics.statistics_url") : "#{link_to(t("statistics.statistics_url"), :controller=>"statistics", :action=>"index")}/#{params.split("=")[0].to_s == "role_id" ? get_role_id(params.split("=")[1].to_i) : get_role_application_id(params.split("=")[1].to_i)}"
		end
	end

	def get_info_url_edit(controller,id)
		case controller
			when "applications"
				Application.find(id).name
			when "roles"	
				Role.find(id).name
			when "users"
				User.find(id).username
			when "fichiercompressions"
				id
			when "groupapps"
				Groupapp.find(id).name
			when "controllersdroits"
				Controllersdroit.find(id).name
		end
	end

        def get_controller_language(controller)
		case controller
			when "applications"
				t("applications.applications_url")
		        when "users"
				t("user.user_url")
			when "fichiercompressions"
				t("fichiercompressions.fichiercompressions_url")
			when "presentations"
				t("presentations.presentations_url")
			when "roles"
				t("roles.roles_url")
			when "groupapps"
				t("groupapps.groupapps_url")
			when "controllersdroits"
				t("controllersdroits.controllersdroits_url")
			when "statistics"
				t("statistics.statistics_url")
		end
	end

	def get_link_home(controller)
		"#{link_to(get_controller_language('presentations'), :controller=>"presentations")}/" unless controller == "presentations"
	end

	def set_params_for_link(params)
		detail_params = params.scan(/^(.{1,})=(.{1,})$/)[0]
		unless params.nil?
		      case detail_params[0].to_s
			    when "role_id"
				result_link = "#{set_params_roles(detail_params[1])}"
			    when "arrow"
				result_link = set_params_arrow(detail_params[1])
		      end 
		else
			result_link = "#{link_to t("applications.applications_url"), applications_path}"
		end
		result_link
	end

	def set_params_arrow(arrow_stat)
		unless arrow_stat.empty?
			case arrow_stat.to_s
				when "up"
					link_order_type = t("applications.arrow_up") 
				when "down"
					link_order_type = t("applications.arrow_down")

			end	
		else
			link_order_type = "#{link_to t("applications.applications_url"), application_path}"
		end
		link_order_type
	end

	def set_params_roles(role_id)
		unless role_id.empty?
			user_role_id = current_user.role_id
			role = Role.find(role_id)
			role_id_parent = role.role_id
			result_link = ""
			link_save = role.name
		      unless role_id_parent != user_role_id
			while (role_id_parent > user_role_id)
				role = Role.find(role_id_parent)
				result_link += "#{link_to role.name, :controller=>"applications", :action=>"index", :role_id=>role.id}/"		
				role_id_parent = role.role_id
			end
		      end
			result_link += link_save 	
		else
			result_link = "#{link_to t("applications.applications_url"), applications_path}"
		end
		result_link
	end	
end

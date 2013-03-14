module AvoirsHelper
	def set_applications_users(role_id,result_list_apps)
		applications = Application.find(:all, :conditions=>{:role_id=>role_id})
		applications.each{ |application|
			result_list_apps += "#{application.id},"
		}

		result_list_apps
	end

	def get_roles_users(role_id,tab_result_list_roles)
		roles = Role.find(:all, :conditions=>{:role_id=>role_id})

		unless roles.empty?
				roles.each{ |role|
					tab_result_list_roles.push(role.id) 

					unless get_roles_users(role.id,tab_result_list_roles)
						get_roles_users(role.id,tab_result_list_roles)
					end
				}

				#Rails.logger.info "result_list_apps-=-=-=-=-=-=-=-=-=-=-#{tab_result_list_roles.join("-")}"
				#result_list_apps
				tab_result_list_roles
		else
			0
		end
	end
end

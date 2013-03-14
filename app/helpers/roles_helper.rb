module RolesHelper
	def get_roles_form(f,role_id)
		roles = Role.find(:all, :conditions=>"role_id=#{role_id}")

		unless roles.empty?
			result_ul_role_form = "<ol style='list-style-type:none;'>"
					roles.each do |role|
						result_ul_role_form += "<li>#{f.radio_button(:role_id, role.id)} #{role.name}"
						unless get_roles_form(f,role.id) == 0
							result_ul_role_form += get_roles_form(f,role.id) 
						end
						result_ul_role_form += "</li>"
					end
					result_ul_role_form += "</ol>"
					result_ul_role_form
		else
			0
		end	
	end
	def get_table_role_id(role_id)
		roles = Role.find(:all, :conditions=>"role_id=#{role_id}")

	      unless roles.empty?
		result_table_role = ""
		roles.each do |role|
			result_table_role += "<tr>
						<td style='padding-left: 10px;'>#{role.name} #{link_to image_tag("controllersdroits/plus.png", :class=>"class_liens_plus"), edit_role_path(current_user.role)}</td> 
						<td>#{link_to t("roles.see_user_group"), :controller=>"users", :action=>"show", :id=>role.id}</td>
						<td style='text-align:center;'>#{link_to image_tag("img_general/close.gif", :style=>'border:0px;'), role, :confirm => t("general.confirmation_sup"), :method => :delete}</td></tr>"
						if get_table_role_id(role.id) != 0
							result_table_role += get_table_role_id(role.id)
						end
			#result_table_role += "</tr>"
		end

		#result_table_role += "</table>"
		result_table_role
	      else
		      0
	      end
		
	end
	
	def set_parent_home_roles(params_role_id)
		tab_role = get_parent_home_roles(params_role_id.to_i)	

		result_roles = ""
		liste_roles = ""
		width = (700 - (50*tab_role.length-1))
		0.upto(tab_role.length-1) { |i|
			roles = Role.find(:all, :conditions=>"role_id=#{tab_role[i]}")
			
			result_roles = "<ul style='list-style-type:none;#{i == (tab_role.length - 1) ? "margin:0px;padding:0px;" : ""}'>"
			roles.each{ |role|
				if i > 0
					result_roles += "<li><table border='1' width='#{width}px'>
							<tr>
							   <td>#{link_to role.name, :controller=>"roles", :action=>"index", :role_id=>role.id}</td>
							   <td>#{link_to t("roles.see_user_group"), :controller=>"users", :action=>"show", :id=>role.id}</td>
							   <td>#{link_to t("general.edition"), edit_role_path(role)}</td>
							   <td>#{link_to image_tag("img_general/close.gif", :style=>'border:0px;'), role, :confirm => t("general.confirmation_sup"), :method => :delete}</td>
							</tr>"
							if tab_role[i-1].to_i == role.id.to_i
								result_roles += "<tr><td colspan='4'>#{liste_roles}</tr></td>"
							end
					result_roles += "</table></li>"
				else
					result_roles += "<li><table border='1' width='#{width}px'>
								<tr>
								  <td>#{link_to role.name, :controller=>"roles", :action=>"index", :role_id=>role.id}</td>
								  <td>#{link_to t("roles.see_user_group"), :controller=>"users", :action=>"show", :id=>role.id}</td>
								  <td>#{link_to t("general.edition"), edit_role_path(role)}</td>
								  <td>#{link_to image_tag("img_general/close.gif", :style=>"border:0px;"), role, :confirm => t("general.confirmation_sup"), :method => :delete}</td>
								</tr>
							 </table></li>"
				end
			}
			result_roles += "</ul>"
			liste_roles = result_roles
			width = width + 50
		}

		result_roles
	end

	private
	def get_parent_home_roles(params_role_id)
		tab_role = Array.new
		tab_role.push(params_role_id)
		while current_user.role_id != params_role_id do
			role = Role.find(params_role_id)
			tab_role.push(role.role_id)
			params_role_id = role.role_id
		end

		tab_role
	end
end

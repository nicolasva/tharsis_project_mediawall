module GroupappsHelper
	def url_controller_action_name_apps_text_groupapps(controller_action_name)
		case controller_action_name
			when "new"
				t("groupapps.new_groupapps")
			when "index"
				t("groupapps.index_groups")
  			when "apps_sharing_zips"
				groupapp  = Groupapp.find(params[:id])
				"#{t("groupapps.edit_groupapp")} #{groupapp.name}"
		end
	end
end

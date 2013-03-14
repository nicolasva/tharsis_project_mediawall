module UsersHelper
	def url_controller_action_name_users_text(controller_action_name)
		case controller_action_name
			when "new"
				t("user.new_user")
			when "index"
				t("user.ensemble_users")
			when "edit"
				t("user.edition_user")
		end		
	end
end

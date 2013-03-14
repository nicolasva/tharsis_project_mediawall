class Controllersdroit < ActiveRecord::Base
        has_and_belongs_to_many :roles
	validates_presence_of :name, :message=>I18n.t("models.notice.controllersdroit.name")
end

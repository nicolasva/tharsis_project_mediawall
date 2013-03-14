class Statistic::Categoriecolonnetable < Statistic
	self.table_name = 'stat_categoriecolonnetables'
	validates_presence_of :name, :message=>I18n.t("models.notice.categoriecolonnetable.name")
	validates_presence_of :nameen, :message=>I18n.t("models.notice.categoriecolonnetable.nameen")
	has_and_belongs_to_many :colonnes
	has_and_belongs_to_many :roles
	has_many :posseders
end

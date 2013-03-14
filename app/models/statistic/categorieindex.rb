class Statistic::Categorieindex < Statistic
	self.table_name = 'stat_categorieindexs'
	validates_presence_of :name, :message=>"Veuillez entrez un nom pour cette catégorie"
	has_many :posseders
end

class Statistic::Contenu < Statistic
	self.table_name = 'stat_contenus'
	belongs_to :colonne
end 

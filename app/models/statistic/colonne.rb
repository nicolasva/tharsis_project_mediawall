class Statistic::Colonne < Statistic
	self.table_name = 'stat_colonnes'
	has_many :contenus, :dependent => :destroy 
	belongs_to :table
	has_and_belongs_to_many :categoriecolonnetables
end

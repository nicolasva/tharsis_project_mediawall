class Statistic::Table < Statistic
	self.table_name = 'stat_tables'
	has_many :colonnes, :dependent => :destroy
end

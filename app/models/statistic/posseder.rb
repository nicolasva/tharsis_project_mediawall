class Statistic::Posseder < Statistic
	self.table_name = 'stat_posseders'
	validates_presence_of :categorieindex_id
	validates_presence_of :categoriecolonnetable_id
	belongs_to :categoriecolonnetable
	belongs_to :categorieindex
end

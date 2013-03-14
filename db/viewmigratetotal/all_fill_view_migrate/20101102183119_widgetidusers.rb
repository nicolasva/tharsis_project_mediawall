class Widgetidusers < ActiveRecord::Migration
  def self.up
	  create_view :stat_widgetidusers, "select contenu as duration, idinsert from stat_contenus where colonne_id = (select id from stat_colonnes where name LIKE 'duration' and table_id=6)" do |t|
	  	t.column :duration
		t.column :idinsert
	  end
  end
end

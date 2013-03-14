class Widgetusertime < ActiveRecord::Migration
  def self.up
	  create_view :stat_widgetusertimes, "select contenu as date, idinsert from stat_contenus where colonne_id = (select id from stat_colonnes where name LIKE 'time' and table_id=6)" do |t|
		  t.column :date
		  t.column :idinsert
  	  end
  end
end

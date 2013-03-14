class ModifstatWidgetusersessionids < ActiveRecord::Migration
  def self.up 
	  drop_view :stat_widgetusersessionids
	  create_view :stat_widgetusersessionids, "select contenu as sessionid, idinsert from stat_contenus where colonne_id = (select id from stat_colonnes where name LIKE 'userSessionId' and table_id=6)" do |t|
	  	t.column :sessionid
		t.column :idinsert
	  end
  end
end

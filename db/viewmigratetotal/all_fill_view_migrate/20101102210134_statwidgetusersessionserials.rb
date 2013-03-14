class Statwidgetusersessionserials < ActiveRecord::Migration
  def self.up
	  create_view :stat_widgetusersessionserials, "select contenu as serial, idinsert from stat_contenus where colonne_id = (select id from stat_colonnes where name LIKE 'application_serial' and table_id=6);" do |t|
	  	t.column :serial
		t.column :idinsert
	  end
  end
end

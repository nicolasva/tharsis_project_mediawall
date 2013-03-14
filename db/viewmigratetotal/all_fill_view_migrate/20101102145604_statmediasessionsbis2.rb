class Statmediasessionsbis2 < ActiveRecord::Migration
  def self.up
	create_view :stat_widgetserialsessions, "select stat_widgetserials.widgetid, stat_contenus.contenu as sessionid, stat_widgetserials.serial, stat_widgetserials.idinsert  from stat_contenus,stat_widgetserials where stat_contenus.idinsert=stat_widgetserials.idinsert and colonne_id=(select stat_colonnes.id from stat_colonnes,stat_tables where stat_colonnes.table_id=stat_tables.id and stat_colonnes.name LIKE 'userSessionId' and table_id=3)" do |t|
       		t.column :widgetid
		t.column :sessionid
		t.column :serial
		t.column :idinsert
        end
  end
end

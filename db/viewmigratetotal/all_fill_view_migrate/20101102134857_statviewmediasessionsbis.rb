class Statviewmediasessionsbis < ActiveRecord::Migration
  def self.up
        drop_view :stat_widgetserials
	  create_view :stat_widgetserials, "select stat_widgetids.contenu as widgetid, stat_contenus.contenu as serial, stat_widgetids.idinsert from stat_contenus,stat_widgetids where stat_contenus.idinsert=stat_widgetids.idinsert and colonne_id=(select id from stat_colonnes where name LIKE 'application_serial' and table_id=3);" do |t|
         	t.column :widgetid
	        t.column :serial
	        t.column :idinsert	
         end
	#create_view :stat_widgetserialsessions, ""
  	#create_view :stat_mediasessions, 
  end
end


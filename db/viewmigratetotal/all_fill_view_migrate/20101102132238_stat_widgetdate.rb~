class StatWidgetdate < ActiveRecord::Migration
  def self.up 
	  create_view :stat_widgetdates, "select stat_contenus.contenu as date, widgetid from stat_widgetserials, stat_contenus where stat_contenus.idinsert=stat_widgetserials.idinsert and colonne_id=(select id from stat_colonnes where id=16);" do |t|
		  t.column :date
		  t.column :widgetid
         end
  end
end

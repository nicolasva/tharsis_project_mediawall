class Modifwidgettotalusers < ActiveRecord::Migration
  def self.up
	  create_view :stat_widgettotalusers, "select stat_widgetidusers.duration, stat_widgetusersessionids.sessionid, stat_widgetusersessionserials.serial, stat_widgetusertimes.date from stat_widgetidusers, stat_widgetusersessionids, stat_widgetusersessionserials, stat_widgetusertimes where stat_widgetidusers.idinsert=stat_widgetusersessionids.idinsert and stat_widgetidusers.idinsert=stat_widgetusersessionserials.idinsert and stat_widgetidusers.idinsert=stat_widgetusertimes.idinsert and stat_widgetusersessionids.idinsert=stat_widgetusersessionserials.idinsert and stat_widgetusersessionids.idinsert=stat_widgetusertimes.idinsert and stat_widgetusersessionserials.idinsert=stat_widgetusertimes.idinsert" do |t|
	  	t.column :duration
		t.column :sessionid
		t.column :serial
		t.column :date
	  end
  end
end

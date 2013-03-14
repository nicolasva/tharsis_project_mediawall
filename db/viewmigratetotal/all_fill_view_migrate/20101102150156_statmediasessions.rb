class Statmediasessions < ActiveRecord::Migration
  def self.up
	  create_view :stat_mediasessions, "select stat_serials.roleid, stat_serials.rolename, stat_serials.groupid, stat_serials.groupname, stat_serials.applicationid, stat_serials.applicationname, stat_widgetserialsessions.serial, stat_widgetserialsessions.widgetid, stat_widgetserialsessions.sessionid from stat_serials,stat_widgetserialsessions where stat_widgetserialsessions.serial=stat_serials.serial" do |t|
	  	t.column :roleid
		t.column :rolename
		t.column :groupid
		t.column :groupname
		t.column :applicationid
		t.column :applicationname
		t.column :serial
		t.column :widgetid
		t.column :sessionid
	  end
  end
end

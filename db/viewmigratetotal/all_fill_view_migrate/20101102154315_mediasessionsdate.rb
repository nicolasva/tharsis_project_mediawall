class Mediasessionsdate < ActiveRecord::Migration
  def self.up
	 create_view :stat_mediasessiondates, "select stat_mediasessions.roleid, stat_mediasessions.rolename, stat_mediasessions.groupid, stat_mediasessions.groupname, stat_mediasessions.applicationid, stat_mediasessions.applicationname, stat_mediasessions.serial, stat_mediasessions.widgetid, stat_mediasessions.sessionid, stat_widgetdates.date from stat_mediasessions,stat_widgetdates where stat_mediasessions.widgetid=stat_widgetdates.widgetid;" do |t|
  		t.column :roleid
		t.column :rolename
		t.column :groupid
		t.column :groupname
		t.column :applicationid
		t.column :applicationname
		t.column :serial
		t.column :widgetid
		t.column :sessionid
		t.column :date
  	end
  end
end

class Statwidgettotalusersapps < ActiveRecord::Migration
  def self.up
	create_view :stat_widgettotalusersapps, "select stat_serials.roleid, stat_serials.rolename, stat_serials.groupid, stat_serials.groupname, stat_serials.applicationid, stat_widgettotalusers.duration, stat_widgettotalusers.sessionid, stat_widgettotalusers.serial from stat_serials,stat_widgettotalusers where stat_serials.serial=stat_widgettotalusers.serial" do |t|
		t.column :roleid
		t.column :rolename
		t.column :groupid
		t.column :groupname
		t.column :applicationid
		t.column :duration
		t.column :sessionid
		t.column :serial
	end
  end
end

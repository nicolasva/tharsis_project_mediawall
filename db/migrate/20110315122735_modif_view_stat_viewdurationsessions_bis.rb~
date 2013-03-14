class ModifViewStatViewdurationsessionsBis < ActiveRecord::Migration
  def self.up
	drop_view :stat_viewdurationsessions
	create_view :stat_viewdurationsessions, "select sessionid,groupid,roleid,applicationid, count(stat_tablemediasessiondates.widgetid) as 'countwidgetid', min(date) as 'startsession', TIME_TO_SEC(TIMEDIFF(max(date),min(date))) as 'duration' from stat_tablemediasessiondates group by sessionid" do |t|
	  	t.column :sessionid
		t.column :groupid
		t.column :roleid
		t.column :applicationid
		t.column :countwidgetid
		t.column :startsession
		t.column :duration
	end

	drop_view :stat_viewdurationwidgettotalusersapps
	create_view :stat_viewdurationwidgettotalusersapps, "select sessionid,groupid,roleid,applicationid, min(date) as 'startsession', TIME_TO_SEC(TIMEDIFF(max(date),min(date))) as 'duration' from stat_tablewidgettotalusersapps group by sessionid" do |t|
	  	t.column :sessionid
		t.column :groupid
		t.column :roleid
		t.column :applicationid
		t.column :startsession
		t.column :duration
	end
  end

  def self.down
  end
end

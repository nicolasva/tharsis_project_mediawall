class Statviewmediasessions < ActiveRecord::Migration
  def self.up
	create_view :stat_serials, "select `roles`.`id` AS `roleid`,`roles`.`name` AS `rolename`,`groupapps`.`id` AS `groupid`,`groupapps`.`name` AS `groupname`,`applications`.`id` AS `applicationid`,`applications`.`name` AS `applicationame`,`applications`.`serial` AS `serial` from ((`roles` join `groupapps`) join `applications`) where ((`applications`.`role_id` = `roles`.`id`) and (`applications`.`groupapp_id` = `groupapps`.`id`))" do |t|
  		t.column :roleid
		t.column :rolename
		t.column :groupid
		t.column :groupname
		t.column :applicationid
		t.column :applicationname
		t.column :serial
  	end
  end
end

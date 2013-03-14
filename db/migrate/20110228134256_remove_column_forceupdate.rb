class RemoveColumnForceupdate < ActiveRecord::Migration
  def self.up
	  remove_column :applications, :forceupdate
  end
end

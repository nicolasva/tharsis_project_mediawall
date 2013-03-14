class DropColumnAvoirsBaseVersion < ActiveRecord::Migration
  def self.up
  	remove_column(:avoirs, :base_version)
  end
end

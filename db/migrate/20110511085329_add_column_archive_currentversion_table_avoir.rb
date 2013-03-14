class AddColumnArchiveCurrentversionTableAvoir < ActiveRecord::Migration
  def self.up
	add_column :avoirs, :archive_currentversion, :boolean, :default=>false
  end
end

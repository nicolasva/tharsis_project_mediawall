class AddColumnBaseVersionFichiercompressionId < ActiveRecord::Migration
  def self.up
	  add_column :fichiercompressions, :base_version, :boolean, :default=>false 
  end
end

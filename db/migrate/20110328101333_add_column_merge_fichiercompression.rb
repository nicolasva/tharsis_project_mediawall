class AddColumnMergeFichiercompression < ActiveRecord::Migration
  def self.up
	 add_column(:fichiercompressions, :mergeversion, :string) 
  end
#  def self.down
#  end
end

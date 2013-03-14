class Zip < ActiveRecord::Base
	validates_presence_of :file_file_name, :message=>"Veuillez uploader un fichier"
	has_attached_file :file, :style => { :thumb => ["120x120>"], :visu => ["400x400>"] },
	:url => "/zip/:id/:style/:basename.:extension",
	:path => ":rails_root/public/zip/:id/:style/:basename.:extension"
end


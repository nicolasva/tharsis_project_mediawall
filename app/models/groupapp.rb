class Groupapp < ActiveRecord::Base
	validates_presence_of :name, :message => "Veuillez entrer le nom du Groupe d'applications que vous désireé ajouter"
	has_many :applications
	has_and_belongs_to_many :roles
	validates_uniqueness_of :name
end

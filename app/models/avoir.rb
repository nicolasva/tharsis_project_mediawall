class Avoir < ActiveRecord::Base
	belongs_to :fichiercompression
	belongs_to :application
end

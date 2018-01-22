class MenuItem < ApplicationRecord
	
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]
	attr_accessor :slug

	belongs_to :category
	
	validates :title, :description, :price, :category_id, presence: :true
end

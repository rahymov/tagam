class Category < ApplicationRecord
	
	extend FriendlyId
	friendly_id :name, use: [:finders, :slugged ]
	attr_accessor :slug
	
	has_many :menu_items

	# def should_generate_new_friendly_id?
	# 	new_receord?
	# end
end

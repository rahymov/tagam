class MenuItem < ApplicationRecord
	belongs_to :category
	validates :title, :description, :price, :category_id, presence: :true
end

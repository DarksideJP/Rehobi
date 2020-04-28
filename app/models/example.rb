class Example < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true
	validates :before_image, presence: true
	validates :after_image, presence: true
	has_many :favorites
	belongs_to :category, optional: true
	attachment :before_image
	attachment :after_image
	default_scope -> {order(created_at: :desc)}

end

class Product < ActiveRecord::Base
	has_many :orders, through: :line_items
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: 	{ with: %r{\.(gif|jpg|jpeg|png)\Z}i,
													message: 'URL accepts JPG JPEG PNG GIF'}
	validates :title, length: { maximum: 10 } 

	private

		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'There are some product lines')
				return false
			end
		end

end

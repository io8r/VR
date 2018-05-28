class Product < ActiveRecord::Base

validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true
validates :image_url, allow_blank: true, format: 	{ with: %r{\.(gif|jpg|jpeg|png)\Z}i,
													message: 'URL accepts JPG JPEG PNG GIF'}

#additional task from the end of the book's chapter: 
#total length of the title should not be more than 10 symbols

validates :title, length: { maximum: 10 } 

end 

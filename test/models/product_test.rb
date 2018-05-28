require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
	fixtures :products

  #here are some methods, needed for tests below

  #method for test "image url"
  def new_product(image_url)
  	
  	Product.new(title: "r", description: "r", price: 1, image_url: image_url)
  
  end

	# here are the tests

	test "image url" do
	
	ok = %w{fred.gif fred.jpg fred.png FRED.JPG fRed.Jpg http://a.b.c/x/w/q/fred.gif }

	bad = %w{ fred.dc fred.gif/123 fred.gif.php}

		ok.each do |name|
			assert new_product(name).valid?, "#{name} should not be invalid"
		end

		bad.each do |name|
			assert new_product(name).invalid?, "#{name} should not be valid"
		end

	end

	test "product attributes must not be empty" do 
  	
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  
  end

  test "product price must be positive" do 
  	
  	product = Product.new(title: "Book Title", description: "yyy", image_url: "123.jpg")

  	#specially made failure
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater then or equal to 0.01"],
  	product.errors[:price]
  	
  	product.price = 0
  	assert product.invalid?

  	assert_equal ["must be greater then or equal to 0.01"],
  	product.price = 1
  	assert product.valid?

  end
  
  test "product is not valid if it has not unique title" do
  	
  	product = Product.new(title: products(:ruby).title, description: "yyy", image_url: "123.jpg")
  	assert product.invalid?
  	assert_equal ["has already been taken"], product.errors[:title]

  end



end

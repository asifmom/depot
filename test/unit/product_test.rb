require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "Basic Product Validations" do
    product=Product.new
    assert product.invalid?
    assert product.errors[:title]
    assert product.errors[:image_url]
    assert product.errors[:price]
  end


  test "Price of Product must be positive" do
    product = Product.new(:title => 'some title', :description => "some description", :image_url => "a.jpg")
    product.price=-1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join("")

    product.price=0
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join("")

    product.price=1
    assert product.valid?

  end

  test "image url" do
    product = Product.new(:title => 'some title', :description => "some description", :price => 1)

    good=%w{fred.gif a.jpg b.png images/i.jpg}

    bad=%w{a.more images/gif.and}

    good.each do |good_image|
      product.image_url=good_image
      assert product.valid?
    end


    bad.each do |bad_image_name|
      product.image_url=bad_image_name
      assert product.invalid?
    end


  end

  test "unique title" do
    product = Product.new(:title => products(:ruby).title, :description => "some description", :price => 1)
    assert !product.save
    assert product.invalid?
  end
end

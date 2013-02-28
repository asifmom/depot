class Product < ActiveRecord::Base
  default_scope :order=>'title'
  attr_accessible :description, :image_url, :price, :title
  validates_presence_of :title, :price, :image_url
  validates_uniqueness_of :title
  validates :price,:numericality => {:greater_than_or_equal_to => 0.01,:message => "must be greater than or equal to 0.01"}
  validates :image_url,:format => {:with => %r{\.(jpg|png|gif)$}i,:message => 'must be valid image with extension jpg, png of gif image'}
end

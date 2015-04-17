class List < ActiveRecord::Base
#
  has_and_belongs_to_many :products
  attr_writer :product_token

#  attr_accessor :product_ids, :name, :description, :tags
  def product_token=(ids)
    self.product_ids = ids.split(",")
  end
  def product_token
    self.product_ids
  end
  def products_count
    self.product_ids.count
  end
end

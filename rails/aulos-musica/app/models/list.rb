class List < ActiveRecord::Base
#
  has_and_belongs_to_many :products

#  attr_accessor :product_ids, :name, :description, :tags

  def products_count
    self.product_ids.count
  end
end

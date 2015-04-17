class List < ActiveRecord::Base
  has_and_belongs_to_many :products

  def products_count
    self.products_ids.count
  end
end

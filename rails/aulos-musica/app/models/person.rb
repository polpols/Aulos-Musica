class Person < Contact
  has_and_belongs_to_many :products, :join_table => "composership", :foreign_key => "product_id"

  def person_token
    self.name+", "+self.surname
  end
end
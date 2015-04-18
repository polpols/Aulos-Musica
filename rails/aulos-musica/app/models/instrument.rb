class Instrument < ActiveRecord::Base
  has_and_belongs_to_many :products, :join_table => "instrumentation", :foreign_key => "products_id"
end

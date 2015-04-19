class Partition < Product
  has_and_belongs_to_many :instruments, :join_table => "instrumentation", :foreign_key => "instrument_id"
  has_and_belongs_to_many :people, :join_table => "composership", :foreign_key => "contact_id"
end

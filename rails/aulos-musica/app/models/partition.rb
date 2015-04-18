class Partition < Product
  has_and_belongs_to_many :instruments, :join_table => "instrumentation", :foreign_key => "instrument_id"

end

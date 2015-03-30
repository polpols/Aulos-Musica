class AddPriceToPartitions < ActiveRecord::Migration

  def self.up
    add_column :partitions, :price, :decimal
  end
  
  def self.down
    remove_column :partitions, :price
  end  
end
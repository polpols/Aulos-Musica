class CreatePartitions < ActiveRecord::Migration
  def self.up
    create_table :partitions do |t|
      t.column :title, :string
      t.column :skill, :string
      t.column :serie, :string
      t.column :catnum, :string
      t.column :isbn, :integer
      t.column :description, :string
    end
  end
  
  def self.down
    drop_table :partitions
  end  
end
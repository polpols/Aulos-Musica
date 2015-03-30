class AddPhotoToPartitions < ActiveRecord::Migration
  def self.up
    add_column :partitions, :photo, :binary
  end
  
  def self.down
    remove_column :partitions, :photo
  end  
end
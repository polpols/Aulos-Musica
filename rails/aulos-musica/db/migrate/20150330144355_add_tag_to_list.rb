class AddTagToList < ActiveRecord::Migration
  def change
    add_column :lists, :tags, :string, array: true
    add_index :lists, :tags, using: 'gin'
  end
end

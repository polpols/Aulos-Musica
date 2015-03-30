class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :composer
      t.string :description
      t.string :info
      t.string :instrument
      t.string :isbn
      
    end
  end
end

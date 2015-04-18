class CreateComposership < ActiveRecord::Migration
  def change
    create_table :composership do |t|
      t.integer :contact_id
      t.integer :product_id
    end
    add_index :composership, :contact_id
    add_index :composership, :product_id
  end
end

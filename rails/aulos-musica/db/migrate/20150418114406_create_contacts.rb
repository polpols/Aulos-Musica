class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :company
      t.string :name
      t.string :surname

      t.timestamps null: false
    end
    add_index :contacts, :type
  end
end

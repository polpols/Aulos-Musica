class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :abbr

      t.timestamps null: false
    end
    add_index :instruments, :name
    add_index :instruments, :abbr
  end
end

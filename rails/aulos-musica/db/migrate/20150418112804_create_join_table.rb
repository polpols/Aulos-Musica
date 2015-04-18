class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :products, :instruments, table_name: :instrumentation
  end
end

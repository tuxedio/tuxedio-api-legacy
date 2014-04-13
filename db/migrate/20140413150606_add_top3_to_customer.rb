class AddTop3ToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :pick_1, :text
    add_column :customers, :pick_2, :text
    add_column :customers, :pick_3, :text
  end
end

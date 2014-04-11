class AddTop3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pick_1, :text
    add_column :users, :pick_2, :text
    add_column :users, :pick_3, :text
  end
end

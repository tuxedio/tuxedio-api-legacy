class AddNameAndLocationToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :name, :string
    add_column :customers, :location, :string
  end
end

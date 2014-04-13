class AddNameAndLocationToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :name, :string
    add_column :vendors, :location, :strin
  end
end

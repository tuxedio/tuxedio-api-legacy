class AddZipCodeToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :zip_code, :integer
  end
end

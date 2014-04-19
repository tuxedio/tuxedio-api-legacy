class AddDetailsToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :phone_number, :string
    add_column :vendors, :sample_image, :string
    add_column :vendors, :state, :string
    add_column :vendors, :country, :string
    add_column :vendors, :coordinates, :text
  end
end

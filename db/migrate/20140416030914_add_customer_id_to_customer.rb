class AddCustomerIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :customer_id, :integer
  end
end

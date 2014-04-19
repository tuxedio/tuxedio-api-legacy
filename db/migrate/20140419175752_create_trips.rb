class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :customer_id
    end
  end
end

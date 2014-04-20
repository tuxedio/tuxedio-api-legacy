class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :customer_id
      t.string :trip_name
    end
  end
end

class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.belongs_to :customer
    end
  end
end

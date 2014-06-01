class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.belongs_to :customer, null: false
      t.string :location
      t.date :start_date
      t.integer :number_of_days
    end
  end
end

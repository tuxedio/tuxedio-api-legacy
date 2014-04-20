class AddElementsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :location, :string
    add_column :trips, :start_date, :date
    add_column :trips, :number_of_days, :integer
  end
end

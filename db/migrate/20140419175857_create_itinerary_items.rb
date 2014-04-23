class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.integer :trip_id
      t.integer :activity_id
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end

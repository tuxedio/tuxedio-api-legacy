class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.integer :trip_id
      t.integer :activity_id
    end
  end
end

class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.belongs_to :activity_time, null: false
      t.belongs_to :trip, null: false
    end
  end
end

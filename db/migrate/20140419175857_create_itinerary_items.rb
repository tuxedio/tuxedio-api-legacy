class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.references :itemable, polymorphic: true
      t.belongs_to :activity_time
      t.belongs_to :trip
    end
  end
end

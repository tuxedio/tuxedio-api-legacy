class CreateJourneyItems < ActiveRecord::Migration
  def change
    create_table :journey_items do |t|
      t.belongs_to :experience_time, null: false
      t.belongs_to :adventure, null: false
    end
  end
end

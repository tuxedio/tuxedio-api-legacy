class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price, :precision => 8, :scale => 2
      t.belongs_to :vendor
      t.integer :activity_id

      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

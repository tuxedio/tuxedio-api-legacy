class CreateActivityTimes < ActiveRecord::Migration
  def change
    create_table :activity_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :activity

      t.timestamps
    end
  end
end

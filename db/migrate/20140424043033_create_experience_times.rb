class CreateExperienceTimes < ActiveRecord::Migration
  def change
    create_table :experience_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :experience

      t.timestamps
    end
  end
end

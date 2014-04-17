class AddActivityIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :activity_id, :integer
  end
end

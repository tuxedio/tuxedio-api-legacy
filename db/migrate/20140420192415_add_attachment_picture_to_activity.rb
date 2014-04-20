class AddAttachmentPictureToActivity < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :activities, :picture
  end
end

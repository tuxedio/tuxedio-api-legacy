class AddAttachmentPictureToExperience < ActiveRecord::Migration
  def self.up
    change_table :experiences do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :experiences, :picture
  end
end

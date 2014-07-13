class AddAttachmentPictureToPersons < ActiveRecord::Migration
  def self.up
    add_attachment :people, :picture
  end

  def self.down
    remove_attachment :people, :picture
  end
end

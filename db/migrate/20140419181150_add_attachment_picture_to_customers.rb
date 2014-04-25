class AddAttachmentPictureToCustomers < ActiveRecord::Migration
  def self.up
    add_attachment :customers, :picture
  end

  def self.down
    remove_attachment :customers, :picture
  end
end

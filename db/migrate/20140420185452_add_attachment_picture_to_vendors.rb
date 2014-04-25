class AddAttachmentPictureToVendors < ActiveRecord::Migration
  def self.up
    change_table :vendors do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :vendors, :picture
  end
end

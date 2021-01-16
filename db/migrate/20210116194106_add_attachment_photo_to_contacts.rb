class AddAttachmentPhotoToContacts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :contacts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :contacts, :photo
  end
end

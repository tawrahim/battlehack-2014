class AddAttachmentPictureToRaffles < ActiveRecord::Migration
  def self.up
    change_table :raffles do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :raffles, :picture
  end
end

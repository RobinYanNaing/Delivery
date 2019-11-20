class AddAttachmentLocationImgToLocations < ActiveRecord::Migration[5.2]
  def self.up
    change_table :locations do |t|
      t.attachment :location_img
    end
  end

  def self.down
    remove_attachment :locations, :location_img
  end
end

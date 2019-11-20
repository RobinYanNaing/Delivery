class Location < ApplicationRecord
	belongs_to :user

	has_attached_file :location_img, styles: { medium: "400x7290>", thumb: "325x475>" ,:export =>{ :quality => 100, :format => 'JPG'}}
	validates_attachment_content_type :location_img, content_type: /\Aimage\/.*\z/
end

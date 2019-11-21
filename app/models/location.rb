class Location < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_attached_file :location_img, styles: { medium: "400x7290>", thumb: "325x475>" ,:export =>{ :quality => 100, :format => 'JPG'}}
	validates_attachment_content_type :location_img, content_type: /\Aimage\/.*\z/

	def self.search_by(search_term)
		where ("LOWER(name) LIKE :search_term"),
		 search_term: "%#{search_term.downcase}%"
	end
end

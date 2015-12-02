class Restaurant < ActiveRecord::Base
	has_many :tables
	has_many :menus
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.search(name_field, city_field, zip_code_field)
		where("name LIKE ? AND city LIKE ? AND zip_code = ?", "%#{name_field}%", "%#{city_field}%", "%#{zip_code_field}%")
	end
end

class Restaurant < ActiveRecord::Base
	has_many :tables, :dependent => :destroy
	has_many :menus, :dependent => :destroy
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.search(name_field, city_field, zip_code_field)
		if zip_code_field == '' and city_field == '' and name_field == '';
		elsif zip_code_field == '' and city_field == ''
			where("MATCH(name) AGAINST(? IN BOOLEAN MODE)", "#{name_field}*")
		elsif zip_code_field == '' and name_field == '';
			where("MATCH(city) AGAINST(? IN BOOLEAN MODE)", "#{city_field}*")
		elsif city_field == '' and name_field == '';
			where("zip_code = ?", "#{zip_code_field}")
		elsif zip_code_field == ''
			where("MATCH(name) AGAINST(? IN BOOLEAN MODE) AND MATCH(city) AGAINST(? IN BOOLEAN MODE)", "#{name_field}*", "#{city_field}*")
		elsif city_field == ''
			where("MATCH(name) AGAINST(? IN BOOLEAN MODE) AND zip_code = ?", "#{name_field}*", "#{zip_code_field}")
		elsif name_field == ''
			where("MATCH(city) AGAINST(? IN BOOLEAN MODE) AND zip_code = ?", "#{city_field}*", "#{zip_code_field}")
		else
			where("MATCH(name) AGAINST(? IN BOOLEAN MODE) AND MATCH(city) AGAINST(? IN BOOLEAN MODE) AND zip_code = ?", "#{name_field}*", "#{city_field}*", "#{zip_code_field}")
		end
	end
end

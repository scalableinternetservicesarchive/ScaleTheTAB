class Item < ActiveRecord::Base
	belongs_to :menu
	has_many :line_items, :dependent => :destroy
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	# validates :image_url, allow_blank: true, format: {
	# 	with: %r{\.(gif|jpg|png\Z)}i,
	# 	message: 'must be a URL for GIF, JPG, PNG'
	# }


	private

  # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
	return true
      else
	errors.add(:base, 'Line Items present')
	return false
      end
    end
end

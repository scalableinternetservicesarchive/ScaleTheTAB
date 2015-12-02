class Tab < ActiveRecord::Base
  has_many :carts, dependent: :destroy
	belongs_to :table

  def total_bill
    carts.to_a.sum { |cart| cart.total_price }
  end

end

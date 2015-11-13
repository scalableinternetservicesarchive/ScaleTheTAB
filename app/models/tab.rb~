class Tab < ActiveRecord::Base
  has_many :carts, dependent: :destroy

  def total_bill
    carts.to_a.sum { |cart| cart.total_price }
  end

end

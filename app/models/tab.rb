class Tab < ActiveRecord::Base
  has_many :carts, dependent: :destroy
end

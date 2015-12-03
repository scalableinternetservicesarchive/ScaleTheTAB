class Menu < ActiveRecord::Base
	belongs_to :restaurant
	has_many :items#, :dependent => :destroy
end

class Equipment < ApplicationRecord
	has_many :as_rentalequips
        has_many :rental_equip, through: :as_rentalequips
#        has_many :rnums, through: :as_rentalequips
end

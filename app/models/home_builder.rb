class HomeBuilder < ApplicationRecord
	has_many :contacts
	enum area: {osaka: 1, kyoto: 2, nara: 3, hyogo: 4}
end

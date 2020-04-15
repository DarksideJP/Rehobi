class Category < ApplicationRecord
	has_many :contacts
	has_many :examples
end

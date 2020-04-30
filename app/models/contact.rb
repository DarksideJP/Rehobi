class Contact < ApplicationRecord
	belongs_to :end_user, -> {with_deleted}
	belongs_to :category
	belongs_to :home_builder, optional: true
	enum type: {house: 1, apartment: 2}
	enum react_status: {backlog: 0, WIP: 1, failure: 2, contract: 3, complete: 4}
	default_scope -> {order(created_at: :desc)}
end
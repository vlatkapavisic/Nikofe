class Page < ActiveRecord::Base
	belongs_to :user
	belongs_to :website
	belongs_to :navbar_item

	validates :title, presence: true, length: { maximum: 30 },
		uniqueness: { scope: :website_id, case_sensitive: false }
	validates :body, presence: true

	geocoded_by :address
	after_validation :geocode
end

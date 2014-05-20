class Page < ActiveRecord::Base
	belongs_to :user
	belongs_to :navbar_item
	belongs_to :website

	validates :title, presence: true, length: { maximum: 30 },
		uniqueness: { case_sensitive: false }
	validates :body, presence: true

	include Bootsy::Container

	geocoded_by :address
	after_validation :geocode
end

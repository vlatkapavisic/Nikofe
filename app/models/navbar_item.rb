class NavbarItem < ActiveRecord::Base
	has_many :pages
	belongs_to :website
	belongs_to :user

	validates :name, presence: true, length: { maximum: 15 },
		uniqueness: { scope: :website_id, case_sensitive: false }
end

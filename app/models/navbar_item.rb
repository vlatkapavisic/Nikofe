class NavbarItem < ActiveRecord::Base
	has_many :pages
	belongs_to :user
	belongs_to :website

	validates :name, presence: true, length: { maximum: 15 },
		uniqueness: { case_sensitive: false }
end

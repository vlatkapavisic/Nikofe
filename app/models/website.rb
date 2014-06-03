class Website < ActiveRecord::Base
	belongs_to :user
	has_many :pages
	has_many :navbar_items
	has_attached_file :home_cover,
		:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {}
	validates :name, uniqueness: { case_sensitive: false }
	validates_attachment_content_type :home_cover, :content_type => /\Aimage/
	validates_attachment_file_name :home_cover, :matches => [/png\Z/, /jpe?g\Z/]
	validates_attachment_size :home_cover, :in => 0..1.megabyte 
end

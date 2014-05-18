class User < ActiveRecord::Base
	has_one :website
  has_many :pages, dependent: :destroy
  has_many :navbar_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

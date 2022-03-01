class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  has_many :letters, through: :inboxes
  has_many :inboxes
  has_many :hobbies, through: :hobby_tags

end

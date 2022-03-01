class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :inbox, foreign_key: :first_user_id, class_name: 'Inbox'
  has_many :outbox, foreign_key: :second_user_id, class_name: 'Inbox'
  has_many :letters, through: :inbox, class_name: 'Inbox'
  has_many :letters, through: :outbox, class_name: 'Inbox'
  has_many :hobbies, through: :hobby_tags

end

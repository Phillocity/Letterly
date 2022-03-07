class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, presence: true

  has_many :inboxes, class_name: 'Inbox'
  has_many :letters
  has_many :hobbies, through: :hobby_tags

  include PgSearch::Model
  pg_search_scope :search_user,
    against: [ :name, :gender, :age],
    using: {
      tsearch: { prefix: true }
    }

  def inboxes
    Inbox.where(first_user: self).or(Inbox.where(second_user: self))
  end

  def letters
    Letter.where(sender: self).or(Letter.where(receiver: self))
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

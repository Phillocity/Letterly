class HobbyTag < ApplicationRecord
  has_many :hobbies
  belongs_to :user, dependent: :destroy
end

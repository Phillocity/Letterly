class HobbyTag < ApplicationRecord
  belongs_to :hobbies
  belongs_to :user, dependent: :destroy
end

class HobbyTag < ApplicationRecord
  belongs_to :hobby
  belongs_to :user

  validates :hobby, uniqueness: { scope: :user }
end

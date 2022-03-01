class Inbox < ApplicationRecord
  belongs_to :first_user, foreign_key: :first_user_id, class_name: 'User'
  belongs_to :second_user, foreign_key: :second_user_id, class_name: 'User'
end

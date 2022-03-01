class Inbox < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
end

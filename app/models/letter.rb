class Letter < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :inbox
  # belongs_to :outbox, class_name: 'Inbox'
end

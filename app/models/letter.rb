class Letter < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :inbox

  validates :subject, :content, presence: true

  has_rich_text :content
end

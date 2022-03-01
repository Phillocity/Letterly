class Hobby < ApplicationRecord
  belongs_to :hobby_tag, dependent: :destroy
end

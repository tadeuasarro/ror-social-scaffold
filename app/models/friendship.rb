class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :to_be_confirmed, -> { where(confirmed: false)}
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendship_requests
  has_many :requests_received, class_name: 'FriendshipRequest', foreign_key: :friend_id

  has_many :active_friendships
  has_many :friendships_friend, class_name: 'ActiveFriendship', foreign_key: :friend_id
end

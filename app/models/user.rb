class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following_user, through: :relationships, source: :followed #自分がフォローしている人
  
  has_many :relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followe, through: :relationships, source: :follower #自分がフォローされている人
  
  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end

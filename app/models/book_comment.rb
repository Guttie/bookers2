class BookComment < ApplicationRecord

  belongs_to :user
  belongs_to :book

  attachment :profile_image


end

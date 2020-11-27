class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :email, presence: true, confirmation: true

    has_many :posts
    has_many :comments


end

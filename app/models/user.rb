class User < ApplicationRecord
  has_many :reservations

  validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

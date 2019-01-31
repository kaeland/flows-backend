class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :plant
  has_many :rounds, through: :shifts
  has_many :operators, class_name: “User”, foreign_key: “user_id”
  belongs_to :manager, class_name: “User”
  has_one :address, as: :addressable
end

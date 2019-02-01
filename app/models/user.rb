class User < ApplicationRecord
  has_secure_password # From Bcrypt Gem
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :plant
  has_many :shifts, dependent: :destroy
  has_many :rounds, through: :shifts

  # Self joining associations
  has_many :operators, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User", optional: true

  # Polymorphic association
  has_one :address, as: :addressable, dependent: :destroy 
end

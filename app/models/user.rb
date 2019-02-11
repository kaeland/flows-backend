class User < ApplicationRecord
  has_secure_password # From Bcrypt Gem

  belongs_to :plant, optional: true

  has_many :user_shifts, dependent: :destroy 
  has_many :shifts, through: :user_shifts
  
  has_many :rounds, through: :shifts
  has_many :machine_rounds, through: :rounds 
  
  # Self joining associations
  has_many :operators, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User", optional: true
  
  # Polymorphic association
  has_one :address, as: :addressable, dependent: :destroy 
  
  validates :username, uniqueness: { case_sensitive: false }
end
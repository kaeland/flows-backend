class Plant < ApplicationRecord
  has_many :users
  has_many :user_shifts, through: :users, dependent: :destroy
  has_many :shifts, through: :user_shifts, dependent: :destroy
  has_many :rounds, through: :shifts, dependent: :destroy

  has_many :machines, dependent: :destroy

  has_one :address, as: :addressable
end

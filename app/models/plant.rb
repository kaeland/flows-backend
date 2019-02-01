class Plant < ApplicationRecord
  has_many :users
  has_many :rounds, through: :users
  has_many :shifts, through: :users

  has_many :machines
  has_many :data, through: :machines

  has_one :address, as: :addressable
end

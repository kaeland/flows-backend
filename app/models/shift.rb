class Shift < ApplicationRecord
  has_many :user_shifts, dependent: :destroy
  has_many :users, through: :user_shifts

  has_many :rounds, dependent: :destroy

  has_many :machine_rounds, dependent: :destroy
  has_many :machines, through: :machine_rounds
end
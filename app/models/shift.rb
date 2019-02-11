class Shift < ApplicationRecord
  has_many :user_shifts, dependent: :destroy
  has_many :users, through: :user_shifts

  has_many :machine_rounds, dependent: :destroy
end
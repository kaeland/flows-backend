class Plant < ApplicationRecord
  has_many :users
  has_many :user_shifts, through: :users, dependent: :destroy
  has_many :shifts, through: :user_shifts, dependent: :destroy
  has_many :rounds, through: :shifts, dependent: :destroy

  has_many :machines, dependent: :destroy
  has_many :machine_rounds, through: :machines, dependent: :destroy

  has_one :address, as: :addressable

  def plant_stats
    plant_stats = {
      machine_count: self.machines.count,
      data_point_count: self.machine_rounds.count,
      user_count: self.users.count
    }
  end
end

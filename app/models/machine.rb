class Machine < ApplicationRecord
  belongs_to :plant
  belongs_to :round
  has_many :data
end
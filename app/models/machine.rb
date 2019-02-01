class Machine < ApplicationRecord
  belongs_to :plant
  belongs_to :round, optional: true
  has_many :data
end
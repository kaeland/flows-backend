class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :round, optional: true
end
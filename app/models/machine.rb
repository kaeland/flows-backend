class Machine < ApplicationRecord
  belongs_to :plant
  has_many :machine_rounds, dependent: :destroy
  has_many :rounds, through: :machine_rounds
  has_many :shifts, through: :machine_rounds
  
  def map_time_to_num(time)
    case time
    when "7am"
      0
    when "11am"
      4
    when "3pm"
      8
    end
  end

  def render_chart_data
    data = self.rounds.map do |r|
      { x: map_time_to_num(r.time_of_day), y: MachineRound.find_by(machine_id: self.id, round_id: r.id).data.to_f }
    end
  end

  def self.create_machine_data
    mapped_data = self.all.map do |machine|
      { id: machine.id, machine: machine.name, data: machine.render_chart_data }
    end
  end
end
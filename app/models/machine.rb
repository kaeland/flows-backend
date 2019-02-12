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


  # Creates data that is readable for react-vis chart
  def render_chart_data
    data = self.rounds.map do |r|
      { x: map_time_to_num(r.time_of_day), y: MachineRound.find_by(machine_id: self.id, round_id: r.id).data.to_f }
    end
  end

  # Maps readable chart data to each machine in database
  def self.create_machine_data
    mapped_data = self.all.map do |machine|
      { id: machine.id, machine: machine.name, data: machine.render_chart_data }
    end
  end

  # Returns array of rounds with associated machine data
  def machine_data_to_round
    machine_id = self.id
    rounds = Round.all.map do |round|
      { round_id: round.id, time: round.time_of_day, data: MachineRound.find_by(machine_id: machine_id, round_id: round.id).data }
    end
  end

  # Places each machines associated round in a hash
  def self.map_machine_round_data
    machines = self.all.map do |machine|
      { machine_id: machine.id, name: machine.name, rounds: machine.machine_data_to_round }
    end
  end
end
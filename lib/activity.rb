
class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, spent)
    @participants[name] += spent
  end

  def total_cost
    spent = @participants.reduce(0) do |result, (participant, spent)|
      result += spent
    end
  end

end

class Reunion

  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    activities.reduce(0) do |result, activity|
      result += activity.total_cost
    end
  end

  def breakout
    activities.reduce(Hash.new(0)) do |result, activity|
      combine_activity_balances(result, activity)
      result
    end
  end

  def combine_activity_balances(result, activity)
    activity.owed.each_pair do |participant, owes|
      result[participant] += owes
    end
  end
end

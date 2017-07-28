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
end

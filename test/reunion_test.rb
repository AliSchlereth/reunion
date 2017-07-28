require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

require "pry"

class ReunionTest < Minitest::Test

  def test_reunion_is_created_with_a_name
    reunion = Reunion.new("Denver")

    assert_instance_of Reunion, reunion
    assert_equal "Denver", reunion.name
  end

  def test_reunion_takes_activities
    reunion = Reunion.new("Denver")

    assert_equal [], reunion.activities
  end

  def test_add_activity_adds_activity_to_activities
    reunion = Reunion.new("Denver")
    activity = Activity.new("Movie")
    activity.add_participant("Ali", 12)
    activity.add_participant("Sal", 12)

    reunion.add_activity(activity)

    assert_equal activity, reunion.activities.last
  end

  def test_add_activity_adds_activities_to_activities
    reunion = Reunion.new("Denver")
    activity = Activity.new("Movie")
    activity.add_participant("Ali", 12)
    activity.add_participant("Sal", 12)
    activity_2 = Activity.new("Lunch")
    activity.add_participant("Ali", 12)
    activity.add_participant("Sal", 12)

    assert_equal 0, reunion.activities.length

    reunion.add_activity(activity)
    reunion.add_activity(activity_2)

    assert_equal 2, reunion.activities.length
  end

  def test_reunion_total_cost_adds_costs_for_all_activities
    reunion = Reunion.new("San Fran")
    activity = Activity.new("Hill Walking")
    activity.add_participant("Ali", 15)
    activity.add_participant("Sal", 5)
    activity_2 = Activity.new("Golden Gate")
    activity.add_participant("Ali", 8)
    activity.add_participant("Sal", 12)

    reunion.add_activity(activity)
    reunion.add_activity(activity_2)

    assert_equal 40, reunion.total_cost
  end
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require "pry"

class ActivityTest < Minitest::Test

  def test_activity_takes_a_name
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
    assert_equal "Brunch", activity.name
  end

  def test_participants_defaults_to_empty_hash
    activity = Activity.new("Ball Game")

    assert_instance_of Hash, activity.participants
    assert activity.participants.empty?
  end

  def test_add_participant_adds_to_participants
    activity = Activity.new("Ball Game")

    assert activity.participants.empty?

    activity.add_participant("Ali", 10)

    refute activity.participants.empty?
    assert_equal 10, activity.participants["Ali"]
  end

  def test_total_cost_sums_up_total_folks_spent
    activity = Activity.new("Hike")

    activity.add_participant("Ali", 8)
    activity.add_participant("Sal", 12)

    assert_equal 20, activity.total_cost
  end

  def test_total_cost_sums_up_total_3_participants
    activity = Activity.new("Hike")

    activity.add_participant("Ali", 8)
    activity.add_participant("Sal", 12)
    activity.add_participant("Mike", 10)

    assert_equal 30, activity.total_cost
  end
end

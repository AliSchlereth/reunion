require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

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
end

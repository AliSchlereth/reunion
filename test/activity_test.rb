require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_takes_a_name
    activty = Activity.new("Brunch")

    assert_instance_of Activity, activity
    assert_equal "Brunch", activity.brunch
  end
end

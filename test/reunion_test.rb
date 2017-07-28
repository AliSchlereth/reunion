require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require "pry"

class ReunionTest < Minitest::Test

  def test_reunion_is_created_with_a_name
    reunion = Reunion.new("Denver")

    assert_instance_of Reunion, reunion
    assert_equal "Denver", reunion.name
  end
end

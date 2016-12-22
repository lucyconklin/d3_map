require './importer'
require 'minitest/autorun'
require 'minitest/pride'

class ImporterTest < Minitest::Test
  def test_it_will_initialize
    filename = 'csv/nps_parks.csv'
    location = 'csv/parks_by_state.csv'
    importer = NationalParkImporter.new(filename, location)

    assert_equal NationalParkImporter, importer.class
  end

  def test_it_can_import
    filename = 'csv/nps_parks.csv'
    location = 'csv/parks_by_state.csv'
    importer = NationalParkImporter.new(filename, location)
    p result = importer.import

    assert_equal "Hello World", result
  end
end

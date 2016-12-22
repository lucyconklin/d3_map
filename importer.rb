require 'csv'
require 'pry'

class NationalParkImporter
  attr_reader :filename, :number_of_lines

  def initialize(filename, location)
    @filename = filename
    @number_of_lines = `wc -l #{filename}`.to_i
    @state_parks = Hash.new(0)
  end

  def import
    contents = CSV.open @filename, headers:true, header_converters: :symbol
    contents.each do |row|
      row[:state].split(",").each do |state|
        @state_parks[state] += 1
      end
    end
    make_json(@state_parks)
  end

  def make_json(state_parks)
    json = ""
    state_parks.each do |key, value|
      json << "#{key},#{value}"+"\n"
    end
    p json
  end
end

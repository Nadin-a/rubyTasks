class Field

  attr_accessor  :field

  def initialize
    @field = [
        [45, 44, 43, 42, 41, 40],
        [35, 34, 33, 32, 31, 30],
        [25, 24, 23, 22, 21, 20],
        [15, 14, 13, 12, 11, 10],
        [05, 04, 03, 02, 01, 00],
    ].freeze
  end

  def show_field(coord, direction_of_robot)
    @field.size.times do |i|
      row = ''
      @field[i].size.times do |j|
        row += @field[i][j] == coord.to_i ? direction_of_robot : '[]'
      end
      puts row
    end
  end

end
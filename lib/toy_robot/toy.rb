module ToyRobot
  class Toy
    attr_accessor :position, :direction, :direction_name

    DIRECTIONS = {
      NORTH: [0, 1],
      EAST:  [1, 0],
      SOUTH: [0, -1],
      WEST:  [-1, 0]
    }.freeze

    ROTATION = { LEFT: -1, RIGHT: 1 }.freeze

    def initialize(direction, position)
      @direction = DIRECTIONS.fetch(direction.to_sym)
      @direction_name = direction.to_sym
      @position = position.dup
    end

    def update_position(new_position)
      @position = new_position
    end

    def rotate(to)
      id = DIRECTIONS.values.index(@direction)
      new_id = id + ROTATION.fetch(to.to_sym)
      new_id = 0 if new_id > 3
      new_id = 3 if new_id < 0
      @direction = DIRECTIONS.values[new_id]
      @direction_name = DIRECTIONS.keys[new_id]
    end
  end
end

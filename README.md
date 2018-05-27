# Mars Rover JT

## Assumptions
- The **Rover** can only move forward and backwards and turn left and right, as many times as you want it to.
- The **Grid**'s wrapping from one edge to another is implemented like the 'Snake Nokia game' and not like a real map projection of a sphere.
- Use Test Driven Development

# Objects
### Grid
The **Grid** only keeps its height and width, and the points where it can have obstacles.

### The Rover
The **Rover** Class can move forward, backwards and turn left and right (spin). Turning just changes orientation. It doesn't know about anything else. It can be deployed by passing orientation and position, otherwise it is initialized on the (0,0) position and orientation NORTH.

## The Rover Controller
The **Rover Controller** is the 'brain'. The rover controller knows about the Grid and the Rover at initialization. It can receive set of commands in the form of an array by calling :move, which makes the rover move by looking at the grid and checking obstacles and returns the rover position. It also readjusts the coordinates of the rover so the grid has a 'Sphere-like behavior'.


# Installation and tests
Clone repository and `cd` into it.

`bundle install`

Run tests:

`rspec`

Try it on `irb`:

`require_relative 'lib/rover_controller'`

`controller = RoverController.new`

`controller.move([:F,:F,:R,:F, :L])`

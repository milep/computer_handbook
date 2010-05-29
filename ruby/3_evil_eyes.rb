require 'curses'
include Curses

class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

def draw_eyes(point)
  sleep((rand 50) / 10.0)
  setpos(point.y, point.x)
  addstr("OO")
  setpos(28, 20)
end

def correct_answer(point)
  setpos(point.y, point.x)
  addstr("XX")
  setpos(28, 20)
  refresh
  sleep 0.5
end

def initialize_screen(screen)
  clear
  screen.box(0, 0)
  setpos(0, 35)
  addstr(" Evil eyes ");
  setpos(28, 0)
  addstr("Shoot target (1-4): ")
  refresh
end


init_screen
begin
  crmode
  
  screen = stdscr.subwin(27, 81, 0, 0)

  Curses.timeout = 1000

  eye_coordinates = [
                     Point.new(40, 1),
                     Point.new(1, 14),
                     Point.new(78, 12),
                     Point.new(39, 25)
                    ]
  shots = 0
  while shots < 5
    initialize_screen(screen)
    position = rand(4)
    draw_eyes(eye_coordinates[position])
    guess = getch
    if guess == (position + 1).to_s[0]
      correct_answer(eye_coordinates[position])
      shots += 1
    else
      setpos(28, 0)
      addstr("Miss! You were eaten!           ")
      break
    end
    refresh
  end
  setpos(29, 0)
  addstr("Kills: #{shots}/5  press any key to quit...         ")
  Curses.timeout = -1
  refresh
  sleep 2
  getch
ensure
    close_screen
end


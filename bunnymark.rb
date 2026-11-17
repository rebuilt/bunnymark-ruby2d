require 'ruby2d'

set title: 'BunnyMark Ruby2D'
set width: 1280
set height: 720
set fps_limit: 0

@bunny_count = 1000
@bunnies = []
@text_count = nil
@text_info = nil
@text_fps = nil

def reset_bunnies(count)
  @bunnies.each do |bunny|
    bunny[:shape].remove
  end
  @bunnies.clear
  @bunny_count = count

  create(count)
  update_labels
end

def create(count)
  count.times do |i|
    size = 20
    x = rand(1260 - size).to_f + size / 2.0
    y = rand(700 - size).to_f + size / 2.0
    dx = rand(40) - 5
    dy = rand(40) - 5
    @bunnies << {
      x: x,
      y: y,
      dx: dx,
      dy: dy,
      shape: Image.new('resources/raybunny.png', x: x, y: y, width: size, height: size, z: -1, color: [rand, rand, rand,1])
    }
  end
end

def update_labels
  @text_count&.remove
  @text_info&.remove
  @text_fps&.remove

  @text_count = Text.new("bunnies: #{@bunnies.size}", x: 40, y: 700, size: 18, color: 'white', z: 10)
  @text_info = Text.new("Press 'r' to reset with #{@bunny_count} bunnies", x: 40, y: 670, size: 14, color: 'white', z: 10)
  @text_fps = Text.new("FPS: #{Window.fps}", x: 40, y: 640, size: 14, color: 'white', z: 10)
end

on :key_down do |event|
  if event.key == 'r' || event.key == 'R'
    reset_bunnies(@bunny_count)
  elsif event.key == '=' || event.key == '+'
    @bunny_count = [@bunny_count + 1000, 100000].min
    reset_bunnies(@bunny_count)
  elsif event.key == '-'
    @bunny_count = [@bunny_count - 1000, 0].max
    if @bunny_count == 0
      @bunnies.each do |b|
        b[:shape].remove
      end
      @bunnies.clear
      @text_count&.remove
      @text_info&.remove
      @text_fps&.remove
    else
      reset_bunnies(@bunny_count)
    end
  end
end

update_rate = 1.0 / 60.0
frame_count = 0
last_time = Time.now

update do
  @bunnies.each do |bunny|
    bunny[:x] += bunny[:dx] * 8 * update_rate
    bunny[:y] += bunny[:dy] * 8 * update_rate

    if bunny[:x] <= 0 || bunny[:x] >= 1260
      bunny[:dx] *= -1
    end

    if bunny[:y] <= 0 || bunny[:y] >= 700
      bunny[:dy] *= -1
    end

    bunny[:shape].x = bunny[:x]
    bunny[:shape].y = bunny[:y]
  end

    fps = Window.fps
    @text_fps&.remove
    @text_fps = Text.new("FPS: #{fps}", x: 40, y: 640, size: 14, color: 'white', z: 10)

    if fps >= 60
      create(10)
      @bunny_count += 10
    elsif fps < 60 && @bunny_count > 0
      1.times do 

       b = @bunnies.shift
        b[:shape].remove
        @bunny_count -= 1
      end
    end
    update_labels
end

reset_bunnies(@bunny_count)
show

# BunnyMark Ruby2D

A [BunnyMark](https://github.com/ianlancetaylor/bunnymark) benchmark written in Ruby.
It spawns hundreds of bouncing bunnies, each with a random velocity and color, and
reports the frame rate. The bunny count adjusts itself based on the FPS, so the
benchmark settles around whatever the renderer can sustain.

The implementation targets the [Ruby 2D](https://www.ruby2d.com/) desktop app.

## Running

Requires Ruby and the `ruby2d` gem:

```sh
gem install ruby2d
ruby bunnymark.rb
```

The bunnies are drawn from `resources/raybunny.png` in a 1280x720 window.

### Controls

| Key | Action |
| --- | --- |
| `r` | Reset with the current bunny count |
| `+` / `=` | Reset with 1,000 more bunnies (max 100,000) |
| `-` | Reset with 1,000 fewer bunnies |

While running, the app adds 10 bunnies whenever the FPS is at or above 60 and
removes one when it drops below 60. The current bunny count and FPS are shown in
the bottom-left corner.

## Other files

- `resources/raybunny.png` - bunny sprite.
- `ruby2d.txt` - offline copy of the Ruby 2D documentation, kept for reference.

## License

No license specified.

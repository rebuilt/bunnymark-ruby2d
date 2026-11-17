# BunnyMark Ruby2D

A [BunnyMark](https://github.com/ianlancetaylor/bunnymark) benchmark written in Ruby.
It spawns hundreds of bouncing bunnies, each with a random velocity and color, and
reports the frame rate. The bunny count adjusts itself based on the FPS, so the
benchmark settles around whatever the renderer can sustain.

This repository contains two implementations:

| File | Target |
| --- | --- |
| `bunnymark.rb` | [Ruby 2D](https://www.ruby2d.com/) desktop app |
| `dragonruby.rb` | [DragonRuby GTK](https://dragonruby.org/) |

## Ruby 2D version

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

## DragonRuby version

`dragonruby.rb` is meant to be dropped into a DragonRuby GTK project as
`mygame/app/main.rb`. It uses the sample sprite at
`sprites/misc/wabbit_alpha.png`, so the DragonRuby samples need to be available.

The file prompts you to reset it with a given count via the DragonRuby console:

```ruby
reset_with count: 1000
```

Note that the initial `args.state.bunny_count` assignment is commented out in
the current file, and `reset_with` is what populates the bunny state.

## Other files

- `resources/raybunny.png` - bunny sprite used by the Ruby 2D version.
- `ruby2d.txt` - offline copy of the Ruby 2D documentation, kept for reference.

## License

No license specified.

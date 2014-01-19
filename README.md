[![Travis CI](https://travis-ci.org/chrishunt/mute.png)](https://travis-ci.org/chrishunt/mute)
[![Coverage Status](https://coveralls.io/repos/chrishunt/mute/badge.png?branch=master)](https://coveralls.io/r/chrishunt/mute)
[![Code Climate](https://codeclimate.com/github/chrishunt/mute.png)](https://codeclimate.com/github/chrishunt/mute)

### Muting test suites since 2014

![](https://raw2.github.com/chrishunt/mute/master/screenshot.png)

## Usage

Tired of seeing garbage printed to the screen during your test suite? Would you
like to prove that your fancy custom Logger is actually working? `Mute` is here
to help!

`Mute` can be used to mute and capture standard out or standard error in your
Ruby program. This is most useful in tests where output should be tested, not
displayed.

To capture standard out:

```ruby
require 'mute'

output = Mute::IO.capture_stdout do
  puts 'Hello World!'
end

puts output
  #=> Hello World!
```

To capture standard error:

```ruby
require 'mute'

output = Mute::IO.capture_stderr do
  $stderr.puts 'Oops!'
end

puts output
  #=> Oops!
```

Or use it in your test suite:

```ruby
require 'mute'

describe MyLogger do
  it 'prints the message to standard out' do
    message = 'Hello World!'

    output = Mute::IO.capture_stdout do
      MyLogger.new.print message
    end

    expect(output).to include message
  end
end
```

## Installation

```bash
$ gem install mute
```

## Contributing
Please see the [Contributing
Document](https://github.com/chrishunt/mute/blob/master/CONTRIBUTING.md)

## Changelog
Please see the [Changelog
Document](https://github.com/chrishunt/mute/blob/master/CHANGELOG.md)

## License
Copyright (C) 2014 Chris Hunt, [MIT
License](https://github.com/chrishunt/mute/blob/master/LICENSE.txt)

# DbcToday

## Purpose

To print out the events on the schedule for a particular phase, during a particular day and week of that phase.

## Installation

    $ gem install dbc_today

## Usage

`dbctoday [phase number] [week number] [day number (optional; defaults to current day number)]`

Examples:

`dbctoday 1 1 1` for phase 1, week 1, day 1 schedule
`dbctoday 1 1` for phase 1, week 1 schedule for today's day of the week

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dbc_today. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


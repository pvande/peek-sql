# Peek::SQL

Peek into the SQL queries being run in your application.

Things this peek view provides:

- Total time taken in SQL queries
- Per-Model time taken in SQL queries
- Per-Model SQL query counts
- Query cache statistics

## Installation

Add this line to your application's Gemfile:

    gem 'peek-sql'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-sql

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::SQL
```

You'll then need to add the following CSS and CoffeeScript:

CSS:

```scss
//= require peek
//= require peek/views/sql
```

CoffeeScript:

```coffeescript
#= require peek
#= require peek/views/sql
```

## Contributors

- [@pvande](https://github.com/pvande) for this

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

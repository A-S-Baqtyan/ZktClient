# ZktClient - a Ruby client for the Zkt APIs

ZktClient helps you write apps that need to interact with Zkt APIs by provideing you with a helper methods like a Rails ActiveRecord methods, those methods has been built depending on the Zkt APIs, currently we are supported only [BioTime APIs](https://zkteco.eu/sites/default/files/content/downloads/biotime-8.0-user-manual-v4.0-20201224.pdf).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zkt_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install zkt_client

## Usage

# Setup configurations

Our gem need three keys to make the integration
 
* Host url -> `ZKT_HOST`
* Username -> `ZKT_USERNAME`
* Password -> `ZKT_PASSWORD`

You can send that key to the gem using two ways:

* Add that keys to ENV variables and this is the default option.
 
  `NOTE: Our gem will read the credentials from ENV variables by default if not configured in Rails application.`

* Configure the credentials from Rails application, you need to create a new file called `zkt_client.rb` in `config/initializers` and add the following code in it.

```ruby
ZktClient.configure do |config|
  config.host = 'Your zkt host'
  config.username = 'Your account username'
  config.password = 'Your account password'
end
```

## Models:

Currently we are supported only the following models:

* Employee
* Terminal
* Area
* Transaction
* Department
* Position

## Methods:

* Instance methodes:

- `update(attributes)`
- `delete`

* Class methods:

* `find(id)`
* `find!(id)`
* `all`
* `where(**options)` 
* `create(**attributes)` -> creates a new object on DB.
* `delete(id)` -> delete specific object depending on passed id.

## Using methods:

* `find(id)` -> it accepts only integer and returns object or nil.

```ruby
 ZktClient::Employee.find(1) # object or nil
```

* `find!(id)` -> it accepts only integer and returns object or exception

```ruby
 ZktClient::Employee.find(1) # object or exception
```

* `all` -> returns all objects from DB.

```ruby
ZktClient::Employee.all # all objects
```

* `where(**options)` -> it accepts options, returns collection of objectes depending the options.

- Supported options:


```ruby
ZktClient::Employee.where()
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zkt_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/zkt_client/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ZktClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/zkt_client/blob/master/CODE_OF_CONDUCT.md).

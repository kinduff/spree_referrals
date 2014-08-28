Spree Referrals Extension
========================

# Still in development

This is a [Spree] extension that implements a simple referral system for the users, this allows users to refer other users through a hyperlink. 

## Installation

The master branch of `spree_referrals` is compatible with Ruby 1.9.x and Spree 2.3, if you need support for an older Spree version please open an issue.

Add spree_referrals to your Gemfile:

```ruby
gem 'spree_referrals', :github => 'kinduff/spree_referrals'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_referrals:install
```

Start your Spree instance and you're done.

If you already have registered users, you'll need to run the users install rake task:

```shell
bundle exec rake spree_referrals:users_install
```

## Usage

When a user is created, a referral record is being created too. This allows the user to relate referred users with its code.

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

Copyright (c) 2014 Kinduff, released under the New BSD License

[Spree]: http://spreecommerce.com/

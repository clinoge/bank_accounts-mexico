# BankAccounts::Mexico

This is a gem providing a YAML formatted database and a simple API over it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bankaccounts-mexico'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bankaccounts-mexico

## Usage

### Get bank data

``` ruby
    banks = BankAccounts::Mexico.load_data
```

### Test whether an account number is valid according to CABLE

``` ruby
    BankAccounts::Mexico.valid_account_number?("032180000118359719")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/clinoge/bankaccounts-mexico.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

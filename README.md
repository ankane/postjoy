# Postjoy

Postal codes made easy

## Get Started

Add this line to your application’s Gemfile:

```ruby
gem 'postjoy'
```

Lookup postal code

```ruby
Postjoy.find(94109)
# =>
{
  city: "San Francisco",
  state: "California",
  state_code: "CA",
  latitude: 37.7917,
  longitude: -122.4186
}
```

Returns `nil` if the postal code does not exist

## Validations

Also adds validations for Rails

```ruby
class Address < ActiveRecord::Base
  validates :postal_code, postal_code: true
end
```

## Credit

Data from [GeoNames](http://download.geonames.org/export/zip/)

## TODO

- international postal codes

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/postjoy/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/postjoy/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To update postal codes, download the updated list from [GeoNames](http://download.geonames.org/export/zip/) to `US.txt` and run:

```ruby
rake create
```

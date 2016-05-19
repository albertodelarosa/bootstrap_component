# BootstrapComponent

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bootstrap_component`. To experiment with that code, run `bin/console` for an interactive prompt.

Generates Twitter's Bootstrap components in the recommended formats,
with some available modification

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bootstrap_component'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap_component

## Usage

WELLS:
  = well({class: "well-primary", id: "34oiwe"}) do |w|
    - w.header do
      = plan.name
    - w.img({class: "img-responsive", src: plan.image_url, alt: ""})
    - w.p do
      = number_to_currency(plan.price)
    - w.p.buttoon({class: "btn-default btn-block"}) do
      = "add to cart"

  *** OR ***

  = well({class: "well-primary", id: "34oiwe"}) do |w|
    - w.img({class: "img-responsive", src: plan.image_url, alt: ""})
    - w.p do
      = number_to_currency(plan.price)
    - w.buttoon({class: "btn-default btn-block"}) do
      = "add to cart"

  - methods:
    - header: takes only a block parameter
    - img: takes opts parameters and block parameters (if needed)
    - div, p, button: take opts, content, and block parameters ( in that
      order, all are optional )



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bootstrap_component.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


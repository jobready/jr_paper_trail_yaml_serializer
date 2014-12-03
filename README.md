# JobReady's paper_trail YAML Serializer

paper_trail's default YAML serializer doesn't play nicely with
carrierwave-cascade. The YAML serializer defined in this gem
does. :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jr_paper_trail_yaml_serializer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jr_paper_trail_yaml_serializer

## Usage

**Note: You only need to use this gem if you're using carrierwave-cascade and
paper_trail.**

Create a `config/initializers/paper_trail.rb` file, containing the following:

```ruby
PaperTrail.serializer = PaperTrail::Serializers::JobReady::YAML
```

That's it!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jr_paper_trail_yaml_serializer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Fuchidori

Public pages management with Asset Pipeline.

Inspired by [gakubuchi](https://github.com/yasaichi/gakubuchi).

## Usage

In app/views/public_pages/404.html.haml:

```
%h1 Not found
%p This webpage is not found.
%p= link_to 'Home', root_path
```

In app/views/public_pages/500.html.haml:

```
%h1 Server error
%p This webpage is not working.
```

In app/views/layout/public.html.haml:

```
!!!
%html
  %head
    %title #{yield(:title)} | MyAPP
    = stylesheet_link_tag 'application', media: 'all'
    = favicon_link_tag '/favicon.ico'
  %body
    = yield
```

Compile the templeate with:

```
rake assets:precompile
```

or

```
rake fuchidori:generate
```

This will generate `public/404.html` and `public/500.html`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fuchidori'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install fuchidori
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

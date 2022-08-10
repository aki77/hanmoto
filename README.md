# Hanmoto

Public pages management with Asset Pipeline.

Inspired by [gakubuchi](https://github.com/yasaichi/gakubuchi).

## Usage

In app/views/public_pages/404.html.haml:

```haml
- provide(:title, 'Not found')
%h1 Not found
%p This webpage is not found.
%p= link_to 'Home', root_path
```

In app/views/public_pages/500.html.haml:

```haml
- provide(:title, 'Server error')
%h1 Server error
%p This webpage is not working.
```

In app/views/public_pages/robots.text.erb:

```erb
<% unless Rails.env.production? %>
User-Agent: *
Disallow: /
<% end %>
```

In app/views/layout/public.html.haml:

```haml
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
rake hanmoto:publish
```

This will generate `public/404.html`, `public/500.html`, and `public/robots.txt`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hanmoto'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install hanmoto
```

## Configuration

In `config/initializers/hanmoto.rb`, you can configure the following values.

```ruby
Hanmoto.configure do |config|
#   config.view_dir = 'public_page'
#   config.layouts = {
#     html: 'public',
#   }
end
```

If you set ENV['DISABLE_HANMOTO_ON_PRECOMPILE'] ,you can disable auto execution of hanmoto:publish on assets:precompile.

```bash
export DISABLE_HANMOTO_ON_PRECOMPILE=1
# then disable auto execution of hanmoto:publish on assets:precompile task.
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

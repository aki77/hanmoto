module Fuchidori
  class Railtie < Rails::Engine
    # options
    config.fuchidori = ActiveSupport::OrderedOptions.new
    config.fuchidori.view_dir = 'public_pages'
    config.fuchidori.layout = 'public'
  end
end

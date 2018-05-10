# frozen_string_literal: true

module Fuchidori
  class Railtie < Rails::Engine
    # options
    config.fuchidori = ActiveSupport::OrderedOptions.new
    config.fuchidori.view_dir = 'public_pages'
    config.fuchidori.layouts = {
      html: 'public',
    }
  end
end

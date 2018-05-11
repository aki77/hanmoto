# frozen_string_literal: true

require 'hanmoto/task'

module Hanmoto
  class Railtie < Rails::Engine
    # options
    config.hanmoto = ActiveSupport::OrderedOptions.new
    config.hanmoto.view_dir = 'public_pages'
    config.hanmoto.layouts = {
      html: 'public',
    }
  end
end

# frozen_string_literal: true

require 'hanmoto/task'
require 'hanmoto/rake_task_extension'

module Hanmoto
  class Railtie < Rails::Railtie
    # options
    config.hanmoto = ActiveSupport::OrderedOptions.new
    config.hanmoto.view_dir = 'public_pages'
    config.hanmoto.layouts = {
      html: 'public',
    }

    rake_tasks do
      load File.expand_path('../../tasks/hanmoto_tasks.rake', __FILE__)
    end

    Rails::Engine.prepend Hanmoto::RakeTaskExtension
  end
end

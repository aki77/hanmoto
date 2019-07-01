# frozen_string_literal: true

require 'hanmoto/task'
require 'hanmoto/rake_task_extension'

module Hanmoto
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../../tasks/hanmoto_tasks.rake', __FILE__)
    end

    Rails::Engine.prepend Hanmoto::RakeTaskExtension
  end
end

# frozen_string_literal: true

module Hanmoto
  module RakeTaskExtension
    def load_tasks(*args)
      super
      
      unless ENV['DISABLE_HANMOTO_ON_PRECOMPILE']
        # NOTE: should add at last
        Rake::Task['assets:precompile'].enhance do
          Rake::Task['hanmoto:publish'].invoke
        end
      end

      self
    end
  end
end

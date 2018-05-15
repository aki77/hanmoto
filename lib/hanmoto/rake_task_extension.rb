# frozen_string_literal: true

module Hanmoto
  module RakeTaskExtension
    def load_tasks(*args)
      super

      # NOTE: should add at last
      Rake::Task['assets:precompile'].enhance do
        Rake::Task['hanmoto:publish'].invoke
      end

      self
    end
  end
end

require 'fuchidori/task'

namespace :fuchidori do
  desc 'generate public pages'
  task generate: :environment do
    Fuchidori::Task.run(Rails.application.config.fuchidori)
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['fuchidori:generate'].invoke
end

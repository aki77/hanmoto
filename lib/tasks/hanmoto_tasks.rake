namespace :hanmoto do
  desc 'generate public pages'
  task publish: :environment do
    Hanmoto::Task.run(Rails.application.config.hanmoto)
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['hanmoto:publish'].invoke
end

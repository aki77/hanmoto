namespace :hanmoto do
  desc 'generate public pages'
  task publish: :environment do
    # NOTE: clear cache
    ActionView::Base.assets_manifest = Sprockets::Railtie.build_manifest(Rails.application)
    Hanmoto::Task.run(Rails.application.config.hanmoto)
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['hanmoto:publish'].invoke
end

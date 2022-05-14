namespace :hanmoto do
  desc 'generate public pages'
  task publish: :environment do
    # NOTE: clear cache
    if defined?(ActionView::Base.assets_manifest)
      ActionView::Base.assets_manifest = Sprockets::Railtie.build_manifest(Rails.application)
    end
    Hanmoto::Task.run(**Hanmoto.configuration.to_h)
  end
end

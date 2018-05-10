namespace :fuchidori do
  desc 'generate public pages'
  task generate: :environment do
    Dir.foreach(Rails.root.join('app', 'views', Rails.application.config.fuchidori.view_dir)) do |file|
      next if file.in?(%w[. ..])
      name, ext = file.split('.', 3)
      output_path = Rails.root.join('public', [name, ext].join('.'))
      html = ApplicationController.renderer.render("#{Rails.application.config.fuchidori.view_dir}/#{name}", layout: Rails.application.config.fuchidori.layout)
      File.write(output_path, html)
      ::Logger.new(::STDOUT).info("Writing #{output_path}")
    end
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['fuchidori:generate'].invoke
end

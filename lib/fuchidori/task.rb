# frozen_string_literal: true

module Fuchidori
  class Task
    EXTENSIONS = {
      text: 'txt',
    }.freeze

    def self.run(*args)
      new(*args).run
    end

    def initialize(view_dir:, layouts: {})
      @view_dir = view_dir
      @layouts = layouts
    end

    def run
      Dir.foreach(Rails.root.join('app', 'views', @view_dir)) do |file|
        next if file.in?(%w[. ..])
        name, format = file.split('.', 3)
        output_path = Rails.root.join('public', [name, format].join('.'))
        layout = @layouts[format.to_sym]
        body = ApplicationController.renderer.render("#{@view_dir}/#{name}", layout: layout)
        path = output_path(name, format)
        File.write(path, body)
        ::Logger.new(::STDOUT).info("Writing #{path}")
      end
    end

    def output_path(name, format)
      Rails.root.join('public', [name, ext_by_format(format)].join('.'))
    end

    def ext_by_format(format)
      EXTENSIONS.fetch(format.to_sym, format)
    end
  end
end

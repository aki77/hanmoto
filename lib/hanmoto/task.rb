# frozen_string_literal: true

module Hanmoto
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
        next if file.start_with?('.')
        name, format = file.split('.', 3)
        layout = @layouts[format.to_sym]
        body = ApplicationController.renderer.render("#{@view_dir}/#{name}", layout: layout)
        path = output_path(name, format)
        File.write(path, body)
        ::Logger.new(::STDOUT).info("Writing #{path}")
      end
    end

    private

      def output_path(name, format)
        Rails.public_path.join([name, ext_by_format(format)].join('.'))
      end

      def ext_by_format(format)
        EXTENSIONS.fetch(format.to_sym, format)
      end
  end
end

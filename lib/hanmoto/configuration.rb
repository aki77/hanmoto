module Hanmoto
  class Configuration
    OPTIONS = %i[view_dir layouts]

    attr_accessor *OPTIONS

    def initialize
      @view_dir = 'public_pages'
      @layouts = {
        html: 'public',
      }
    end

    def to_h
      OPTIONS.map { |name| [name, public_send(name)] }.to_h
    end
  end
end

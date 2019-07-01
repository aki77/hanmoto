require 'hanmoto/railtie'
require 'hanmoto/configuration'

module Hanmoto
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end

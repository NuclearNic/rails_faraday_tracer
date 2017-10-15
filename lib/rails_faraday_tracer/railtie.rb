module RailsFaradayTracer
  class Railtie < Rails::Railtie
  end
end

# lib/my_gem.rb
require 'rails_faraday_tracer/railtie' if defined?(Rails)

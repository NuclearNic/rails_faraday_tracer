require 'rails/generators'

module RailsFaradayTracer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates rails_faraday_tracer initializer for your application"

      def copy_initializer
        template "rails_faraday_tracer_initializer.rb", "config/initializers/rails_faraday_tracer.rb"
        template "faraday_tracer.rb", "app/middlware/faraday_tracer.rb"
        template "tracer.rb", "app/middlware/tracer.rb"

        puts "Install complete! Truly Outrageous!"
      end
    end
  end
end

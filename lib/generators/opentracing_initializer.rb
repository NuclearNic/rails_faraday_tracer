class InitializerGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"
  def create_initializer_file
    create_file "config/initializers/opentracing.rb",
    OpenTracing.global_tracer = Zipkin::Tracer.build(url: ENV['ZIPKIN_SERVICE_URL'], service_name: Rails.application.class.parent_name)
  end
end

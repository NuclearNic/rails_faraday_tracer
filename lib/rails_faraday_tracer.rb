require 'rails_faraday_tracer/version'
require 'faraday'
# STILL NEED TO THINK ABOUT THESE THINGIES:
# require 'rails_faraday_tracer/railtie'
# require 'generators/opentracing_initializer'
# require "rails_faraday_tracer/traced_request.rb"
# require "rails_faraday_tracer/tracer_middleware"
# require "rails_faraday_tracer/faraday_tracer_middleware"
# require "rails_faraday_tracer/opentracing_initializer"


module RailsFaradayTracer
  def faraday_get(url)

    connection = Faraday.new do |con|
      con.use FaradayTracer
      con.use Faraday::Adapter::NetHttp
    end

    carrier = {}
    OpenTracing.inject(@span.context, OpenTracing::FORMAT_RACK, carrier)
    connection.headers = denilize(carrier)
    response = connection.get(url)
  end

  def with_span(name)
    @span =
      if $active_span.present?
        OpenTracing.start_span(name, child_of: $active_span)
      else
        OpenTracing.start_span(name)
      end
    yield if block_given?
    @span.finish
  end

  def denilize(hash)
    hash.each {|k,v| hash[k] = "" if hash[k].nil?}
  end
end

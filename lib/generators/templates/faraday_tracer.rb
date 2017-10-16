require 'faraday'

class FaradayTracer < Faraday::Middleware
  def initialize(app, options = {})
    super(app)
    @name = options.fetch(:name, 'request.faraday')
  end

  def call(env)
    @app.call(env).on_complete do |e|
    end
  end
end

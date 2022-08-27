require 'rack'
require 'thin'

class WebServer
  def call(env)
    [200, { 'Content-Type' => 'text/html' }, ['<h1>Hello, world</h1>']]
    # [200,  'Content-Type' => 'text/html' }, env]
  end
end

Rack::Handler::Thin.run(WebServer.new)

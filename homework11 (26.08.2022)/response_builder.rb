require_relative 'response'
class ResponseBuilder
  def initialize(request:)
    @request = request
  end

  def build
    if @request[:path] == '/'
      respond_with('views' + '/index.html')
    else
      respond_with('views' + @request[:path])
    end
  end

  private

  def respond_with(path)
    if File.exist?(path)
      Response.new(code: 200, data: File.binread(path))
    else
      Response.new(code: 404)
    end
  end
end

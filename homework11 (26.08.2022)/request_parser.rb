class RequestParser
  def initialize(request:)
    @request = request
  end

  def parse
    method, path, _version = @request.lines[0].split

    { path: path, method: method, headers: headers }
  end

  private

  def headers
    headers = {}

    @request.lines[1..-1].each do |line|
      return headers if line == "\r\n"

      header, value = line.split
      header = header.gsub(':', '').downcase.to_sym

      headers[header] = value
    end
  end
end

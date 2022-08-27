class Response
  def initialize(code:, data: '')
    @code = code
    @response =
      "HTTP/1.1 #{code}\r\n" +
        "Content-Length: #{data.size}\r\n" +
        "\r\n" +
        "#{data}"
  end

  def to_s
    @response
  end
end

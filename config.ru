require 'rack/reverse_proxy'

class MyReverseProxy < Rack::ReverseProxy
  private
  def create_response_headers(http_response)
    response_headers = super(http_response)
    if response_headers
      if response_headers["Set-Cookie"].is_a?(Array)
        response_headers["Set-Cookie"] = response_headers["Set-Cookie"].join("\n")
      end
    end
    response_headers
  end
end

# this is to make /blog show my wordpress blog
use MyReverseProxy do
    reverse_proxy_options :preserve_host => true
    #reverse_proxy(/^\/blog(\/.*)$/, 'http://your-blog-server.com$1')
    reverse_proxy '/', 'http://zhidu.ap01.aws.af.cm'
end

app = proc do |env|
  [ 200, {'Content-Type' => 'text/html'}]
end

run app

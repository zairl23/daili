require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  reverse_proxy_options :preserve_host => true
  reverse_proxy '/', 'http://testruby.ap01.aws.af.cm'
  
end

app = proc do |env|
 # [ 200, {'Content-Type' => 'text/html'}]
end

run app

require 'socket'

host = "www.deneme.com"
def local_ip
  orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

  UDPSocket.open do |s|
    s.connect '64.233.187.99', 1
    s.addr.last
  end
ensure
  Socket.do_not_reverse_lookup = orig
end
path = "/index.html"

request = "Get #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host)


socket.print(request)

response = socket.read

http = Net::HTTP.net(host)

headers, body = http.get(path)

headers,body = response.split("\r\n\r\n",2)

if headers.code "200" 
  print body
else
  puts "#{headers.code} #{headers.message}"
end

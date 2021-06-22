require 'socket'

host = 'localhost'
port = 8080

sock = TCPSocket.open(host,port)

while line = sock.gets
    puts line.chop
end

sock.close
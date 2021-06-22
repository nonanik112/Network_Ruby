require 'socket'

server = TCPServer.open(8080)

loop {
    client = server.accept
    client.puts("Good, Bye_network!")
    client.puts("Goodbye, Client")
    client.puts("closing connection...")
    client.close
}
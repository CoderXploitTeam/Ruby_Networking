require "socket"
logo = """
┈┈┈┈┏┓┈┈┈┈☆┈┈┈┈┈   ┌───────────────────────────┐
┈┈┈┈┣┫┈┈┈┈┈┈☆┈┈┈   │ Room Chatting Dengan Ruby │
┈┈┈╭╯╰╮┈┈☆┈┈┈┈┈┈   └───────────────────────────┘
┈┈┈┃╭╮┃┈╭━☆╮┈┈┈┈  /
┈┈┈┃╳╳┃┈┣━━┣╮┈┈┈
╭━━┃╰╯┃━┃╲╲┣╯━━╮
┃╲╲╰━━╯╲╰━━╯╲╲╲┃
---------------=[ @Tegar_Dev ]=-----------------
"""
class Client
  def initialize( server )
    @server = server
    @request = nil
    @response = nil
    listen
    send
    @request.join
    @response.join
  end
# membaca pesan
  def listen
    @response = Thread.new do
      loop {
        msg = @server.gets.chomp
        puts "#{msg}"
      }
    end
  end
# kirim pesan
  def send
    print "Masukan Nama: "
    @request = Thread.new do
      loop {
        msg = $stdin.gets.chomp
        @server.puts( msg )
      }
    end
  end
end
# membuka server localhost
system("clear")
puts logo
server = TCPSocket.open( "localhost", 8080 )
Client.new( server ) 

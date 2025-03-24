require "http/server"
require "json"

# Sample data structure
class User
  include JSON::Serializable
  
  property id : Int32
  property name : String
  property email : String
  
  def initialize(@id, @name, @email)
  end
end

# Initialize sample data
USERS = [] of User
USERS << User.new(1, "John", "john@example.com")
USERS << User.new(2, "Jane", "jane@example.com")

# Create server
server = HTTP::Server.new do |context|
  context.response.content_type = "application/json"

  case {context.request.method, context.request.path}
  when {"GET", "/api/users"}
    context.response.print USERS.to_json
  when {"GET", /\/api\/users\/\d+/}
    id = context.request.path.split("/").last.to_i
    user = USERS.find { |u| u.id == id }
    
    if user
      context.response.print user.to_json
    else
      context.response.status_code = 404
      context.response.print ({error: "User not found"}).to_json
    end
  else
    context.response.status_code = 404
    context.response.print ({error: "Not found"}).to_json
  end
end

# Start server
puts "Server running at http://localhost:3000"
server.bind_tcp "localhost", 3000
server.listen

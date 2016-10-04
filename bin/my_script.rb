require 'addressable/uri'
require 'rest-client'

def index_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

 # index_users

def show_user(id)
  begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: "/users/#{id}.html",
      ).to_s
      puts RestClient.get(url)

    rescue
      RestClient::Exception
    end
end

show_user(2)

def create_user(name,email)
  begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
      ).to_s
      puts RestClient.post(
      url,
      {user: {name: name, email: email}}
      )
    rescue
      RestClient::Exception
    end
end

# create_user("Gizmo", "gizmo@gmail.com")

def update_user(id, name,email)
  begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: "/users/#{id}.json"
      ).to_s
      puts RestClient.put(
      url,
      {user: {name: name, email: email}}
      )
    rescue
      RestClient::Exception
    end
end

# update_user(1, "alex", "alex@gmail.com")

def delete_user(id)
  begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: "/users/#{id}.html",
      ).to_s
      puts RestClient.delete(url)

    rescue
      RestClient::Exception
    end
end

# delete_user(2)
# index_users

#
#  ConnectionProperties.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

# Connection class. (connection Model)
module Deluge
  class DelugeConnection
    attr_accessor :server, :port, :user_id, :password
    attr_accessor :server_address, :state
    
    def initialize server, port, user_id, password
      @server = server
      @port = port
      @user_id = user_id
      @password = password
      
      # Set the server address
      @server_address = "http://#{server}:#{port}/json"
      
      # Set initial state to disconnected
      @state = Deluge::DISCONNECTED
    end
    
    def authentication
      {:method => "auth.login", :params => [@password], :id => @user_id}
    end
    
    def connect!
      # Connect to the deluge server
      response = RestClient.post server_address, authentication, :content_type => :json, :accept => :json
      # Parse response
      t = JSON.parse(response)
      
      state = t['result']
    end
    
    # Return the state of the connection
    def success?
      return @state
    end
  end
end
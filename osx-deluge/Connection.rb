#
#  Connection.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

module Deluge
  # Connection class.
  class DelugeConnection
    attr_accessor :server, :port, :user_id, :password
    attr_accessor :server_address
    
    def initialize server, port, user_id, password
      @server = server
      @port = port
      @user_id = user_id
      @password = password
      
      @server_address = "http://#{server}:#{port}/json"
    end
    
    def authentication
      {:method => "auth.login", :params => [@password], :id => @user_id}
    end
  end
  
  # Connection manager.
  class DelugeConnectionManager
    attr_accessor :connection, :cookies
    attr_accessor :state
    
    def initialize server, port, user_id, password
      # Set up the deluge connection
      @connection = DelugeConnection.new server, port, user_id, password
      # Set initial state to disconnected
      @state = Deluge::DISCONNECTED
    end
    
    def connect!
      # Connect to the deluge server
      response = RestClient.post @connection.server_address, @connection.authentication, :content_type => :json, :accept => :json
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
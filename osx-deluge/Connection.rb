#
#  ConnectionProperties.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

# Connection class. (connection Model)
module Deluge
  class Connection
    attr_accessor :server, :port, :user_id, :password
    attr_accessor :server_address, :state, :cookie
    
    def initialize server, port, user_id, password
      @server = server
      @port = port
      @user_id = user_id
      @password = password
      
      # Set the server address
      @server_address = "http://#{server}:#{port}/json"
      
      # Set initial state to disconnected
      @state = DISCONNECTED
    end
    
    def authentication
      {:method => "auth.login", :params => [@password], :id => @user_id}.to_json
    end
    
    def authenticate!
      if !@cookie.nil?
        response = RestClient.post server_address, authentication, :content_type => :json, :accept => :json
        # Parse response
        t = JSON.parse(response)
        
        @state = t['result']
        @cookie = response.cookie
      else
        return @cookie
      end
    end
    
    def connect!
      # Connect to the deluge server
      authenticate!
    end
    
    # Return the state of the connection
    def success?
      @state
    end
    
    def failed?
      !@state
    end
    
    def destroy
      # Kill connection
    end
    
    
    # Torrent actions
    # Fetch all torrents on the connection
    def torrents options = {}
      
    end
  end
end
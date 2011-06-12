#
#  Deluge.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

module Deluge
  class DelugeConnectionManager
    attr_accessor :connections
    
    def initialize
      @connections = []
    end
    
    def all
      @connections
    end
    
    # New connection
    def create server, port, user_id, password
      connection = DelugeConnection.new server, port, user_id, password
      connection.connect!
      
      if !@connection.success?
        raise Authentication "Unable to authenticate"
        else
        @connections << connection
      end
      
      connection
    end
    
    # Kill connection
    def destroy connection
      @connections.delete connection
    end
  end
end
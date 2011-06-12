#
#  Deluge.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#


module Deluge
  class Deluge
    attr_accessor :cookies
    
    attr_accessor :connection
    
    def initialize server, port, password
      @connection = DelugeConnectionManager.new server, port, password
      @connection.connect!
      
      if !@connection.success?
        raise Authentication "Unable to authenticate"
      end
    end
    
    ###
    # Restful actions
    ###
    def all
      
    end
    
    def create
      
    end
    
    def destroy
      
    end
    
    def show
      
    end
  end
end
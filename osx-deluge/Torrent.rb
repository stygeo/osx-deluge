#
#  Torrent.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

module Deluge
  class TorrentRelation
    attr_accessor :torrents
    
    def method_missing method, *args
      torrents.__send__ method, *args
    end
    
    def all
      
    end
    
    def create
      # Create new torrent
    end
  end
  
  class DelugeTorrent
    
  end
end
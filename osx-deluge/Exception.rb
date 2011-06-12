#
#  Exception.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/12/11.
#  Copyright 2011 AP. All rights reserved.
#

module Deluge
  # Base exception
  class DelugeException < Exception; end
  class Authentication < DelugeException; end
end
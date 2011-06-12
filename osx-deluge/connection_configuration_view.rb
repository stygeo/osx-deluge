#
#  connection_configuration_view.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/11/11.
#  Copyright 2011 AP. All rights reserved.
#

class ConnectionConfigurationView < NSView
  attr_accessor :status_label
  attr_accessor :address, :port, :password
end
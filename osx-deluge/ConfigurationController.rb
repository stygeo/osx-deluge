#
#  configuration_controller.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/10/11.
#  Copyright 2011 AP. All rights reserved.
#


class ConfigurationController < NSWindowController
  attr_accessor :server_view, :general_view
  
  attr_accessor :connection_manager
  
  def init
    if super
      initWithWindowNibName "Configuration"
    end
    
    self
  end
  
  def show_general sender
    window.title = "General"
    window.setContentView general_view
  end
  
  def show_server sender
    window.title = "Server settings"
    window.setContentView server_view
  end
  
  def test_connection sender
    # Test connection
    if connection_manager.test_connection
      server_view.test_status.stringValue = "Connection accepted"
    else
      server_view.test_status.stringValue = "Connection refused"
    end
    
    server_view.test_status.setHidden false
  end
end
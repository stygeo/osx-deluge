#
#  configuration_controller.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/10/11.
#  Copyright 2011 AP. All rights reserved.
#


class ConfigurationController < NSWindowController
  attr_accessor :server_view, :general_view
  
  attr_accessor :connection_controller
  
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
    connection = connection_controller.create server_view.address.stringValue,
      server_view.port.stringValue, "3284", server_view.password.stringValue
    
    if connection.success?
      status = "Connection accepted"
    else 
      status = "Connection refused"
    end
    
    server_view.status_label.stringValue = status
    
    server_view.status_label.setHidden false
  end
end
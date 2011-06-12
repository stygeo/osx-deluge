#
#  AppDelegate.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/8/11.
#  Copyright 2011 AP. All rights reserved.
#

class AppDelegate < NSWindowController
  # Delegate attrs
  attr_accessor :window, :actual_window, :menu_view
  # Controllers
  attr_accessor :configuration_controller
  # Props
  attr_accessor :connection_manager
  
  def applicationDidFinishLaunching(notification)
    # Wut?
    @actual_window = window.window
    # Set the toolbar
    set_window_style
    
    @connection_manager = ConnectionManager.new
    
    @configuration_controller = ConfigurationController.new
    @configuration_controller.connection_manager = @connection_manager
  end
  
  def load_configuration sender
    @configuration_controller.showWindow self
    @configuration_controller.show_general nil
  end
  
  protected
  def set_window_style
    
    
    actual_window.setContentBorderThickness 50.0, forEdge:NSMinYEdge
  end
end


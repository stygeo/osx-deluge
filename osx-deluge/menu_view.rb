#
#  menu_view.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/11/11.
#  Copyright 2011 AP. All rights reserved.
#

class MenuView < NSView
  attr_accessor :color
  
  def drawRect rect
    color = NSColor.colorWithCalibratedRed 217/255.0, green:223/255.0, blue:228/255.0, alpha:1

    color.set
    NSRectFill bounds
  end
end
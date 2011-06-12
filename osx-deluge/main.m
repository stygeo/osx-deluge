//
//  main.m
//  osx-deluge
//
//  Created by Jeffrey Wilcke on 6/8/11.
//  Copyright 2011 AP. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "INAppStoreWindow.h"

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
  return macruby_main("rb_main.rb", argc, argv);
}

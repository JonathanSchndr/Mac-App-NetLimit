//
//  main.m
//  NetLimit
//
//  Created by Jonathan Schneider on 28.03.13.
//  Copyright (c) 2013 Jonathan Schneider. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}

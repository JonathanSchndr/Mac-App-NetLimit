-- main.scpt
-- Cocoa-AppleScript Applet
--
-- Copyright 2011 {Jonathan Schneider}. All rights reserved.

-- This is the main script for a Cocoa-AppleScript Applet.
-- You can put the usual script applet handlers here.

script AppDelegate
    property parent : class "NSObject"
    property limitField : missing value
    property limitButton : missing value
    property resetButton : missing value
    
    
    on limitButton_(sender)
        set limitNumber to limitField's stringValue()
                
        do shell script "sudo ipfw pipe 1 config bw " & (limitNumber as string) & "KByte/s" with administrator privileges
        do shell script "sudo ipfw add 1 pipe 1 src-port 80" with administrator privileges
        set the enabled of limitButton to false
        set the enabled of resetButton to true
    end limitButton_

    on resetButton_(sender)
        do shell script "sudo ipfw delete 1" with administrator privileges
        
        set the enabled of limitButton to true
        set the enabled of resetButton to false
    end resetButton_
    
    on openWeb_(sender)
        do shell script "open -a Safari http://www.wmschneider.de"
    end openWeb_

end
//
//  LoginWindow.swift
//  WeatherBar
//
//  Created by wnjsoft on 2016/3/22.
//  Copyright © 2016年 Etsy. All rights reserved.
//

import Cocoa

class LoginWindow: NSWindowController {

    override var windowNibName : String! {
        return "LoginWindow"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activateIgnoringOtherApps(true)
    }
    
    func windowWillClose(notification: NSNotification) {
    }
}

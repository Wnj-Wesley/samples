//
//  AboutWindow.swift
//  WeatherBar
//
//  Created by wnjsoft on 2016/3/20.
//  Copyright © 2016年 Etsy. All rights reserved.
//

import Cocoa

class AboutWindow: NSWindowController, NSWindowDelegate {

    @IBOutlet weak var accountTitleLable: NSTextField!
    @IBOutlet weak var accountLabel: NSTextField!
    @IBOutlet weak var versionLabel: NSTextField!
    @IBOutlet weak var copyrightLabel: NSTextField!

    override var windowNibName : String! {
        return "AboutWindow"
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

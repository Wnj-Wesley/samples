//
//  StatusMenuController.swift
//  WeatherBar
//
//  Created by Brad Greenlee on 10/11/15.
//  Copyright © 2015 Etsy. All rights reserved.
//

import Cocoa

let DEFAULT_CITY = "Seattle, WA"

class StatusMenuController: NSObject, PreferencesWindowDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var weatherView: WeatherView!
    @IBOutlet weak var decryptMenuItem: NSMenuItem!
    @IBOutlet weak var decryptSepMenuItem: NSMenuItem!
    @IBOutlet weak var loginMenuItem: NSMenuItem!
    @IBOutlet weak var logoutMenuItem: NSMenuItem!

    var decryptWindow: DecryptFilesWindow!
    var aboutWindow: AboutWindow!
    var loginWindow: LoginWindow!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let weatherAPI = WeatherAPI()
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.template = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        decryptWindow = DecryptFilesWindow()
        aboutWindow = AboutWindow()
        loginWindow = LoginWindow()
        
        //updateWeather()
    }
    
    @IBAction func aboutClicked(sender: NSMenuItem) {
        aboutWindow.showWindow(nil)
    }
    
    @IBAction func decryptClicked(sender: NSMenuItem) {
        decryptWindow.showWindow(nil)
    }
    
    @IBAction func loginClicked(sender: NSMenuItem) {
        loginMenuItem.hidden = true
        decryptMenuItem.hidden = false
        decryptSepMenuItem.hidden = false
        logoutMenuItem.hidden = false
        
        loginWindow.showWindow(nil)
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    func preferencesDidUpdate() {
        //updateWeather()
    }
}

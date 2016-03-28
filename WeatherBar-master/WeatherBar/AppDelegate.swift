//
//  AppDelegate.swift
//  WeatherBar
//
//  Created by Brad Greenlee on 10/10/15.
//  Copyright © 2015 Etsy. All rights reserved.
//

import Cocoa
import QuickLook
import Quartz

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, QLPreviewPanelDataSource, QLPreviewPanelDelegate {
    
    var filePath: String = ""
    
    func application(sender: NSApplication, openFile filename: String) -> Bool {
        print("open file \(filename)")
        filePath = filename
        if let panel = QLPreviewPanel.sharedPreviewPanel() {
            panel.dataSource = self
            panel.delegate = self
            panel.makeKeyAndOrderFront(self)
        }
        return true
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func numberOfPreviewItemsInPreviewPanel(panel: QLPreviewPanel!) -> Int {
        return 1
    }
    
    func previewPanel(panel: QLPreviewPanel!, previewItemAtIndex index: Int) -> QLPreviewItem! {
        print("Getting item")
        print(filePath)
        let doc = NSURL(fileURLWithPath: filePath)
        return doc
    }
}


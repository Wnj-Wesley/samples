//
//  DecryptFilesWindow.swift
//  WeatherBar
//
//  Created by wnjsoft on 2016/3/20.
//  Copyright © 2016年 Etsy. All rights reserved.
//

import Cocoa

class DecryptFilesWindow: NSWindowController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var decryptTableView: NSTableView!
    var decryptFilesArray: NSArray
    
    override var windowNibName : String! {
        return "DecryptFilesWindow"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activateIgnoringOtherApps(true)
    }
    
    func windowWillClose(notification: NSNotification) {
    }
    
    @IBOutlet weak var openFileBtn: NSButton!
    @IBAction func openFile(sender: AnyObject) {
        let myFileDialog: NSOpenPanel = NSOpenPanel()
        myFileDialog.allowsMultipleSelection = true
        if (myFileDialog.runModal() == NSModalResponseOK) {
            let fileUrls = myFileDialog.URLs
            for fileUrl in fileUrls {
                let path = fileUrl.path
                if (path != nil) {
                    print("open file \(path!)")
                }
            }
        }
    }
    
    func createDecryptFileDictionary(fileUrl: NSURL) -> NSDictionary {
        let status = ""
        let filename = fileUrl.lastPathComponent
        let type = fileUrl.pathExtension
        var date: NSDate = NSDate()
        var size: NSNumber = 0
        let folderPath = fileUrl.baseURL!.path
        do {
            let attributes = try fileUrl.resourceValuesForKeys([NSURLFileSizeKey, NSURLContentModificationDateKey])
            size = attributes[NSURLFileSizeKey] as! NSNumber
            date = attributes[NSURLContentModificationDateKey] as! NSDate
        } catch {
            print("get file: \(fileUrl.path) attributes error: \(error)")
        }
        
        return ["Status": status, "FileName": filename!, "Type": type!, "Date": date, "Size": size, "FolderPath": folderPath!]
        
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if (decryptTableView == nil) {
            return 0
        }
        let numberOfRows:Int = decryptFilesArray.count
        return numberOfRows
    }
    
    func tableView(tableView: NSTableView, dataCellForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSCell? {
        let item = decryptFilesArray.objectAtIndex(row)
        let cell = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self)
        let textField = cell.
        
    }
}

//
//  ViewController.swift
//  quicklook_tryout
//
//  Created by Tanel Teemusk on 20/01/15.
//  Copyright (c) 2015 Tanel Teemusk. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController, QLPreviewControllerDataSource {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ql = QLPreviewController()
        ql.dataSource  = self
        presentViewController(ql, animated: true, completion: nil)
        addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutablePointer<Void>#>)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem?.enabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.rightBarButtonItem?.enabled = false
    }
    
    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int{
        return 1
    }
    
    func previewController(controller: QLPreviewController, previewItemAtIndex index: Int) -> QLPreviewItem! {
        print("Getting item")
        let mainbundle = NSBundle.mainBundle()
        let url = mainbundle.pathForResource("mypdf", ofType: "pdf")!
        print(url)
        let doc = NSURL(fileURLWithPath: url)
        return doc
    }
    
    
    


}


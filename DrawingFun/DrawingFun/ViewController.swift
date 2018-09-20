//
//  ViewController.swift
//  DrawingFun
//
//  Created by Johnathan Mann on 9/20/18.
//  Copyright © 2018 Johnathan Mann. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var stretchView : StretchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func openDocument(_ sender: AnyObject) {
        let panel = NSOpenPanel()
        panel.allowedFileTypes = NSImage.imageTypes
        panel.beginSheetModal(for: stretchView.window!,
                              completionHandler: { (returnCode)-> Void in
                                if returnCode == NSApplication.ModalResponse.OK {
                                    let image = NSImage(byReferencing: panel.url!)
                                    self.stretchView.image = image
                                    self.stretchView.needsDisplay = true
                                    self.stretchView.downPoint = NSZeroPoint
                                    self.stretchView.currentPoint = NSPoint(x: image.size.width,
                                                                            y: image.size.height)
                                    
                                } } )
    }
}


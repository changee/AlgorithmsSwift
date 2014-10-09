//
//  ViewController.swift
//  AlgorithmsSwift
//
//  Created by YangZQ on 14/10/9.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    var tableView:NSTableView?
    var tableContainer:NSScrollView?
    
    var contentView:NSView?
    var contentController:NSViewController?
    
    var navDataList:NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = NSBundle.mainBundle().pathForResource("NavData", ofType: "plist")
        navDataList = NSArray(contentsOfFile: filePath!)
        
        
        let navFrame = NSMakeRect(0, 0, self.view.frame.size.width/4, self.view.frame.size.height)
        
        self.tableView = NSTableView(frame: navFrame)
        tableView?.setDelegate(self)
        tableView?.setDataSource(self)
        tableView?.backgroundColor = NSColor(calibratedRed: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1.0)
        tableView?.headerView = nil
        
        var tableColumn = NSTableColumn(identifier: "myCell")
        tableColumn.width = 200;
        tableView?.addTableColumn(tableColumn)
        
        
        tableContainer = NSScrollView(frame: navFrame)
        tableContainer?.documentView = tableView;
        tableContainer?.hasVerticalScroller = true
        
        self.view.addSubview(tableContainer!)
        
        
        self.contentView = NSView(frame: NSMakeRect(navFrame.width, 0, self.view.frame.size.width - navFrame.width, self.view.frame.size.height))
        self.view.addSubview(contentView!)
    
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    // pragma
    func tableView(tableView: NSTableView!, viewForTableColumn tableColumn: NSTableColumn!, row: Int) -> NSView!
    {
        if tableColumn.identifier == "myCell"
        {
            let listCell = NavListCell(frame: NSMakeRect(0, 0, 320, 44))
            listCell.setNavData(navDataList![row] as NSDictionary)
            return listCell
        }
        return nil
    }
    
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int
    {
        return navDataList!.count
    }
    
    func tableView(tableView: NSTableView!, heightOfRow row: Int) -> CGFloat
    {
        return 44
    }
    
    func tableViewSelectionDidChange(notification: NSNotification!)
    {
        let className: AnyObject? = (navDataList![tableView!.selectedRow] as NSDictionary)["class"]
        let ClassName:AnyClass = NSClassFromString(className as String)
        contentController = (ClassName as NSViewController.Type)(nibName: className as String, bundle: nil)
        self.contentView?.addSubview(contentController!.view)
    }
    
    
    
    
    
    
}


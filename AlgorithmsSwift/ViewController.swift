//
//  ViewController.swift
//  AlgorithmsSwift
//
//  Created by YangZQ on 14/10/9.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var tableContainer: NSScrollView!
    var tableView:NSTableView?
    var navDataList:NSArray?
    
    @IBOutlet weak var contentViewWrapper: NSView!
    var contentView:NSView?
    var contentController:NSViewController?
    
    @IBOutlet var consoleTextView: NSTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = NSBundle.mainBundle().pathForResource("NavData", ofType: "plist")
        navDataList = NSArray(contentsOfFile: filePath!)
        
        self.tableView = NSTableView()
        tableView?.setDelegate(self)
        tableView?.setDataSource(self)
        tableView?.backgroundColor = NSColor(calibratedRed: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1.0)
        tableView?.headerView = nil
        tableView?.addTableColumn(NSTableColumn(identifier: "myCell"))

        tableContainer?.hasVerticalScroller = true
        tableContainer?.documentView = tableView;
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func tableViewSelectionDidChange(notification: NSNotification!)
    {
        let className: AnyObject? = (navDataList![tableView!.selectedRow] as NSDictionary)["class"]
        let ClassName:AnyClass = NSClassFromString(className as String)
        contentController = (ClassName as NSViewController.Type)(nibName: className as String, bundle: nil)
        (contentController as ASViewController).mainViewController = self
        showContentView(contentController!.view)
    }
    
    
    func showContentView(view:NSView){
        contentView?.removeFromSuperview()
        contentView = view;
        contentView?.frame = self.contentViewWrapper.frame
        contentView?.frame.origin.x = 0
        contentView?.frame.origin.y = 0
        self.contentViewWrapper?.addSubview(contentView!)
        
    }
    
    func printlnResult(result:AnyObject){
        consoleTextView.string = result.stringValue
    }
    
    func printlnResult(result:String){
        consoleTextView.string = result
    }
    
    
//  table delegate
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
}
















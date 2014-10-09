//
//  NavListCell.swift
//  algorithms.swift
//
//  Created by YangZQ on 14/10/8.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa

class NavListCell: NSView {
    var textLabel:NSTextField?
    var contentClass:String?
    
    override init(frame frameRect: NSRect){
        super.init(frame: frameRect)

        self.textLabel = NSTextField(frame: NSMakeRect(0, 0, 100, 30))
        textLabel?.font = NSFont.systemFontOfSize(12)
        textLabel?.backgroundColor = NSColor.clearColor()
        textLabel?.bordered = false
        textLabel?.editable = false
        self.addSubview(textLabel!)
//        [_listTextField setDrawsBackground:YES];
//        [_listTextField.cell setUsesSingleLineMode:YES];
//        [_listTextField setTextColor:[NSColor whiteColor]];
        
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
    }
    
    func setCellTitle(title: String)
    {
        textLabel?.stringValue = title
    }
    
    func setNavData(data:NSDictionary){
        contentClass = data["class"]?.stringValue
        setCellTitle(data["title"] as String)
    }
}

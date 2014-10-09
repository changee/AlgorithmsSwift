//
//  ASCommonDivisor.swift
//  algorithms.swift
//
//  Created by YangZQ on 14/10/8.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa
@objc(ASCommonDivisor)
class ASCommonDivisor: NSViewController {

    @IBOutlet weak var num1: NSTextField!
    @IBOutlet weak var num2: NSTextField!
    @IBOutlet weak var result: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        result.integerValue = getCommonDivisor(max(num1.integerValue, num2.integerValue), smaller: min(num1.integerValue, num2.integerValue))
    }
    
    func getCommonDivisor(bigger: Int, smaller: Int) ->Int
    {
        var result = bigger % smaller;
        if result == 0
        {
            return smaller;
        }
        return getCommonDivisor(smaller, smaller: result)
    }
    
}

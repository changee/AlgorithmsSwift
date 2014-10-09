//
//  BasicOperation.swift
//  AlgorithmsSwift
//
//  Created by YangZQ on 14/10/9.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa
@objc(BasicOperation)

class BasicOperation: NSViewController {
    @IBOutlet weak var num1: NSTextField!
    @IBOutlet weak var num2: NSTextField!
    @IBOutlet weak var result: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func commonDivisor(sender: AnyObject) {
        result.integerValue = commonDivisor(max(num1.integerValue, num2.integerValue), smaller: min(num1.integerValue, num2.integerValue))
    }
    func commonDivisor(bigger: Int, smaller: Int) ->Int
    {
        var result = bigger % smaller;
        if result == 0
        {
            return smaller;
        }
        return commonDivisor(smaller, smaller: result)
    }
    
}

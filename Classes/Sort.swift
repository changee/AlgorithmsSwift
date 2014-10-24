//
//  Sort.swift
//  AlgorithmsSwift
//
//  Created by YangZQ on 14/10/9.
//  Copyright (c) 2014年 YangZQ. All rights reserved.
//

import Cocoa
@objc(Sort)
class Sort: ASViewController {
    @IBOutlet weak var inputTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func getInputNumbers() -> [AnyObject]
    {
        let inputString = inputTextField.stringValue
        var strings:[String] = inputString.componentsSeparatedByString(" ")

        var numbers = NSMutableArray()
        for str:String in strings
        {
            if let intObj = str.toInt(){
                numbers.addObject(intObj)
            }
        }
        
        return numbers
    }
    
    @IBAction func BubbleSort(sender: AnyObject) {
        var nums = getInputNumbers() as [Int]
        let numCount = nums.count
        for var i=0 ; i < numCount; i++
        {
            for var j = 1 ; j < numCount - i; j++
            {
                if nums[j] > nums[j-1]
                {
//                    nums[j] = nums[j] + nums[j-1]
//                    nums[j-1] = nums[j] - nums[j-1]
//                    nums[j] = nums[j] - nums[j-1]
                    nums[j]   ^= nums[j-1]
                    nums[j-1] ^= nums[j]
                    nums[j]   ^= nums[j-1]
                }
            }
        }

        var sortResult:NSArray = nums as NSArray
        self.mainViewController.printlnResult(sortResult.componentsJoinedByString(" > "))
    }
    
    @IBAction func QuickSort(sender: AnyObject) {
        var nums:NSMutableArray = NSMutableArray(array: getInputNumbers() as [Int])
        println(nums)
        sortNums(nums, left: 0, right: nums.count-1)
        println(nums)
    }
    
    func sortNums(targetNums:NSMutableArray, left:Int, right:Int){
//        var targetNums = nums;
        var leftCur = left;
        
        if leftCur < right {
            let currentValue = targetNums[leftCur].integerValue;
            var currentRight = right;
            
            while (leftCur < currentRight){
                while (leftCur < currentRight && targetNums[currentRight].integerValue >= currentValue){
                    --currentRight;
                }
                if(leftCur < currentRight)
                {
                    targetNums[left] = targetNums[currentRight];
                    ++leftCur;
                }
                
                while(leftCur < currentRight && targetNums[left].integerValue <= currentValue){
                    ++leftCur
                }
                if(leftCur < currentRight){
                    targetNums[currentRight] = targetNums[leftCur];
                    --currentRight;
                }
                
            }

        targetNums[leftCur] = currentValue;
        sortNums(targetNums, left: 0, right: leftCur - 1)
        sortNums(targetNums, left: leftCur + 1, right: right)
        }
    }
    
}






/*
BubbleSort

白话经典算法系列之一 冒泡排序的三种实现
分类： 白话经典算法系列 2011-08-06 19:20 67565人阅读 评论(62) 收藏 举报
算法优化
冒泡排序是非常容易理解和实现，，以从小到大排序举例：

设数组长度为N。


下面对其进行优化，设置一个标志，如果这一趟发生了交换，则为true，否则为false。明显如果有一趟没有发生交换，说明排序已经完成。

[cpp] view plaincopy

[cpp] view plaincopy
//冒泡排序2
void BubbleSort2(int a[], int n)
{
int j, k;
bool flag;

k = n;
flag = true;
while (flag)
{
flag = false;
for (j = 1; j < k; j++)
if (a[j - 1] > a[j])
{
Swap(a[j - 1], a[j]);
flag = true;
}
k--;
}
}
再做进一步的优化。如果有100个数的数组，仅前面10个无序，后面90个都已排好序且都大于前面10个数字，那么在第一趟遍历后，最后发生交换的位置必定小于10，且这个位置之后的数据必定已经有序了，记录下这位置，第二次只要从数组头部遍历到这个位置就可以了。

[cpp] view plaincopy
//冒泡排序3
void BubbleSort3(int a[], int n)
{
int j, k;
int flag;

flag = n;
while (flag > 0)
{
k = flag;
flag = 0;
for (j = 1; j < k; j++)
if (a[j - 1] > a[j])
{
Swap(a[j - 1], a[j]);
flag = j;
}
}
}
冒泡排序毕竟是一种效率低下的排序方法，在数据规模很小时，可以采用。数据规模比较大时，最好用其它排序方法。

*/




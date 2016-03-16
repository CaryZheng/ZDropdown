//
//  ZDropdownView.swift
//  ZDropdown
//
//  Created by CaryZheng on 7/8/15.
//  Copyright (c) 2015 CaryZheng. All rights reserved.
//

import UIKit

protocol IZDropdownView
{
    func didSelectItem(index: Int)
}

class ZDropdownView : UIView, UITableViewDataSource, UITableViewDelegate
{
    var delegate: IZDropdownView?
    
    private var mDataList: Array<String> = Array<String>()
    
    private var mTableView: UITableView!
    
    func reloadData()
    {
        if(nil != mTableView)
        {
            mTableView.reloadData()
        }
    }
    
    func setData(dataList: Array<String>)
    {
        mDataList = dataList
    }
    
    func getTableView() -> UITableView?
    {
        if(nil == mTableView)
        {
            return nil
        }
        
        return mTableView
    }
    
    func showDropdown(btn: UIButton)
    {
        let tableView = UITableView(frame: CGRectMake(0, 0, self.frame.width, 0), style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 30
        tableView.separatorColor = UIColor.clearColor()
        
        self.addSubview(tableView)
        
        mTableView = tableView
        
        // open animation
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveLinear, animations: {
            
            tableView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
            
            }, completion: nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if(nil == cell)
        {
            cell = UITableViewCell()
            cell!.textLabel?.textAlignment = NSTextAlignment.Center
            cell!.textLabel?.font = cell!.textLabel?.font.fontWithSize(11)
            cell!.textLabel?.textColor = UIColor.darkGrayColor()
            
            let dividerView = UIView(frame: CGRectMake(0, mTableView.rowHeight-0.5, cell!.frame.size.width, 0.5))
            dividerView.backgroundColor = ColorUtility.colorize(ColorConstant.common_spinner_divider)
            cell?.addSubview(dividerView)
        }
        
        let rowIndex: Int = indexPath.row
        
        cell?.textLabel?.text = mDataList[rowIndex]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let rowIndex: Int = indexPath.row
        
        print("didSelectRowAtIndexPath rowIndex = \(rowIndex), text = \(mDataList[rowIndex])")
        
        if(nil != delegate)
        {
            delegate?.didSelectItem(rowIndex)
        }
    }
}
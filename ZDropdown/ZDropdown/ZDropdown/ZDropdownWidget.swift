//
//  ZDropdownWidget.swift
//  ZDropdown
//
//  Created by CaryZheng on 7/9/15.
//  Copyright (c) 2015 CaryZheng. All rights reserved.
//

import UIKit

class ZDropdownWidget : UIView, IZDropdownView, IZDropdownContainer
{
    var mDefaultSetting = "请选择"
    var mCurrentSelectedIndex = -1
    
    var mDataNameList = Array<String>()
    var mDataCodeList = Array<AnyObject>()
    
    private var mSelectedData = CommonKeyValue()
    
    private var mBtn: UIButton!
    private var mArrowImage: UIImageView!
    
    private var mWindows = Array<UIWindow!>()
    
    private var mDropdown: ZDropdownView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView()
    {
        mBtn = UIButton(frame: self.bounds)
        
        mBtn.backgroundColor = ColorUtility.colorize(0xEEEEEE)
        setTitle(mDefaultSetting, tag: -1)
        mBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        mBtn.addTarget(self, action: "onBtnPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        mBtn.titleLabel!.font = mBtn.titleLabel!.font.fontWithSize(11)
        
        self.addSubview(mBtn)
        
        mArrowImage = UIImageView(image: UIImage(named: "pic_spinner_arrow_down"))
        mArrowImage.frame.size = CGSizeMake(10, 10)
        mArrowImage.center = CGPointMake(self.bounds.width-10, self.bounds.height/2)
        
        self.addSubview(mArrowImage)
        
        let dropdown = ZDropdownView()
        dropdown.delegate = self
        
        mDropdown = dropdown
    }
    
    func setTitle(text: String, tag: AnyObject)
    {
        mBtn.setTitle(text, forState: UIControlState.Normal)
        
        mSelectedData.name = text
        mSelectedData.code = tag
    }
    
    func getTitle() -> String?
    {
        return mSelectedData.name
    }
    
    func getTitleTag() -> AnyObject?
    {
        return mSelectedData.code
    }
    
    func onBtnPressed(sender: UIButton)
    {
        print("onBtnPressed")
        
        didWillOpen()
        
        let attachedView = sender
        
        let sizeRect = UIScreen.mainScreen().bounds
        let width = sizeRect.size.width
        let height = sizeRect.size.height
        
        let window = UIWindow(frame: CGRectMake(0, 0, width, height))
        window.backgroundColor = UIColor.clearColor()
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPointMake(width/2, height/2)
        window.hidden = false
        
        let mainView = ZDropdownContainer(frame: CGRectMake(0, 0, width, height))
        mainView.delegate = self
        mainView.backgroundColor = UIColor.clearColor()
        window.addSubview(mainView)
        
        let dropdown = mDropdown
        
        let dropdownOrigin = attachedView.convertPoint(attachedView.bounds.origin, toView: nil)
        dropdown.frame = CGRectMake(dropdownOrigin.x, dropdownOrigin.y+attachedView.bounds.height, attachedView.bounds.width, 140)
        
        dropdown.showDropdown(attachedView)
        
        mainView.addSubview(dropdown)
        
        mWindows.append(window)
        
        mArrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI*180/180))
    }
    
    func didWillOpen()
    {
        
    }
    
    func didSelectItem(index: Int)
    {
        mCurrentSelectedIndex = index
        
        setTitle(mDataNameList[index], tag: mDataCodeList[index])
        
        hideDropdown()
    }
    
    func onZDropdownContainerTouchesBegan()
    {
        hideDropdown()
    }
    
    func hideDropdown()
    {
        self.mArrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI*0/180))
        
        // close animation
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveLinear, animations: {
            
            let tableView = self.mDropdown.getTableView()
            if(nil == tableView)
            {
                return
            }
            
            tableView!.frame = CGRectMake(tableView!.frame.origin.x, tableView!.frame.origin.y, tableView!.bounds.width, 0)
            
            }, completion: { finished in
                
                if(0 == self.mWindows.count)
                {
                    return
                }
                
                self.mWindows[0].removeFromSuperview()
                self.mWindows = Array<UIWindow!>()
        })
    }
    
    func getCurrentSelectedCode() -> AnyObject?
    {
        if(-1 == mCurrentSelectedIndex)
        {
            return nil
        }
        
        return mSelectedData.code
    }
    
    func getCurrentSelectedName() -> String?
    {
        if(-1 == mCurrentSelectedIndex)
        {
            return nil
        }
        
        return mSelectedData.name
    }
    
    func getCurrentSelectedIndex() -> Int
    {
        return mCurrentSelectedIndex
    }
    
    func setData(dataList: Array<String>)
    {
        mDataNameList = dataList
        
        mDropdown.setData(dataList)
    }
    
    func setDataCode(dataList: Array<AnyObject>)
    {
        mDataCodeList = dataList
    }
    
    func reloadData()
    {
        mDropdown.reloadData()
    }
    
    func reset()
    {
        setTitle(mDefaultSetting, tag: -1)
        
        setData(Array<String>())
        setDataCode(Array<String>())
        
        reloadData()
    }
}
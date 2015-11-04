//
//  TestSpinner.swift
//  ZDropdown
//
//  Created by Cary on 15/11/4.
//  Copyright © 2015年 CaryZheng. All rights reserved.
//

import UIKit

class TestSpinner : ZDropdownWidget
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initDefaultSetting()
        
        initView()
        
        var dataList = Array<String>()
        dataList.append("1")
        dataList.append("2")
        dataList.append("3")
        dataList.append("4")
        
        setData(dataList)
        
        let dataCodeList = dataList
        
        setDataCode(dataCodeList)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDefaultSetting()
    {
        mDefaultSetting = "请选择"
        mCurrentSelectedIndex = -1
    }
    
    func isValid() -> Bool
    {
        if(-1 == getCurrentSelectedIndex())
        {
            return false
        }
        
        return true
    }
}

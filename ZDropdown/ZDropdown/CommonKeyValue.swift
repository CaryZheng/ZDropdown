//
//  CommonKeyValue.swift
//  ZDropdown
//
//  Created by Cary on 15/11/4.
//  Copyright © 2015年 CaryZheng. All rights reserved.
//

import Foundation

class CommonKeyValue
{
    var code: AnyObject?
    var name: String?
    
    init()
    {
        
    }
    
    init(code: AnyObject, name: String)
    {
        self.code = code
        self.name = name
    }
}
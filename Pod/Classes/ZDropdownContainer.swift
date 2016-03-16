//
//  ZDropdownContainer.swift
//  ZDropdown
//
//  Created by CaryZheng on 7/8/15.
//  Copyright (c) 2015 CaryZheng. All rights reserved.
//

import UIKit

protocol IZDropdownContainer
{
    func onZDropdownContainerTouchesBegan()
}

class ZDropdownContainer : UIView
{
    var delegate: IZDropdownContainer?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        print("touchesBegan")
        
        delegate?.onZDropdownContainerTouchesBegan()
    }
}
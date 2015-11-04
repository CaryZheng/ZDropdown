//
//  ViewController.swift
//  ZDropdown
//
//  Created by CaryZheng on 7/8/15.
//  Copyright (c) 2015 CaryZheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mDropdownWidget: ZDropdownWidget!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = ColorUtility.colorize(0xE2E2E2)
        
        let bkgView = UIView(frame: CGRectMake(10, 60, self.view.bounds.width-20, 100))
        bkgView.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(bkgView)
        
        mDropdownWidget = TestSpinner(frame: CGRectMake(20, 10, bkgView.bounds.width-40, 40))
        
        bkgView.addSubview(mDropdownWidget)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


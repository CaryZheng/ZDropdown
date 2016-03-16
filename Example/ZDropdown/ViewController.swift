//
//  ViewController.swift
//  ZDropdown
//
//  Created by CaryZheng on 03/16/2016.
//  Copyright (c) 2016 CaryZheng. All rights reserved.
//

import UIKit
import ZDropdown

class ViewController: UIViewController {

    var mDropdownWidget: ZDropdown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.grayColor()
        
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


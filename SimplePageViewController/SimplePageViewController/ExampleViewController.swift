//
//  ViewController.swift
//  SimplePageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class ExampleViewController: SimplePageViewController, SimplePageViewControllerDataSource {

    override func viewDidLoad() {
        self.dataSource = self
        
        super.viewDidLoad()
    }
    
    func getViewControllerList() -> [UIViewController] {
        var vcList: [UIViewController] = []
        
        for index in 1 ... 3 {
            let contentVC = self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController") as! ContentViewController
            contentVC.titleText = "Page #\(index)"
            vcList.append(contentVC)
        }
        
        return vcList
    }

}


//
//  ViewController.swift
//  SimplePageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class SubclassExampleViewController: SimplePageViewController, SimplePageViewControllerDataSource {

    override func viewDidLoad() {
        // Set the dataSource before the viewDidLoad, because it the super.viewDidLoad() uses the dataSource methods
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


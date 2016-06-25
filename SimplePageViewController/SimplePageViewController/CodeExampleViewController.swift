//
//  CodeExampleViewController.swift
//  SimplePageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class CodeExampleViewController: UIViewController, SimplePageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let pageVC = SimplePageViewController()
        pageVC.dataSource = self
        pageVC.view.backgroundColor = UIColor.whiteColor()
        
        self.presentViewController(pageVC, animated: true) {}
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

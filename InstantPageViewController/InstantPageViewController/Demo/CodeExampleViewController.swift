//
//  CodeExampleViewController.swift
//  InstantPageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit


/**
 In this example, we create the InstantPageViewController through code. We do not have
 to subclass it or make a new ViewController in Storyboard for it.
 */
class CodeExampleViewController: UIViewController, InstantPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Put it in viewDidAppear instead because presenting view controllers does not work in viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        
        // Create the InstantPageViewController
        let pageVC = InstantPageViewController()
        pageVC.dataSource = self
        pageVC.view.backgroundColor = UIColor.white
        
        // Present it
        self.present(pageVC, animated: true) {}
    }

    // DataSource (Same in both Subclass and code example)
    func getViewControllerList() -> [UIViewController] {
        var vcList: [UIViewController] = []
        
        for index in 1 ... 3 {
            let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentViewController") as! ContentViewController
            contentVC.titleText = "Page #\(index)"
            vcList.append(contentVC)
        }
        
        return vcList
    }

}

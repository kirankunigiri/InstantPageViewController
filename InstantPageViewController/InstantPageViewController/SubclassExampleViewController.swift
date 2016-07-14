//
//  ViewController.swift
//  InstantPageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

/**
 In this example, we create a subclass of the InstantPageViewController. This way, we can keep a view
 that persists throughout different pages (It sticks and doesn't move). This is because we use a 
 base ViewController where the items are static.
 
 In Storyboard, we created a ViewController and assigned this class to it. Now, any elements in this 
 base View Controller are static and persist. However, the items on the Content View Controller
 will move and belong to their respective pages.
 
 Keep in mind that we have to assign the dataSource to the class before super.viewDidLoad() because this is a 
 subclass, and the viewDidLoad functions in the superclass require the dataSource methods.
 
 Over here, we reuse ContentViewControllers and modify their title labels to populate the Page View Controller.
 However, you can also make each page different by creating all unique ViewControllers (Ex: through Storyboard)
 and then returning an array of those. If you want to use different ViewControllers from Storyboard, use 
 storyboard.instantiateViewControllerWithIdentifier("_IDENTIFIER_NAME_)")
 */

class SubclassExampleViewController: InstantPageViewController, InstantPageViewControllerDataSource {

    override func viewDidLoad() {
        
        // Set the dataSource before the viewDidLoad, because the super.viewDidLoad() uses the dataSource methods
        self.dataSource = self
        self.scrollsInfinitely = true
        super.viewDidLoad()
    }
    
    /** 
     DataSource (Same in both Subclass and code example)
     Create an array of ViewControllers to be presented and return it
     In this case, we just create new ContentViewControllers and change their title label
     */
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

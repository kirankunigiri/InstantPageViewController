//
//  InstantPageViewController
//  InstantPageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//

import UIKit

/**
 *  Must conform to the function `getViewControllerList()`
 */
@objc protocol InstantPageViewControllerDataSource {
    /** Returns the list of view controllers to be displayed in the UIPageViewController */
    func getViewControllerList() -> [UIViewController]
}

class InstantPageViewController: UIViewController {
    
    // Data source elements
    /** Conform to this dataSource to provide the class the objects it needs */
    var dataSource: InstantPageViewControllerDataSource?
    /** The list of view controllers to be displayed in the UIPageViewController */
    var viewControllerList: [UIViewController]!
    /** Whether or not the pages should scroll inifinitely */
    var scrollsInfinitely: Bool = false
    
    // Other elements
    /** The UIPageViewController used to display pages. Edit it's properties to customize your View Controller */
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup page control (dots) appearance
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().backgroundColor = self.view.backgroundColor
        
        // Set the vc list to the dataSource list
        self.viewControllerList = self.dataSource?.getViewControllerList()
        
        // Create a new Page View Controller
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        
        // Set the first view to the Page View Controller
        self.pageViewController.setViewControllers([self.viewControllerList[0]], direction: .forward, animated: true, completion: nil)
        
        // Add and setup the Page View Controller view to the main view
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.view.sendSubview(toBack: self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }
    
}

extension InstantPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.viewControllerList!.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard viewControllerIndex - 1 >= 0 else {
            return scrollsInfinitely ? viewControllerList[viewControllerList.count - 1] : nil
        }
        
        return self.viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.viewControllerList!.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard viewControllerList.count > nextIndex else {
            return scrollsInfinitely ? viewControllerList[0] : nil
        }
        
        return self.viewControllerList![nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.viewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

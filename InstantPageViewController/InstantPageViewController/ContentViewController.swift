//
//  ContentViewController.swift
//  InstantPageViewController
//
//  Created by Kiran Kunigiri on 6/25/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

/**
 This ContentViewController is a reusable ViewController in which the titleLabel is changed
 depending on the page.
 */

class ContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var titleText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleText
    }

}

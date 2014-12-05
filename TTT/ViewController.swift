//
//  ViewController.swift
//  TTT
//
//  Created by MattF on 12/5/14.
//  Copyright (c) 2014 MattF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let controller : TTTViewController = TTTViewController(nibName: "TTTViewController", bundle: nil)
//        let nav : UINavigationController = UINavigationController(rootViewController: controller)
//        nav.modalPresentationStyle = UIModalPresentationStyle.FullScreen
//        self.presentViewController(nav, animated: true, completion: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }
}


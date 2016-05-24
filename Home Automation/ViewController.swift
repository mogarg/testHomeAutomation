//
//  ViewController.swift
//  Home Automation
//
//  Created by Nikhil Garg on 24/05/16.
//  Copyright © 2016 Thapar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backGround: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backGround.layer.borderWidth=2.0
        backGround.layer.borderColor=UIColor.lightGrayColor().CGColor
        
        
    }
    
    @IBAction func goToHome(sender: AnyObject) {
        self.performSegueWithIdentifier("goToHome", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


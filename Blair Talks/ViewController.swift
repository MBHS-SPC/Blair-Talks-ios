//
//  ViewController.swift
//  Blair Talks
//
//  Created by Sam Ehrenstein on 9/16/15.
//  Copyright (c) 2015 MBHS SPC. All rights reserved.
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
    
    //Done in MainTableViewController.prepareforSegue
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="showRose"{
            if let destination=segue.destinationViewController as? PlayerViewController {
                destination.subjectName="Mr. Rose"
            }
        }
    }
    */


}


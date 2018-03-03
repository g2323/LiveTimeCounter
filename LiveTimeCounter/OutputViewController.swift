//
//  OutputViewController.swift
//  LiveTimeCounter
//
//  Created by Marc Nürnberg on 03.03.18.
//  Copyright © 2018 G2323. All rights reserved.
//

import Foundation

import UIKit

class OutputViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var result: String = "Hallo Marc";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.outputLabel.text = result;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

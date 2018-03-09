//
//  ViewController.swift
//  LiveTimeCounter
//
//  Created by Dr. Nürnberg on 02.03.18.
//  Copyright © 2018 G2323. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var inputDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("habe auf den Knopf gedrückt: \(inputDatePicker.date.description)");
        if (segue.identifier == "calculate") {
            let outputViewController = segue.destination as! OutputViewController
            outputViewController.result = inputDatePicker.date.description
            
        }
    }


}


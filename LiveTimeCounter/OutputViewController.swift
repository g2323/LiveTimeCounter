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
    
    @IBOutlet weak var yearValue: UILabel!
    @IBOutlet weak var monthValue: UILabel!
    @IBOutlet weak var dayValue: UILabel!
    @IBOutlet weak var hourValue: UILabel!
    @IBOutlet weak var minuteValue: UILabel!
    @IBOutlet weak var secondValue: UILabel!
    
    var result: String = "Hallo Marc";
    var resultDate: Date = Date();
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(parseDate), userInfo: nil, repeats: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.timer.invalidate();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func parseDate() {
        let now = Date();
        let cal = Calendar(identifier: .gregorian);
        //let yearBirthday = cal.component(.year, from: resultDate)
        //let yearNow = cal.component(.year, from: now)
        //var yearDiff = yearNow - yearBirthday;
        //yearDiff = (yearDiff < 0) ? 0 : yearDiff;
        //self.result = "\(yearDiff)";
        
        let diffs = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: resultDate, to: now);
        //self.result = "\(diffs.year ?? 0) \(diffs.month ?? 0) \(diffs.day ?? 0) \(diffs.hour ?? 0) \(diffs.minute ?? 0) \(diffs.second ?? 0)";

        self.yearValue.text = "\(diffs.year ?? 0)"
        self.monthValue.text = "\(diffs.month ?? 0)"
        self.dayValue.text = "\(diffs.day ?? 0)"
        self.hourValue.text = "\(diffs.hour ?? 0)"
        self.minuteValue.text = "\(diffs.minute ?? 0)"
        self.secondValue.text = "\(diffs.second ?? 0)"

    }
    
    
}

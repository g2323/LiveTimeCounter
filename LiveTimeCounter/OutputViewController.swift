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
    @IBOutlet weak var minValue: UILabel!
    @IBOutlet weak var secValue: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        print("gedrückt")
        performSegue(withIdentifier: "WebViewSegue", sender: self)
    }
    //var resultDate: Date = Date();
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        redrawScreen()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(parseDate), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        //self.timer.invalidate();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer.invalidate();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func redrawScreen() {
        messageLabel.text = CounterModel.shared().message
        
        if (CounterModel.shared().image != nil) {
            imageView.contentMode = .scaleAspectFill
            imageView.image = CounterModel.shared().image
            //print("take image from model");
        }
    }
    
    @objc func parseDate() {
        let now = Date();
        let cal = Calendar(identifier: .gregorian);
        //let yearBirthday = cal.component(.year, from: resultDate)
        //let yearNow = cal.component(.year, from: now)
        //var yearDiff = yearNow - yearBirthday;
        //yearDiff = (yearDiff < 0) ? 0 : yearDiff;
        //self.result = "\(yearDiff)";
        
        let diffs = (CounterModel.shared().anchorDate < now) ?
                cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: CounterModel.shared().anchorDate, to: now) :
                cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now, to: CounterModel.shared().anchorDate);
        //self.result = "\(diffs.year ?? 0) \(diffs.month ?? 0) \(diffs.day ?? 0) \(diffs.hour ?? 0) \(diffs.minute ?? 0) \(diffs.second ?? 0)";
        
       

        self.yearValue.text = "\(diffs.year ?? 0)"
        self.monthValue.text = String(format: "%02d", diffs.month ?? 0)
        self.dayValue.text = String(format: "%02d", diffs.day ?? 0)
        self.hourValue.text = String(format: "%02d", diffs.hour ?? 0)
        self.minValue.text = String(format: "%02d", diffs.minute ?? 0)
        self.secValue.text = String(format: "%02d", diffs.second ?? 0)
        
        if (cal.compare(CounterModel.shared().anchorDate, to: now, toGranularity: .minute ) == .orderedSame) {
            messageLabel.text = CounterModel.shared().messageZero
        }

    }
    
    
}

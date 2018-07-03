//
//  CounterModel.swift
//  LiveTimeCounter
//
//  Created by Dr. Nürnberg on 10.05.18.
//  Copyright © 2018 PSI Logistics GmbH. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CounterModel : NSObject {
    
    private static var sharedCounterModel: CounterModel = {
        let counterModel = CounterModel()
        return counterModel
    }()
    
    class func shared() -> CounterModel {
        return sharedCounterModel
    }
    
    var anchorDate : Date = Date()
    var message : String = ""
    var messageZero : String = ""
    var image : UIImage? = nil
    
    override init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        anchorDate = dateFormatter.date(from: "1968-05-18 08:36")!
    }
    
}

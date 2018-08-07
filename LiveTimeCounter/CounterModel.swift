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
    var url : URL? = URL(string: "http://www.psilogistics.com")
    
    override init() {
        //print("init")
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        //anchorDate = dateFormatter.date(from: "1968-05-18 08:36")!
        anchorDate = UserDefaultsManager.anchorDate
        message = UserDefaultsManager.message
        messageZero = UserDefaultsManager.messageZero
        image = UserDefaultsManager.image
        url = UserDefaultsManager.url
    }
    
    func persist() {
        //print("persist")
        UserDefaultsManager.anchorDate = anchorDate
        UserDefaultsManager.message = message
        UserDefaultsManager.messageZero = messageZero
        if (image != nil) {
            UserDefaultsManager.image = image!
        }
        if (url != nil) {
            UserDefaultsManager.url = url!
        }
    }
    
}

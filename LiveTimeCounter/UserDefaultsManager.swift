//
//  UserDefaultsManager.swift
//  LiveTimeCounter
//
//  Created by Dr. Nürnberg on 07.08.18.
//  Copyright © 2018 PSI Logistics GmbH. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsManager {
    
    private static let anchorDateKey = "anchorDate"
    private static let messageKey = "message"
    private static let messageZeroKey = "messageZero"
    private static let imageKey = "image"
    
    static var anchorDate: Date {
        get {
            let retval : Date = Date()
            if (UserDefaults.standard.object(forKey: anchorDateKey) != nil) {
                return UserDefaults.standard.object(forKey: anchorDateKey) as! Date
            }
            return retval
        }
        set {
            UserDefaults.standard.set(newValue, forKey: anchorDateKey)
        }
    }
    
    static var message: String {
        get {
            let retval = ""
            if (UserDefaults.standard.string(forKey: messageKey) != nil) {
                return UserDefaults.standard.string(forKey: messageKey)!
            }
            return retval
        }
        set {
            UserDefaults.standard.set(newValue, forKey: messageKey)
        }
    }
    
    static var messageZero: String {
        get {
            let retval = ""
            if (UserDefaults.standard.string(forKey: messageZeroKey) != nil) {
                return UserDefaults.standard.string(forKey: messageZeroKey)!
            }
            return retval
        }
        set {
            UserDefaults.standard.set(newValue, forKey: messageZeroKey)
        }
    }
    
    static var image: UIImage? {
        get {
            let retval : UIImage? = nil
            if (UserDefaults.standard.object(forKey: imageKey) != nil) {
                let encodedData = UserDefaults.standard.object(forKey: imageKey) as! Data
                let decodedData = NSKeyedUnarchiver.unarchiveObject(with: encodedData)
                return decodedData as? UIImage
            }
            return retval
        }
        set {
            var encodedData = NSKeyedArchiver.archivedData(withRootObject: newValue)
            UserDefaults.standard.set(encodedData, forKey: imageKey)
        }
    }
    
}

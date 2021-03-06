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
    private static let URLKey = "URL"
    
    
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
                //print("got image from user defaults")
                return decodedData as? UIImage
            }
            return retval
        }
        set {
            if (newValue != nil) {
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: newValue!)
                UserDefaults.standard.set(encodedData, forKey: imageKey)
                //print("save image to user defaults")
            }
        }
    }
    
    static var url: URL {
        get {
            var retval : URL = URL(string: "http://www.psilogistics.com")!
            if (UserDefaults.standard.object(forKey: URLKey) != nil) {
                    let obj = UserDefaults.standard.object(forKey: URLKey)
                if (obj != nil) {
                    if let str = obj as? String {
                        retval = URL(string: str)!
                    }
                }
            }
            return retval
        }
        set {
            UserDefaults.standard.set(newValue.absoluteString, forKey: URLKey)
        }
    }
    
}

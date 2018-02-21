//
//  Mission.swift
//  OneDayMission
//
//  Created by gakki on 21/02/2018.
//  Copyright © 2018 gakki. All rights reserved.
//

import UIKit
import os.log

enum Category: String{
    case study
    case work
    case eat
    case leisure
    case others
}

class Mission: NSObject, NSCoding{
    
    //MARK: Properties
    var interval: Float32
    var text: String
    var category: Category?
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("missions")
    
    struct PropertyKey {
        static let interval = "interval"
        static let text = "text"
        static let category = "category"
    }
    
    //MARK: Initalization
    init?(interval: Float32, text: String, category: Category?) {
        guard interval != 0 else{
            return nil
        }
        
        if text.isEmpty {
            self.text = " "
        } else{
            self.text = text
        }
        self.interval = interval
        
        self.category = category
    }
    
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder){
        aCoder.encode(interval, forKey: PropertyKey.interval)
        aCoder.encode(text, forKey: PropertyKey.text)
        aCoder.encode(category, forKey: PropertyKey.category)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let text = aDecoder.decodeObject(forKey: PropertyKey.text) as? String else {
            os_log("Unable to decode the text for the mission object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because photo is an optional property of Meal, just use conditional cast.
        let interval = aDecoder.decodeFloat(forKey: PropertyKey.interval)
        let category = aDecoder.decodeObject(forKey: PropertyKey.category) as? Category
        // Must call designated initializer.
        self.init(interval: interval, text: text, category: category)
    }
    
    
    
    
    
}

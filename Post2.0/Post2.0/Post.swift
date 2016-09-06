//
//  Post.swift
//  Post2.0
//
//  Created by Justin Carver on 9/6/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class Post {
    
    private let kUser = "username"
    private let kTimeStamp = "timestamp"
    private let kText = "text"
    
    var Username: String
    var Text: String
    var timeStamp: NSTimeInterval
    var UUID: NSUUID = NSUUID()
    
    init?(dictionary: [String: AnyObject]) {
        guard let Username = dictionary[kUser] as? String, Text = dictionary[kText] as? String, timeStamp = dictionary[kTimeStamp] as? NSTimeInterval else { return nil }
        
        self.Username = Username
        self.Text = Text
        self.timeStamp = timeStamp
    }
    
    init(Username: String, Text: String, Timestamp: NSTimeInterval, UUID: NSUUID = NSUUID()) {
        self.Username = Username
        self.Text = Text
        self.timeStamp = Timestamp
    }
}
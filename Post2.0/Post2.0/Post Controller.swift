//
//  Post Controller.swift
//  Post2.0
//
//  Created by Justin Carver on 9/6/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class PostController {
    
    static let baseURL = NSURL(string: "https://devmtn-post.firebaseio.com/posts.json")
    
    static func getPosts(completion: (posts: [Post]) -> Void) {
        
        guard let url = baseURL else { completion(posts: []); return }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            
            guard let data = data else { completion(posts: []); return }
            
            if error != nil {
                print(error)
                completion(posts: [])
                return
            }
            
            guard let JSONDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments))
                as? [String: [String: AnyObject]] else { completion(posts: []); return }
            
            let posts = JSONDictionary.flatMap({ Post(dictionary: $0.1) })
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(posts: posts)
            })
        }
    }
}
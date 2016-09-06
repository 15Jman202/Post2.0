//
//  PostTableViewController.swift
//  Post2.0
//
//  Created by Justin Carver on 9/6/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PostController.getPosts { (posts) in
            self.posts = posts
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath)

        let post = posts[indexPath.row]
        cell.textLabel?.text = post.Username
        cell.detailTextLabel?.text = post.Text
        
        return cell
    }
}

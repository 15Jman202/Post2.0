//
//  PostTableViewController.swift
//  Post2.0
//
//  Created by Justin Carver on 9/6/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        

        return cell
    }
}

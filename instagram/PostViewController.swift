//
//  PostViewController.swift
//  instagram
//
//  Created by Mo on 2/23/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var posts: [Post]!
    var refreshControl : UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return posts.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row] as PFObject!
        
        cell.postDescLabel.text = (post!["caption"] as! String)
        cell.photoView.file = (post!["media"] as! PFFile)
        cell.photoView.loadInBackground()
        return cell

    }
 
    
    @IBAction func onPost(_ sender: Any) {
        self.performSegue(withIdentifier: "postSegue", sender: nil)
    }
    
    // Logs out the user and sends them back to login screen
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground()
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPosts()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 440
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PostViewController.fetchPosts), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchPosts()
    }
    
    @objc func fetchPosts() {
        // construct PFQuery
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.limit = 20
        
        query?.findObjectsInBackground(block: {(posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.posts = posts as! [Post]
                print(posts.count)
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            } else {
                print("coudln't find data")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

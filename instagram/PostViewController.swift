//
//  PostViewController.swift
//  instagram
//
//  Created by Mo on 2/23/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var posts: [Post]!
    
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
        cell.post = posts[indexPath.row]
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
    
    let vc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 440
        tableView.delegate = self
        tableView.dataSource = self
        vc.delegate = self
        
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
                refreshControl.endRefreshing()
                // do something with the data fetched
            } else {
                print("coudln't find data")
            }
        })
        // Do any additional setup after loading the view.
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

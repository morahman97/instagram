//
//  DetailViewViewController.swift
//  instagram
//
//  Created by Mo on 2/26/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetailViewViewController: UIViewController {

    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var postDescLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

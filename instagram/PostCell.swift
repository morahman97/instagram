//
//  PostCell.swift
//  instagram
//
//  Created by Mo on 2/24/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var photoView: PFImageView!
    
    var post : PFObject! {
        didSet {
            
            //postImageView.image = post.media
//            postDescLabel.text = post.caption
//            postImageView.image = post.media as! UIImage
            photoView.file = post["image"] as? PFFile
            photoView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  PostCell.swift
//  instagram
//
//  Created by Mo on 2/24/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post : Post! {
        didSet {
            
            //postImageView.image = post.media
            postDescLabel.text = post.caption
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

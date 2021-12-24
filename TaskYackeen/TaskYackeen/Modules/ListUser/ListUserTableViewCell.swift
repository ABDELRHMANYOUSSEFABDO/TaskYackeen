//
//  ListUserTableViewCell.swift
//  TaskYackeen
//
//  Created by Apple on 12/24/21.
//

import UIKit

class ListUserTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageList: UIImageView!
    
    @IBOutlet var premieredLabel: UILabel!
    
    @IBOutlet var RuntimeLabel: UILabel!
    
    @IBOutlet var LinkButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

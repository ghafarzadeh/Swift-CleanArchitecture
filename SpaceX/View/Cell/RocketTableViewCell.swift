//
//  RocketTableViewCell.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import UIKit
import SDWebImage

class RocketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model: RocketList.getRocketList.ViewModel.DisplayRocketList! {
        didSet {
            self.lblName.text = model.name
            self.lblDescription.text = model.description
            if let imgLink = model.flickr_images.first, let url = URL(string: imgLink) {
                self.img.sd_setImage(with: url)
            }
        }
    }
    
    @IBAction func favAct(_ sender: Any) {
        
    }
    
}

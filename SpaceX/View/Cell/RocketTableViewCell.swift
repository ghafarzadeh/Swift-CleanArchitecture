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
    
    var delegate: FavoriteRocketProtocol?

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
            if Defaults.shared.isRocketExist(model.id) {
                btnStar.setImage(UIImage(named: "starFillIcon"), for: .normal)
            }else {
                btnStar.setImage(UIImage(named: "starEmptyIcon"), for: .normal)
            }
        }
    }
    
    var favoriteModel: Favorite.getFavoriteList.ViewModel.DisplayRocketList! {
        didSet {
            self.lblName.text = favoriteModel.name
            self.lblDescription.text = favoriteModel.description
            if let imgLink = favoriteModel.flickr_images.first, let url = URL(string: imgLink) {
                self.img.sd_setImage(with: url)
            }
            if Defaults.shared.isRocketExist(favoriteModel.id) {
                btnStar.setImage(UIImage(named: "starFillIcon"), for: .normal)
            }else {
                btnStar.setImage(UIImage(named: "starEmptyIcon"), for: .normal)
            }
        }
    }
    
    @IBAction func favAct(_ sender: Any) {
        if self.model != nil {
            delegate?.saveRocket(rocketId: self.model.id)
        }else {
            delegate?.saveRocket(rocketId: self.favoriteModel.id)
        }
    }
    
}

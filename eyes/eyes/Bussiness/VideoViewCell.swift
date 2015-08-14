//
//  VideoViewCell.swift
//  eyes
//
//  Created by yangyouyong on 15/8/13.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit
import Alamofire

class VideoViewCell: UITableViewCell {
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var model:VideoModel?{
        didSet{
            titleLabel.text = model?.title
            contentLabel.text = model?.descrip
            BaseService().DownloadImageForUrl(imageUrl: (model?.coverForDetail)!) { (imageData, _) in
                if (imageData != nil) {
                    self.bgImageView.image = UIImage(data: imageData!)
                }
            }
        }
        willSet{
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

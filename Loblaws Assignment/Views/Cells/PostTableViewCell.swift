//
//  PostTableViewCell.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    func configure(with model: PostViewModelProtocol) {
        titleLabel.text = model.title
        if model.hasThumbnail {
            thumbnailImage.setImage(from: model.thumbnail)
        }
    }
}

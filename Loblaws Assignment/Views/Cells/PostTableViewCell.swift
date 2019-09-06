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
        DispatchQueue.main.async {
            self.titleLabel.text = model.title
            self.setThumbnailImage(from: model)
        }
    }
    
    fileprivate func setThumbnailImage(from model: PostViewModelProtocol) {
        thumbnailImage.image = nil
        if model.hasThumbnail {
            thumbnailImage.setImage(from: model.thumbnail)
        }
    }
}

//
//  PostDetailViewController.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postDescriptionTopConstraint: NSLayoutConstraint!
    
    var selectedPost: PostViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPost.title
        configureView()
    }
    
    fileprivate func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.postDescription.text = self.selectedPost.postDescription
            self.setThumbnailImageIfPresent()
        }
    }
    
    fileprivate func setThumbnailImageIfPresent() {
        if (selectedPost.hasThumbnail) {
            thumbnailImage.setImage(from: selectedPost.thumbnail)
        } else {
            postDescriptionTopConstraint.constant = 20.0
        }
    }
}

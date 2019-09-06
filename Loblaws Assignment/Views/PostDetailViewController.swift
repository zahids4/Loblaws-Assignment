//
//  PostDetailViewController.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    var selectedPost: PostViewModelProtocol!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postDescriptionTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    fileprivate func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.title = self.selectedPost.title
            self.postDescription.text = self.selectedPost.postDescription
            if (self.selectedPost.hasThumbnail) {
                self.thumbnailImage.setImage(from: self.selectedPost.thumbnail)
            } else {
                self.postDescriptionTopConstraint.constant = 20.0
            }
        }
    }
}

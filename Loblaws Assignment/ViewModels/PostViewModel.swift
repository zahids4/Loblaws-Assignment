//
//  PostViewModel.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

protocol PostViewModelProtocol: class {
    var title: String! { get }
    var thumbnail: String! { get }
    var hasThumbnail: Bool! { get }
    var heightForRow: CGFloat! { get }
    init(post: Post)
}

class PostViewModel: PostViewModelProtocol {
    let post: Post
    
    var title: String!
    var thumbnail: String!
    var hasThumbnail: Bool!
    var heightForRow: CGFloat!
    
    required init(post: Post) {
        self.post = post
        self.title = post.title
        self.thumbnail = post.thumbnail
        self.hasThumbnail = self.thumbnail != "self"
        self.heightForRow = hasThumbnail ? 146 : 44
    }
}



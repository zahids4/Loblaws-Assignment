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
    var url: String! { get }
    var description: String! { get }
    var postDescription: String! { get }
    init(post: Post)
}

class PostViewModel: PostViewModelProtocol {
    private let post: Post

    var title: String!
    var thumbnail: String!
    var hasThumbnail: Bool!
    var heightForRow: CGFloat!
    var url: String!
    var description: String!
    var postDescription: String!
    
    required init(post: Post) {
        self.post = post
        self.title = post.title
        self.thumbnail = post.thumbnail
        self.hasThumbnail = !(self.thumbnail == "self" || self.thumbnail == "default")
        self.heightForRow = hasThumbnail ? 146 : 44
        self.url = post.url
        self.description = post.description
        self.postDescription = post.description == "" ? post.url : post.description
    }
}



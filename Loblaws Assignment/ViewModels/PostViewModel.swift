//
//  PostViewModel.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol PostViewModelProtocol: class {
    var title: String! { get set }
    init(post: Post)
}

class PostViewModel: PostViewModelProtocol {
    let post: Post
    var title: String!
    required init(post: Post) {
        self.post = post
        self.title = post.title
    }
}



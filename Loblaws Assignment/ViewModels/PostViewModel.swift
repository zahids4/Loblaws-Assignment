//
//  PostViewModel.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

protocol PostViewModelProtocol: class {
    var title: String! { get set }
    var author: String! { get set }
    func configure(_ cell: UITableViewCell)
    init(post: Post)
}

class PostViewModel: PostViewModelProtocol {
    let post: Post
    
    var title: String!
    var author: String!
    
    func configure(_ cell: UITableViewCell) {
        cell.textLabel!.text = title
        cell.detailTextLabel!.text = author
    }
    
    
    required init(post: Post) {
        self.post = post
        self.title = post.title
        self.author = post.author
    }
}



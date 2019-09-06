//
//  PostViewModel.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol PostViewModelProtocol: class {
    var title: String? { get }
    var titleDidChange: ((PostViewModelProtocol) -> ())? { get set }
    init(post: Post)
    func showGreeting()
}

class PostViewModel: PostViewModelProtocol {
    let post: Post
    
    var title: String? {
        didSet {
            self.titleDidChange?(self)
        }
    }
    
    var titleDidChange: ((PostViewModelProtocol) -> ())? 
    
    required init(post: Post) {
        self.post = post
    }
    
    func showGreeting() {
        self.title = post.title
    }
}



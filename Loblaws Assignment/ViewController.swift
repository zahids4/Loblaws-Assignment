//
//  ViewController.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-04.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInteractive).async {
            ApiProvider.shared.fetchSwiftSubredditData() { (result: Result<SwiftSubreddit, ApiProvider.APIServiceError>) in
                switch result {
                case .success(let subreddit):
                    print(subreddit.posts.count)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


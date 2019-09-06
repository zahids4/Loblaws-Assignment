//
//  SubredditViewModel.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol SubredditViewModelProtocol: class {
    func fetchSubredditData(closure: @escaping (SwiftSubreddit) -> ())
}

class SubredditViewModel: SubredditViewModelProtocol {
    func fetchSubredditData(closure: @escaping (SwiftSubreddit) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            ApiProvider.shared.fetchSwiftSubredditData() { (result: Result<SwiftSubreddit, ApiProvider.APIServiceError>) in
                switch result {
                case .success(let subreddit):
                    closure(subreddit)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

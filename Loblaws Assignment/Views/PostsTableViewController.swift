//
//  PostsTableViewController.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-06.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    var postViewModels = [PostViewModelProtocol]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSubredditData() { subreddit in
            self.postViewModels = subreddit.posts.map { PostViewModel(post: $0) }
        }
    }
    
    fileprivate func fetchSubredditData(closure: @escaping (SwiftSubreddit) -> ()) {
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        postViewModels[indexPath.row].configure(cell)
        
        return cell
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

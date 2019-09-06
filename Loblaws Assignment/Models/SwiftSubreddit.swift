//
//  Swift Subreddit.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-04.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

public struct SwiftSubreddit: Decodable {
    public let posts: [Post]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case posts = "children"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        posts = try data.decode([Post].self, forKey: .posts)
    }
}

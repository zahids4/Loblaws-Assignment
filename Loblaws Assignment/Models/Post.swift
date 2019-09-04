//
//  Post.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-04.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

public struct Post: Decodable {
    public let title: String
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case title = "title"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        title = try data.decode(String.self, forKey: .title)
    }
}

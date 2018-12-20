//
//  Joke.swift
//  ApiManager
//
//  Created by Umar Yaqub on 17/12/2018.
//  Copyright © 2018 Umar Yaqub. All rights reserved.
//

import Foundation

struct Joke: Decodable {
    let id: Int
    let text: String
    let categories: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text = "joke"
        case categories
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.categories = try container.decode([String].self, forKey: .categories)
    }
}

//
//  Result.swift
//  ICNDBClient
//
//  Created by Umar Yaqub on 20/12/2018.
//  Copyright © 2018 Umar Yaqub. All rights reserved.
//

import Foundation

struct Result: Decodable {
    
    let jokes: [Joke]
    
    private enum RootKeys: String, CodingKey {
        case type
        case jokes = "value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        do {
            let joke = try container.decode(Joke.self, forKey: .jokes)
            self.jokes = [joke]
        } catch {
            self.jokes = try container.decode([Joke].self, forKey: .jokes)
        }
    }
}

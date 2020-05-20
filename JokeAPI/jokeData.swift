//
//  jokeData.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/19.
//  Copyright © 2020 LTI. All rights reserved.
//

import Foundation

struct Joke: Decodable {
    var category: String
    var type: String
    var setup: String
    var delivery: String
    //var joke: String
    var flags: [String: Bool]
}

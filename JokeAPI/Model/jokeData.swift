//
//  jokeData.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/19.
//  Copyright © 2020 LTI. All rights reserved.
//

import Foundation

struct SingleJokeData: Codable {
    var category: String
    var type: String
    var joke : String
    var flags: Flags
    var id : Int
    var error : Bool
}

struct TwoPartJokeData: Codable {
    var category: String
    var type: String
    var setup: String
    var delivery: String
    var flags: Flags
    var id : Int
    var error : Bool
}

struct Flags: Codable {
    var nsfw : Bool
    var religious : Bool
    var political : Bool
    var racist : Bool
}

enum CategoryFlag: Int {
    case `Any` = 1
    case Custom
    case Programming
    case Miscellaneous
    case Dark
    
    var name: String {
        get { return String(describing: self) }
    }
}

enum BlacklistedFlag: Int {
    case nsfw = 1
    case religious
    case political
    case racist
    case sexist
    
    var name: String {
        get { return String(describing: self) }
    }
}

enum JokeType: Int {
    case single = 1
    case twopart
    
    var name: String {
        get { return String(describing: self) }
    }
}



//
//  JokeSearchViewModel.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/21.
//  Copyright © 2020 LTI. All rights reserved.
//

import Foundation

class JokeSearchViewModel {
    
    var baseURL = "https://sv443.net/jokeapi/v2/joke/"
    var typeString = "&type="
    var blackListString = "blacklistFlags="
    var categoryString = "Any"
    
    func setString() {
        baseURL = "https://sv443.net/jokeapi/v2/joke/"
        typeString = "&type=single,"
        blackListString = "blacklistFlags="
        categoryString = "Any"
    }
    
    func setString(selected: Bool, mainString: String, subString: String) -> String {
           var resultString = ""
           if selected {
               resultString = mainString + subString + ","
           } else {
               resultString = mainString.replacingOccurrences(of: subString + ",", with: "")
           }
           return resultString
       }
    
    func validateUrlString() {
        baseURL = baseURL + categoryString + "?"
        if blackListString.contains(",") {
            blackListString.remove(at: blackListString.index(before: blackListString.endIndex))
            baseURL = baseURL + blackListString
        }
        if typeString.contains(",") {
            if typeString.contains("&") {
                typeString.remove(at: typeString.index(before: typeString.endIndex))
                
            }
            baseURL = baseURL + typeString
        }
        
        baseURL = baseURL.replacingOccurrences(of: ",?", with: "?")
        baseURL = baseURL.replacingOccurrences(of: "?&", with: "?")
        baseURL = baseURL.replacingOccurrences(of: ",&", with: "&")
        baseURL = baseURL.replacingOccurrences(of: "&&", with: "&")
    }
}

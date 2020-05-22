//
//  JokeSearchViewModel.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/21.
//  Copyright © 2020 LTI. All rights reserved.
//

import Foundation

class JokeResultViewModel {
    
    var jokeType: JokeType = .single
    var singleJokeResult: SingleJokeData!
    var twoPartJokeResult: TwoPartJokeData!
    
    func callAPI(apiUrlString: String, completed: @escaping (Bool, String?) ->Void) {
        if let url = URL(string: apiUrlString) {
            
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        if let typeOfJoke = jsonData["type"] as? String {
                            if typeOfJoke == JokeType.single.name {
                                self.jokeType = JokeType.single
                                self.singleJokeResult = try? JSONDecoder().decode(SingleJokeData.self, from: data)
                            } else {
                                self.jokeType = JokeType.twopart
                                self.twoPartJokeResult = try? JSONDecoder().decode(TwoPartJokeData.self, from: data)
                            }
                            DispatchQueue.main.async {
                                completed(true,nil)
                            }
                        } else {
                            DispatchQueue.main.async {
                                completed(false, jsonData["message"] as? String)
                            }
                        }
                    } catch {
                        print("Something occured: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}

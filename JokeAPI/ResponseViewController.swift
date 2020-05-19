//
//  ResponseViewController.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/18.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {

    @IBOutlet var response: UILabel!
    var apiUrl = ""
    var result: Joke!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI()
    }
    
    func callAPI() {
        if let url = URL(string: apiUrl) {
            print(apiUrl)
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    do {
                        self.result = try JSONDecoder().decode(Joke.self, from: data)
                        guard let responseData = self.result else {
                            return
                        }
                        print(responseData)
                        DispatchQueue.main.async {
                            self.response.text = responseData.type
                        }
                    } catch {
                        print("Something occured: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
    
}

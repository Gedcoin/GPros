//
//  ResponseViewController.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/18.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var apiUrl = ""
    var result: Joke!
    var jokeType: String = ""
    var jokeSetup: String = ""
    var jokeDelivery: String = ""
    //var joke: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayJokeCell = tableView.dequeueReusableCell(withIdentifier: "CID_Display_Joke", for: indexPath) as! JokeTableViewCell
        displayJokeCell.jokeTypeLabel.text = "Joke type: " + jokeType
        displayJokeCell.jokeSetup.text = "Joke setup: " + jokeSetup
        displayJokeCell.jokeDelivery.text = "Joke delivery: " + jokeDelivery
        return displayJokeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func callAPI(completed: @escaping () -> () ) {
        if let url = URL(string: apiUrl) {
            print(apiUrl)
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    do {
                        self.result = try JSONDecoder().decode(Joke.self, from: data)
                        guard let responseData = self.result else {
                            return
                        }
                        
                        DispatchQueue.main.async {
                            self.jokeType = responseData.type
                            self.jokeSetup = responseData.setup
                            self.jokeDelivery = responseData.delivery
                            //self.joke = responseData.joke
                            completed()
                        }
                    } catch {
                        print("Something occured: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}

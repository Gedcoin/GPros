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
    var jokeResultViewModel = JokeResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeResultViewModel.callAPI(apiUrlString: apiUrl) {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if jokeResultViewModel.jokeType == .single {
            if jokeResultViewModel.singleJokeResult != nil {
                return 1
            }
        } else {
            if jokeResultViewModel.twoPartJokeResult != nil {
                return 1
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayJokeCell = tableView.dequeueReusableCell(withIdentifier: "CID_Display_Joke", for: indexPath) as! JokeTableViewCell
        if jokeResultViewModel.jokeType == .single { 
            displayJokeCell.jokeTypeTextLabel.text = "Joke"
            displayJokeCell.jokeTypeLabel.text = jokeResultViewModel.singleJokeResult.joke
            displayJokeCell.jokeSetup.isHidden = true
            displayJokeCell.jokeDelivery.isHidden = true
            displayJokeCell.jokeSetupTextLabel.isHidden = true
            displayJokeCell.jokeDeliveryTextLabel.isHidden = true
        } else {
            displayJokeCell.jokeTypeLabel.text = jokeResultViewModel.twoPartJokeResult.type
            displayJokeCell.jokeSetup.text = jokeResultViewModel.twoPartJokeResult.setup
            displayJokeCell.jokeDelivery.text = jokeResultViewModel.twoPartJokeResult.delivery
        }
        return displayJokeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

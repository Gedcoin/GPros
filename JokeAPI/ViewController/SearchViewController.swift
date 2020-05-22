//
//  ViewController.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/14.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var AnyCategoryButton: UIButton!
    @IBOutlet var CustomCategoryButton: UIButton!
    @IBOutlet var ProgrammingCategory: UIButton!
    @IBOutlet var MiscellaneousCategory: UIButton!
    @IBOutlet var DarkCategory: UIButton!
    @IBOutlet var SearchStringTextfield: UITextField!
    @IBOutlet var singleJokeType: UIButton!
    @IBOutlet weak var twoPartJokeType: UIButton!
    
    @IBOutlet var blacklistFlagButtons: [UIButton]!
    
    
    
    let jokeSearchViewModel = JokeSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchStringTextfield.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        jokeSearchViewModel.setString()
        setUI()
    }
    
    func setUI() {
        AnyCategoryButton.isSelected = true
        CustomCategoryButton.isSelected = false
        changeButtonState(selected: false)
        
        ProgrammingCategory.isSelected = false
        MiscellaneousCategory.isSelected = false
        DarkCategory.isSelected = false
        
        singleJokeType.isSelected = true
        twoPartJokeType.isSelected = false
        
        for flagButton in blacklistFlagButtons {
            flagButton.isSelected = false
        }
        SearchStringTextfield.text = ""
    }
    
    
    
    func changeButtonState(selected: Bool) {
        ProgrammingCategory.isEnabled = selected
        MiscellaneousCategory.isEnabled = selected
        DarkCategory.isEnabled = selected
    }
    
   
    
    @IBAction func categorySelected(_ sender: UIButton) {
        var categoryObj = CategoryFlag(rawValue: sender.tag)
        if categoryObj == .Any {
            jokeSearchViewModel.categoryString = ""
            AnyCategoryButton.isSelected = true
            CustomCategoryButton.isSelected = false
            ProgrammingCategory.isSelected = false
            changeButtonState(selected: false)
            
        } else if categoryObj == .Custom {
            jokeSearchViewModel.categoryString = ""
            AnyCategoryButton.isSelected = false
            CustomCategoryButton.isSelected = true
            ProgrammingCategory.isSelected = true
            categoryObj = CategoryFlag.Programming
            changeButtonState(selected: true)
        } else {
            sender.isSelected = !sender.isSelected
        }
        
        if let categoryObj = categoryObj {
            jokeSearchViewModel.categoryString = jokeSearchViewModel.setString(selected: sender.isSelected, mainString: jokeSearchViewModel.categoryString, subString: "\(categoryObj.name)")
        }
    }
    
    @IBAction func blacklistFlagSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let blacklistObj = BlacklistedFlag(rawValue: sender.tag) else {
            return
        }
        jokeSearchViewModel.blackListString = jokeSearchViewModel.setString(selected: sender.isSelected, mainString: jokeSearchViewModel.blackListString, subString: "\(blacklistObj.name)")
    }
    
    @IBAction func jokeTypeSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let jokeTypeObj = JokeType(rawValue: sender.tag) else {
            return
        }
        jokeSearchViewModel.typeString = jokeSearchViewModel.setString(selected: sender.isSelected, mainString: jokeSearchViewModel.typeString, subString: "\(jokeTypeObj.name)")
    }
    
    
    
    @IBAction func SearchJoke(_ sender: UIButton) {
        jokeSearchViewModel.validateUrlString()
        
        if let searchStringCount = SearchStringTextfield.text?.count {
            if searchStringCount > 0 {
                if let searchString = SearchStringTextfield.text {
                    jokeSearchViewModel.baseURL = jokeSearchViewModel.baseURL + "&contains=" + searchString
                }
            }
        }
        
        let responseVC = self.storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewController
        
        responseVC.apiUrl = jokeSearchViewModel.baseURL
        
        self.navigationController?.pushViewController(responseVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchStringTextfield.resignFirstResponder()
        return true
    }
    
}

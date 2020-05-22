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
    @IBOutlet var singleJokeType: UIButton! //Added this so that it can be selected by default when view loads
    
    var baseURL = "https://sv443.net/jokeapi/v2/joke/"
    var typeString = "&type="
    var blackListString = "blacklistFlags="
    var categoryString = "Any"
    
    //let jokeSearchViewModel = JokeSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        setString()
    }
    
    func setUI() {
        AnyCategoryButton.isSelected = true
        ProgrammingCategory.isEnabled = false
        MiscellaneousCategory.isEnabled = false
        DarkCategory.isEnabled = false
        
        ProgrammingCategory.isSelected = false
        MiscellaneousCategory.isSelected = false
        DarkCategory.isSelected = false
        
        singleJokeType.isSelected = true //At least one of the types must be selected
    }
    
    func setString() {
        baseURL = "https://sv443.net/jokeapi/v2/joke/"
        typeString = "&type="
        blackListString = "blacklistFlags="
        categoryString = "Any"
    }
    
    func changeButtonState(selected: Bool) {
        ProgrammingCategory.isEnabled = selected
        MiscellaneousCategory.isEnabled = selected
        DarkCategory.isEnabled = selected
    }
    
    func setString(selected: Bool, mainString: String, subString: String) -> String {
        var resultString = ""
        if selected {
            resultString = mainString + subString + ","
        }
        else {
            resultString = mainString.replacingOccurrences(of: subString + ",", with: "")
        }
        return resultString
    }
    
    @IBAction func categorySelected(_ sender: UIButton) {
        var categoryObj = CategoryFlag(rawValue: sender.tag)
        if categoryObj == .Any {
            categoryString = ""
            AnyCategoryButton.isSelected = true
            CustomCategoryButton.isSelected = false
            ProgrammingCategory.isSelected = false
            changeButtonState(selected: false)
            
        } else if categoryObj == .Custom {
            categoryString = ""
            AnyCategoryButton.isSelected = false
            CustomCategoryButton.isSelected = true
            ProgrammingCategory.isSelected = true
            categoryObj = CategoryFlag.Programming
            changeButtonState(selected: true)
        } else {
            sender.isSelected = !sender.isSelected
        }
        
        if let categoryObj = categoryObj {
            categoryString = setString(selected: sender.isSelected, mainString: categoryString, subString: "\(categoryObj.name)")
            
            baseURL = baseURL + categoryString
        }
    }
    
    @IBAction func blacklistFlagSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let blacklistObj = BlacklistedFlag(rawValue: sender.tag) else {
            return
        }
        blackListString = setString(selected: sender.isSelected, mainString: blackListString, subString: "\(blacklistObj.name)")
    }
    
    @IBAction func jokeTypeSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let jokeTypeObj = JokeType(rawValue: sender.tag) else {
            return
        }
        typeString = setString(selected: sender.isSelected, mainString: typeString, subString: "\(jokeTypeObj.name)")
    }
    
    func validateUrlString() {
        baseURL = baseURL + categoryString + "?"
        if blackListString.contains(",") {
            blackListString.remove(at: blackListString.index(before: blackListString.endIndex))
           baseURL = baseURL + blackListString
        }
        if typeString.contains(",") {
            typeString.remove(at: typeString.index(before: typeString.endIndex))
            baseURL = baseURL + typeString
        }
        /*if let searchString = SearchStringTextfield.text {
            baseURL = baseURL + "&contains=" + searchString
        }*/
        
        baseURL = baseURL.replacingOccurrences(of: ",?", with: "?")
        baseURL = baseURL.replacingOccurrences(of: "?&", with: "?")
        baseURL = baseURL.replacingOccurrences(of: ",&", with: "&")
        baseURL = baseURL.replacingOccurrences(of: "&&", with: "&")
        print("In:" + baseURL)
    }
    
    @IBAction func SearchJoke(_ sender: UIButton) {
        validateUrlString()
        let responseVC = self.storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewController
        responseVC.apiUrl = baseURL
        
        self.navigationController?.pushViewController(responseVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchStringTextfield.resignFirstResponder()
        return true
    }
    
}

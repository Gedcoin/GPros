//
//  ViewController.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/14.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

struct Joke: Decodable {
    var category: String
    var type: String
    var setup: String
    var delivery: String
    var flags: [String: Bool]
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var AnyCategoryButton: UIButton!
    @IBOutlet var CustomCategoryButton: UIButton!
    @IBOutlet var ProgrammingCategory: UIButton!
    @IBOutlet var MiscellaneousCategory: UIButton!
    @IBOutlet var DarkCategory: UIButton!
    @IBOutlet var SingleJokeType: UIButton!
    @IBOutlet var TwopartJokeType: UIButton!
    @IBOutlet var SearchStringTextfield: UITextField!
    
    var baseURL: String = "https://sv443.net/jokeapi/v2/joke/"
    var resultingURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnyCategoryButton.isSelected = true
        ProgrammingCategory.isEnabled = false
        MiscellaneousCategory.isEnabled = false
        DarkCategory.isEnabled = false
        
        SingleJokeType.isSelected = true
        TwopartJokeType.isSelected = true
        
        //resultingURL = appendCategory(key: "category")
    }

    @IBAction func AnyCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            CustomCategoryButton.isSelected = false
        } else {
            sender.isSelected = true
            CustomCategoryButton.isSelected = false
            
            resultingURL = baseURL + "Any"
            //resultingURL = appendCategory(key: "category")
            
            ProgrammingCategory.isEnabled = false
            MiscellaneousCategory.isEnabled = false
            DarkCategory.isEnabled = false
        }
    }
    
    @IBAction func CustomCategories(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            AnyCategoryButton.isSelected = false
        } else {
            sender.isSelected = true
            AnyCategoryButton.isSelected = false
            
            ProgrammingCategory.isEnabled = true
            ProgrammingCategory.isSelected = true
            
            if MiscellaneousCategory.isSelected == false && DarkCategory.isSelected == false {
                resultingURL = baseURL + "Programming"
            }
            
            MiscellaneousCategory.isEnabled = true
            DarkCategory.isEnabled = true
        }
    }
    
    @IBAction func ProgrammingCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            ProgrammingCategory.isSelected = false
            if MiscellaneousCategory.isSelected == true && DarkCategory.isSelected == true {
                resultingURL = baseURL + "Miscellaneous,Dark"
            } else if DarkCategory.isSelected == false {
                resultingURL = baseURL + "Programming"
            }
            
        } else {
            sender.isSelected = true
            
            if MiscellaneousCategory.isSelected == true && DarkCategory.isSelected == true {
                resultingURL = baseURL + "Programming,Miscellaneous,Dark"
            } else if MiscellaneousCategory.isSelected == true && DarkCategory.isSelected == false {
                resultingURL = baseURL + "Programming,Miscellaneous"
            } else if DarkCategory.isSelected == true && MiscellaneousCategory.isSelected == false {
                resultingURL = baseURL + "Programming,Dark"
            } else {
                resultingURL = baseURL + "Programming"
            }
        }
    }
    
    @IBAction func MiscellaneousCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            MiscellaneousCategory.isSelected = false
            if ProgrammingCategory.isSelected == true && DarkCategory.isSelected == true {
                resultingURL = baseURL + "Programming,Dark"
            } else if DarkCategory.isSelected == false {
                resultingURL = baseURL + "Programming"
            }
            
        } else {
            sender.isSelected = true
            
            if ProgrammingCategory.isSelected == true && DarkCategory.isSelected == true {
                resultingURL = baseURL + "Programming,Miscellaneous,Dark"
            } else if ProgrammingCategory.isSelected == true && DarkCategory.isSelected == false {
                resultingURL = baseURL + "Programming,Miscellaneous"
            } else if DarkCategory.isSelected == true && ProgrammingCategory.isSelected == false {
                resultingURL = baseURL + "Miscellaneous,Dark"
            } else {
                resultingURL = baseURL + "Miscellaneous"
            }
        }
    }
    
    @IBAction func DarkCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            DarkCategory.isSelected = false
            if ProgrammingCategory.isSelected == true  && MiscellaneousCategory.isSelected == true {
                resultingURL = baseURL + "Programming,Miscellaneous"
            } else if MiscellaneousCategory.isSelected == false {
                resultingURL = baseURL + "Programming"
            }
            
        } else {
            sender.isSelected = true
            
            if ProgrammingCategory.isSelected == true && MiscellaneousCategory.isSelected == true {
                resultingURL = baseURL + "Programming,Miscellaneous,Dark"
            } else if ProgrammingCategory.isSelected == true && MiscellaneousCategory.isSelected == false {
                resultingURL = baseURL + "Programming,Dark"
            } else if MiscellaneousCategory.isSelected == true && ProgrammingCategory.isSelected == false {
                resultingURL = baseURL + "Miscellaneous,Dark"
            } else {
                resultingURL = baseURL + "Dark"
            }
        }
    }
    
    @IBAction func NsfwFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func ReligiousFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func PoliticalFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func RacistFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func SexistFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func SingleJokeType(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
        if sender.isSelected == false {
            TwopartJokeType.isSelected = true
        }
    }
    
    @IBAction func TwopartJokeType(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
        if sender.isSelected == false {
            SingleJokeType.isSelected = true
        }
    }
    
    @IBAction func SearchJoke(_ sender: UIButton) {
        
        let responseVC = self.storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewController
        
        responseVC.apiUrl = resultingURL
           
        self.navigationController?.pushViewController(responseVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchStringTextfield.resignFirstResponder()
    }
    
    func appendCategory(key: String) -> String {
        var result = ""
        if(key == "category") {
            switch key {
            case "Programming":
                result = baseURL + "Programming"
            case "Miscellaneous":
                result = baseURL + "Miscellaneous"
            case "Dark":
                result = baseURL + "Dark"
            default:
                result = baseURL + "Programming"
            }
        }
        return result
    }
    
    func appendUrl(key: String, value: String) -> String{
        var result = ""
        
        if(key == "category") {
            switch key {
            case "Programming":
                result = baseURL + value
            case "Miscellaneous":
                result = baseURL + value
            case "Dark":
                result = baseURL + value
            default:
                result = baseURL + value
            }
        }
        return result
    }
}

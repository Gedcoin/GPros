//
//  ViewController.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/14.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var AnyCategoryButton: UIButton!
    @IBOutlet var CustomCategoryButton: UIButton!
    @IBOutlet var ProgrammingCategory: UIButton!
    @IBOutlet var MiscellaneousCategory: UIButton!
    @IBOutlet var DarkCategory: UIButton!
    
    @IBOutlet var SingleJokeType: UIButton!
    @IBOutlet var TwopartJokeType: UIButton!
    
    @IBOutlet var NsfwFlag: UIButton!
    @IBOutlet var ReligiousFlag: UIButton!
    @IBOutlet var PoliticalFlag: UIButton!
    @IBOutlet var RacistFlag: UIButton!
    @IBOutlet var SexistFlag: UIButton!
    
    @IBOutlet var SearchStringTextfield: UITextField!
    
    var baseURL: String = "https://sv443.net/jokeapi/v2/joke/"
    var resultingURL: String = ""
    let appendChar: String = "?"
    let appendFlag: String = "blacklistFlags="
    let appendType: String = "type="
    let appendTypeChar: String = "&"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnyCategoryButton.isSelected = true
        ProgrammingCategory.isEnabled = false
        MiscellaneousCategory.isEnabled = false
        DarkCategory.isEnabled = false
        
        SingleJokeType.isSelected = true
        TwopartJokeType.isSelected = true
    }

    @IBAction func AnyCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            CustomCategoryButton.isSelected = false
        } else {
            sender.isSelected = true
            CustomCategoryButton.isSelected = false
            
            AnyCategoryButton.isSelected = true
            resultingURL = baseURL + "Any"
            
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
            programmingCategoryDeselected()
        } else {
            sender.isSelected = true
            
            ProgrammingCategory.isSelected = true
            programmingCategorySelected()
        }
    }
    
    @IBAction func MiscellaneousCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            MiscellaneousCategory.isSelected = false
            miscellaneousCategoryDeselected()
        } else {
            sender.isSelected = true
            
            MiscellaneousCategory.isSelected = true
            miscellaneousCategorySelected()
        }
    }
    
    @IBAction func DarkCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            DarkCategory.isSelected = false
            darkCategoryDeselected()
        } else {
            sender.isSelected = true
            
            DarkCategory.isSelected = true
            darkCategorySelected()
        }
    }
    
    @IBAction func NsfwFlag(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            NsfwFlag.isSelected = false
        } else {
            sender.isSelected = true
            
            NsfwFlag.isSelected = true
            flagSelected(key: "nsfw")
        }
    }
    
    @IBAction func ReligiousFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            ReligiousFlag.isSelected = false
        } else {
            sender.isSelected = true
            
            ReligiousFlag.isSelected = true
            flagSelected(key: "religious")
        }
    }
    
    @IBAction func PoliticalFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            PoliticalFlag.isSelected = false
        } else {
            sender.isSelected = true
            
            PoliticalFlag.isSelected = true
            flagSelected(key: "political")
        }
    }
    
    @IBAction func RacistFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            RacistFlag.isSelected = false
        } else {
            sender.isSelected = true
            
            RacistFlag.isSelected = true
            flagSelected(key: "racist")
        }
    }
    
    @IBAction func SexistFlag(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            SexistFlag.isSelected = false
        } else {
            sender.isSelected = true
            
            SexistFlag.isSelected = true
            flagSelected(key: "sexist")
        }
    }
    
    @IBAction func SingleJokeType(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            SingleJokeType.isSelected = false
        } else {
            sender.isSelected = true
            
            SingleJokeType.isSelected = true
            jokeTypeSelected(key: "single")
        }
        
        if sender.isSelected == false {
            TwopartJokeType.isSelected = true
        }
    }
    
    @IBAction func TwopartJokeType(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
            
            TwopartJokeType.isSelected = false
        } else {
            sender.isSelected = true
            
            TwopartJokeType.isSelected = true
            jokeTypeSelected(key: "twopart")
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
    
    func programmingCategorySelected() {
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
    
    func programmingCategoryDeselected() {
        if MiscellaneousCategory.isSelected == true && DarkCategory.isSelected == true {
            resultingURL = baseURL + "Miscellaneous,Dark"
        } else if DarkCategory.isSelected == false {
            resultingURL = baseURL + "Programming"
        }
    }
    
    func miscellaneousCategorySelected() {
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
    
    func miscellaneousCategoryDeselected() {
        if ProgrammingCategory.isSelected == true && DarkCategory.isSelected == true {
            resultingURL = baseURL + "Programming,Dark"
        } else if DarkCategory.isSelected == false {
            resultingURL = baseURL + "Programming"
        }
    }
    
    func darkCategorySelected() {
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
    
    func darkCategoryDeselected() {
        if ProgrammingCategory.isSelected == true && MiscellaneousCategory.isSelected == true {
            resultingURL = baseURL + "Programming,Miscellaneous"
        } else if MiscellaneousCategory.isSelected == false {
            resultingURL = baseURL + "Programming"
        }
    }
    
    func flagSelected(key: String) {
        switch key {
        case "nsfw":
            if ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "nsfw"
            } else {
                resultingURL = resultingURL + ",nsfw"
            }
        case "religious":
            if NsfwFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "religious"
            } else {
                resultingURL = resultingURL + ",religious"
            }
        case "political":
            if NsfwFlag.isSelected == false && ReligiousFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "political"
            } else {
                resultingURL = resultingURL + ",political"
            }
        case "racist":
            if NsfwFlag.isSelected == false && ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "racist"
            } else {
                resultingURL = resultingURL + ",racist"
            }
        case "sexist":
            if NsfwFlag.isSelected == false && ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "sexist"
            } else {
                resultingURL = resultingURL + ",sexist"
            }
        default:
            if ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendFlag + "nsfw"
            } else {
                resultingURL = resultingURL + "nsfw"
            }
        }
    }
    
    func jokeTypeSelected(key: String) {
        if key == "single" {
            if NsfwFlag.isSelected == true && ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendType + key
            } else {
                resultingURL = resultingURL + appendTypeChar + appendType + key
            }
        } else {
            if NsfwFlag.isSelected == true && ReligiousFlag.isSelected == false && PoliticalFlag.isSelected == false && RacistFlag.isSelected == false && SexistFlag.isSelected == false {
                programmingCategorySelected()
                miscellaneousCategorySelected()
                darkCategorySelected()
                resultingURL = resultingURL + appendChar + appendType + key
            } else {
                resultingURL = resultingURL + appendTypeChar + appendType + key
            }
        }
    }
    
}

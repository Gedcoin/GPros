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
    @IBOutlet var SearchStringTextfield: UITextField!
    
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
            MiscellaneousCategory.isEnabled = true
            DarkCategory.isEnabled = true
        }
    }
    
    @IBAction func ProgrammingCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func MiscellaneousCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func DarkCategory(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
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
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchStringTextfield.resignFirstResponder()
    }
}


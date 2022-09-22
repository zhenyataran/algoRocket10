//
//  ViewController.swift
//  algoRocket
//
//  Created by Евгений Таран on 22.09.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let str = compress("abcaaaaaaaaaaaaaaaaaabbc")
        let str2 = compress2("abcaaaaaaaaaaaaaaaaaabbc")
        let str3 = compress("ab")
        let str4 = compress2("ab")
        print(str)
        print(str2)
        print(str3)
        print(str4)
    }
    
    
    func compress2(_ string: String) -> String {
        var lastSavedCharacter = string.first!
        var counter = 0
        var resultString = ""
        
        string.forEach { character in
            if lastSavedCharacter == character {
                counter += 1
            } else {
                resultString += "\(lastSavedCharacter)\(counter)"
                counter = 1
                lastSavedCharacter = character
            }
        }
        
        if counter != 0 {
            resultString += "\(lastSavedCharacter)\(counter)"
        }
        
        if resultString.count > string.count {
            return string
        } else {
            return resultString
        }
    }

    func compress(_ string: String) -> String {
        var resultString = ""
        var lastSavedCharacter: String = ""
        var counter = 1
        
        string.forEach { character in
            if character.description == lastSavedCharacter {
                counter += 1
            } else {
                lastSavedCharacter = character.description
                if counter > 1 {
                    resultString.removeLast()
                    save(&resultString, with: "", counter: counter)
                    counter = 1
                    save(&resultString, with: character.description, counter: counter)
                } else {
                    save(&resultString, with: character.description, counter: counter)
                }
            }
        }
        
        if resultString.count > string.count {
            return string
        } else {
            return resultString
        }
    }
    
    func save(_ string: inout String, with char: String, counter: Int) {
        string.append(char)
        string.append("\(counter)")
    }
}


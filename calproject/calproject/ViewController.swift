//
//  ViewController.swift
//  calproject
//
//  Created by Smallwood, Trejon (S&T-Student) on 7/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculate: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var workings: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
        {
            workings = ""
            calculate.text = ""
            resultLabel.text = ""
        }
    func addToWorkings(value: String)
        {
            workings = workings + value
            calculate.text = workings
        }
    
    @IBAction func equal(_ sender: Any) {
        if(validInput())
                {
                    let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                    let expression = NSExpression(format: checkedWorkingsForPercent)
                    let result = expression.expressionValue(with: nil, context: nil) as! Double
                    let resultString = formatResult(result: result)
                    resultLabel.text = resultString
                }
                else
                {
                    let alert = UIAlertController(
                        title: "Invalid Input",
                        message: "Calculator unable to do math based on input",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
    }
    
    func validInput() ->Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            
            for char in workings
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == workings.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
    
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        
        }
        
    }
    
    @IBAction func allclear(_ sender: UIButton) {
        clearAll()
    }
    
   
    @IBAction func backspace(_ sender: Any) {
    }
    
    @IBAction func percent(_ sender: UIButton) {
    }
    @IBAction func divide(_ sender: Any) {
    }
    
    @IBAction func multiply(_ sender: Any) {
    }
    
    @IBAction func minus(_ sender: Any) {
    }
    
    @IBAction func plus(_ sender: Any) {
    }
    
     
    @IBAction func zero(_ sender: Any) {
    }
    
    @IBAction func one(_ sender: Any) {
    }
    
    @IBAction func two(_ sender: Any) {
    }
    
    @IBAction func three(_ sender: Any) {
    }
    @IBAction func four(_ sender: Any) {
    }
    @IBAction func five(_ sender: Any) {
    }
    
    @IBAction func six(_ sender: Any) {
    }
    
    @IBAction func seven(_ sender: Any) {
    }
    @IBAction func eight(_ sender: Any) {
    }
    
    @IBAction func nine(_ sender: Any) {
    }
}


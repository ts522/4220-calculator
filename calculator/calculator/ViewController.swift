//
//  ViewController.swift
//  calculator
//
//  Created by Smallwood, Trejon (S&T-Student) on 7/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var holder: UIView!
    
    var firstNum = 0
    var resultNum = 0
    var currentOperations: Op?
    
    enum Op {
    case add
    case subtract
    case multiply
    case divide
    
    }
    private var result: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Arial", size: 60)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumberPad()
    }
    private func setupNumberPad(){
        let buttonSize: CGFloat = view.frame.size.width / 4
        
        let zeroB = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height-buttonSize, width: buttonSize*3, height: buttonSize))
        zeroB.setTitleColor(.black, for: .normal)
        zeroB.backgroundColor = .white
        zeroB.setTitle("0", for: .normal)
        holder.addSubview(zeroB)
        zeroB.tag = 1
        zeroB.addTarget(self, action: #selector(numPresed(_:)), for: .touchUpInside)
        
        for x in 0..<3 {
            let xB = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            xB.setTitleColor(.black, for: .normal)
            xB.backgroundColor = .white
            xB.setTitle("\(x+1)", for: .normal)
            holder.addSubview(xB)
            xB.tag = x+2
            xB.addTarget(self, action: #selector(numPresed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3{
            let yB = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            yB.setTitleColor(.black, for: .normal)
            yB.backgroundColor = .white
            yB.setTitle("\(x+4)", for: .normal)
            holder.addSubview(yB)
            yB.tag = x+5
            yB.addTarget(self, action: #selector(numPresed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3{
            let zB = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            zB.setTitleColor(.black, for: .normal)
            zB.backgroundColor = .white
            zB.setTitle("\(x+7)", for: .normal)
            holder.addSubview(zB)
            zB.tag = x+8
            zB.addTarget(self, action: #selector(numPresed(_:)), for: .touchUpInside)
        }
        
        let clearB = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height-(buttonSize*5), width: holder.frame.size.width - buttonSize, height: buttonSize))
        clearB.setTitleColor(.black, for: .normal)
        clearB.backgroundColor = .white
        clearB.setTitle("Clear All", for: .normal)
        holder.addSubview(clearB)
        
        let operation = ["=","+","-","*","/"]
        
        for x in 0..<5{
            let oB = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height-(buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
            oB.setTitleColor(.black, for: .normal)
            oB.backgroundColor = .red
            oB.setTitle(operation[x], for: .normal)
            holder.addSubview(oB)
            oB.addTarget(self, action: #selector(opPresed(_:)), for: .touchUpInside)
            oB.tag = x+1
        }
        result.frame = CGRect(x: -10, y: clearB.frame.origin.y - 105.0, width: view.frame.size.width, height: 100)
        holder.addSubview(result)
        
        clearB.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
    }
    
    @objc func clearResult(){
        result.text = "0"
    }
    
    @objc func numPresed(_ sender: UIButton){
        let tag = sender.tag - 1
        if result.text == "0" {
            result.text = "\(tag)"
        }
        else if let text  = result.text {
            result.text = "\(text)\(tag)"
        }
    }
    
    @objc func opPresed(_ sender: UIButton){
        let tag = sender.tag
        
        if let text = result.text, let val = Int(text), firstNum == 0 {
            firstNum = val
            result.text = "0"
        }
        if tag == 1 {
            if let operation = currentOperations {
                var secondNum = 0
                if let text = result.text, let val = Int(text){
                    secondNum = val
                }
                
                switch operation{
                case .add:
                    let r = firstNum + secondNum
                    result.text = "\(result)"
                    break
                case .subtract:
                    let r = firstNum - secondNum
                    result.text = "\(result)"
                    break
                case .multiply:
                    let r = firstNum * secondNum
                    result.text = "\(result)"
                    break
                case .divide:
                    let r = firstNum / secondNum
                    result.text = "\(result)"
                    break
                default:
                    break
                }
            }
        }
        else if tag == 2{
            currentOperations = .add
            
        }
        else if tag == 3{
            currentOperations = .subtract
        }
        else if tag == 4{
            currentOperations = .multiply
        }
        else if tag == 5{
            currentOperations = .divide
        }
    }
}


//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var lblInput: UILabel!
    
    var working = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func ClearAll(){
        
        lblInput.text = ""
        lblOutput.text = ""
        working = ""
    }
    
    func addToWorking(value:String){
        
        working = working + value
        lblInput.text = working
    }
    func formateResult(result:Double) -> String{
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool{
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working{
            if specialCharacter(Char: char){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var privious:Int = -1
        for index in funcCharIndexes {
            
            if (index == 0){
                return false
            }
            if index == working.count - 1{
                return false
            }
            if (privious != -1){
                if (index - privious == 1){
                    return false
                }
            }
            privious = index
        }
        
        return true
    }
    
    func specialCharacter(Char:Character) -> Bool{
        
        if (Char == "*"){
            return true
        }
        else if (Char == "/"){
            return true
        }else if (Char == "-"){
            return true
        }else if (Char == "+"){
            return true
        }else{
            return false
        }
    }

    @IBAction func btnEqual(_ sender: UIButton) {
        
        if validInput(){
            let checkedWorkingForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formateResult(result: result)
            lblOutput.text = resultString
        }else{
            let alert =  UIAlertController(title: "Invalid Input", message: "Please Enter Valid Input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okey", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
       
       
        
    }
   
    @IBAction func btnDivision(_ sender: UIButton) {
        addToWorking(value: "/")
    }
    @IBAction func btnClear(_ sender: UIButton) {
        ClearAll()
    }
    @IBAction func btnPlus(_ sender: UIButton) {
        addToWorking(value: "+")
    }
    @IBAction func btnMinus(_ sender: Any) {
        addToWorking(value: "-")
    }
    @IBAction func btnMultiply(_ sender: UIButton) {
        addToWorking(value: "*")
    }
    @IBAction func btnBeck(_ sender: UIButton) {
        
        if (!working.isEmpty){
            working.removeLast()
            lblInput.text = working
        }
    }
    @IBAction func btnModulo(_ sender: UIButton) {
        addToWorking(value: "%")
    }
    
    @IBAction func btnNineTap(_ sender: UIButton) {
        addToWorking(value: "9")
    }
    @IBAction func btnEightTap(_ sender: UIButton) {
        addToWorking(value: "8")
    }
    @IBAction func btnSevenTap(_ sender: UIButton) {
        addToWorking(value: "7")
    }
    @IBAction func btnSixTap(_ sender: UIButton) {
        addToWorking(value: "6")
    }
    
    @IBAction func btnFiveTap(_ sender: UIButton) {
        addToWorking(value: "5")
    }
    @IBAction func btnDot(_ sender: UIButton) {
        addToWorking(value: ".")
    }
    @IBAction func btnTwoTap(_ sender: UIButton) {
        addToWorking(value: "2")
    }
    
    @IBAction func btnFourTap(_ sender: UIButton) {
        addToWorking(value: "4")
    }
    @IBAction func btnThreeTap(_ sender: UIButton) {
        addToWorking(value: "3")
    }
    @IBAction func btnOneTap(_ sender: UIButton) {
        addToWorking(value: "1")
    }
    @IBAction func btnZeroTap(_ sender: UIButton) {
        addToWorking(value: "0")
    }
}


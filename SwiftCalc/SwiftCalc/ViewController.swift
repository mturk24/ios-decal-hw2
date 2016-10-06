//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/20/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Width and Height of Screen for Layout
    var w: CGFloat!
    var h: CGFloat!
    

    // IMPORTANT: Do NOT modify the name or class of resultLabel.
    //            We will be using the result label to run autograded tests.
    // MARK: The label to display our calculations
    var resultLabel = UILabel()
    
    // TODO: This looks like a good place to add some data structures.
    //       One data structure is initialized below for reference.
    var someDataStructure: [String] = [""]
    
    var num1: Int?
    var num2: Int?
    var result: Int = 0
    var doubResult: Double = 0
    var strResult: String = ""
    var plusMinus: Bool = true
    var myBool: Bool = true
    var boolInt: Int = 0
    var numBool: Int = 0
    var operation = ""
    var doub: Double = 0.0
    var doub1: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Calculator"
        // IMPORTANT: Do NOT modify the accessibilityValue of resultLabel.
        //            We will be using the result label to run autograded tests.
        resultLabel.accessibilityValue = "resultLabel"
        makeButtons()
        // Do any additional setup here.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: A method to update your data structure(s) would be nice.
    //       Modify this one or create your own.
    func updateSomeDataStructure(_ content: String) {
        print("Update me like one of those PCs")
    }
    
    // TODO: Ensure that resultLabel gets updated.
    //       Modify this one or create your own.
    func updateResultLabel(_ content: String) {
        print("Update me like one of those PCs")
        if (content.characters.count <= 7) {
            resultLabel.text = content
        }
        
    }
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if ((textField.text!.characters.count) > maxLength) {
            textField.deleteBackward()
        }
    }
    
    
    
    // TODO: A calculate method with no parameters, scary!
    //       Modify this one or create your own.
    func calculate() -> String {
        return "0"
    }
    
    // TODO: A simple calculate method for integers.
    //       Modify this one or create your own.
    func intCalculate(a: Int, b:Int, operation: String) -> Int {
        print("Calculation requested for \(a) \(operation) \(b)")
        num1 = a
        num2 = b
        if  operation == "+" {
//            resultLabel.text = String(describing: num1 += num2)
            result = num1! + num2!
            return result
        } else if operation == "-" {
//            resultLabel.text = String(describing: num1 -= num2)
            result = num1! - num2!
            return result
        } else if operation == "*" {
//            resultLabel.text = String(describing: num1 *= num2)
            result = num1! * num2!
            return result
        } else if operation == "/" {
//            resultLabel.text = String(describing: num1 /= num2)
            result =  num1! / num2!
            return result
        }
        
        return result
    }
    func doubleCalculate(a: Double, b:Double, operation: String) -> Double {
        print("Calculation requested for \(a) \(operation) \(b)")
        doub = a
        doub1 = b
        if  operation == "+" {
            //            resultLabel.text = String(describing: num1 += num2)
            result = num1! + num2!
            return Double(result)
        } else if operation == "-" {
            //            resultLabel.text = String(describing: num1 -= num2)
            result = num1! - num2!
            return Double(result)
        } else if operation == "*" {
            //            resultLabel.text = String(describing: num1 *= num2)
            result = num1! * num2!
            return Double(result)
        } else if operation == "/" {
            //            resultLabel.text = String(describing: num1 /= num2)
            result =  num1! / num2!
            return Double(result)
        }
        
        return Double(result)
    }

    
    // TODO: A general calculate method for doubles
    //       Modify this one or create your own.
    func calculate(a: String, b:String, operation: String) -> Double {
        print("Calculation requested for \(a) \(operation) \(b)")
        return 0.0
    }
    
    // REQUIRED: The responder to a number button being pressed.
    func numberPressed(_ sender: CustomButton) {
        guard Int(sender.content) != nil else { return }
        print("The number \(sender.content) was pressed")
        if strResult.range(of: ".") != nil{
            strResult = strResult + sender.content
            resultLabel.text = strResult
        }
//        let num = sender.content
//        if (myBool == true) {
//            updateResultLabel(resultLabel.text! + num)
//        } else {
//            updateResultLabel(num)
//            myBool = true
//        }
        someDataStructure.append(sender.content)
//        if (numBool == 2) {
//            numBool = 0
//        }
//        if (numBool == 0) {
//            numBool = 1
//            num1 = Int(sender.content)!
//        } else if (numBool == 1){
//           numBool = 2
//            num2 = Int(sender.content)!
//        }
        resultLabel.text = (sender.content)
//        result = Int(sender.content)!
    }
    
    // REQUIRED: The responder to an operator button being pressed.
    func operatorPressed(_ sender: CustomButton) {
        if (sender.content == "+") {
            boolInt = 1
            someDataStructure.append(sender.content)
//            result = intCalculate(a: num1, b: num2, operation: "+")
        } else if (sender.content == "-") {
            boolInt = 2
            someDataStructure.append(sender.content)
        } else if (sender.content == "*") {
            boolInt = 3
            someDataStructure.append(sender.content)
        } else if (sender.content == "/") {
            boolInt = 4
            someDataStructure.append(sender.content)
        }
        if (sender.content == "C") {
            resultLabel.text = String(calculate())
            result = 0
            
        }
        if (sender.content == ".") {
            strResult = String(result) + "."
            resultLabel.text = strResult
        }
        if (sender.content == "+/-" && plusMinus == true) {
            resultLabel.text = String(result * -1)
            plusMinus = false
        } else if (sender.content == "+/-" && plusMinus == false) {
            resultLabel.text = String(result * 1)
            plusMinus = true
        }
        if (sender.content == "=") {
            
            for index in 0...(someDataStructure.count - 1) {
                if (someDataStructure[index] == "+" && boolInt == 2) {
                    result = result + intCalculate(a: num1!, b: num2!, operation: "+")
                    resultLabel.text = String(result)
                } else if (someDataStructure[index] == "-" && boolInt == 2) {
                    result = result + intCalculate(a: num1!, b: num2!, operation: "-")
                    resultLabel.text = String(result)
                } else if (someDataStructure[index] == "*" && boolInt == 2) {
                    result = result + intCalculate(a: num1!, b: num2!, operation: "*")
                    resultLabel.text = String(result)
                } else if (someDataStructure[index] == "/" && boolInt == 2) {
                    
                    if floor(doub) != doub {
                        doubResult = doubResult + doubleCalculate(a: doub, b: doub1, operation: "/")
                        resultLabel.text = String(doubResult)
                    } else {
                        result = result + Int(doubleCalculate(a: doub, b: doub1, operation: "/"))
                        resultLabel.text = String(result)
                    }
                    result = result + intCalculate(a: num1!, b: num2!, operation: "/")
                    resultLabel.text = String(result)
                } else {
                    if (boolInt == 2) {
                        boolInt = 0
                    }
                    if (myBool == true) {
                        if someDataStructure[index].range(of: ".") != nil {
                            doub = Double(someDataStructure[index])!
                            myBool = false
                            boolInt = 1
                        } else {
                           num1 = Int(someDataStructure[index])!
                            myBool = false
                            boolInt = 1
                        }
                    } else {
                        if someDataStructure[index].range(of: ".") != nil {
                            doub1 = Double(someDataStructure[index])!
                            myBool = true
                            boolInt = 2
                        } else {
                            num2 = Int(someDataStructure[index])!
                            myBool = true
                            boolInt = 2
                        }
                        
                    }
                    
                }
            }
        }
    }
    
        
            
            
        
//        if (sender.content == "=" && numBool == 2 && boolInt == 1) {
//            result = intCalculate(a: num1, b: num2, operation: "+")
//            resultLabel.text = String(result)
//        }
//        if (sender.content == "=" && numBool == 2 && boolInt == 2) {
//            result = intCalculate(a: num1, b: num2, operation: "-")
//            resultLabel.text = String(result)
//        }
//        if (sender.content == "=" && numBool == 2 && boolInt == 3) {
//            result = intCalculate(a: num1, b: num2, operation: "*")
//            resultLabel.text = String(result)
//        }
//        if (sender.content == "=" && numBool == 2 && boolInt == 4) {
//            result = intCalculate(a: num1, b: num2, operation: "/")
//            resultLabel.text = String(result)
//        }
        
    
    // REQUIRED: The responder to a number or operator button being pressed.
    func buttonPressed(_ sender: CustomButton) {
        
//        if (sender.content == "+") {
//            result = intCalculate(a: num1, b: num2, operation: "+")
//        } else if (sender.content == "-") {
//            result = intCalculate(a: num1, b: num2, operation: "-")
//        } else if (sender.content == "*") {
//            result = intCalculate(a: num1, b: num2, operation: "*")
//        } else if (sender.content == "/") {
//            result = intCalculate(a: num1, b: num2, operation: "/")
//        } else if (sender.content == "C") {
//            resultLabel.text = String(calculate())
//            result = 0
//        }
//        if (sender.content == "=") {
//            updateResultLabel(String(result))
//        }
        
       
    }
    
    // IMPORTANT: Do NOT change any of the code below.
    //            We will be using these buttons to run autograded tests.
    
    func makeButtons() {
        // MARK: Adds buttons
        let digits = (1..<10).map({
            return String($0)
        })
        let operators = ["/", "*", "-", "+", "="]
        let others = ["C", "+/-", "%"]
        let special = ["0", "."]
        
        let displayContainer = UIView()
        view.addUIElement(displayContainer, frame: CGRect(x: 0, y: 0, width: w, height: 160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }
        displayContainer.addUIElement(resultLabel, text: "0", frame: CGRect(x: 70, y: 70, width: w-70, height: 90)) {
            element in
            guard let label = element as? UILabel else { return }
            label.textColor = UIColor.white
            label.font = UIFont(name: label.font.fontName, size: 60)
            label.textAlignment = NSTextAlignment.right
        }
        
        let calcContainer = UIView()
        view.addUIElement(calcContainer, frame: CGRect(x: 0, y: 160, width: w, height: h-160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }

        let margin: CGFloat = 1.0
        let buttonWidth: CGFloat = w / 4.0
        let buttonHeight: CGFloat = 100.0
        
        // MARK: Top Row
        for (i, el) in others.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Second Row 3x3
        for (i, digit) in digits.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: digit), text: digit,
            frame: CGRect(x: x, y: y+101.0, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
            }
        }
        // MARK: Vertical Column of Operators
        for (i, el) in operators.enumerated() {
            let x = (CGFloat(3) + 1.0) * margin + (CGFloat(3) * buttonWidth)
            let y = (CGFloat(i) + 1.0) * margin + (CGFloat(i) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.backgroundColor = UIColor.orange
                button.setTitleColor(UIColor.white, for: .normal)
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Last Row for big 0 and .
        for (i, el) in special.enumerated() {
            let myWidth = buttonWidth * (CGFloat((i+1)%2) + 1.0) + margin * (CGFloat((i+1)%2))
            let x = (CGFloat(2*i) + 1.0) * margin + buttonWidth * (CGFloat(i*2))
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: 405, width: myWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }
        }
    }

}


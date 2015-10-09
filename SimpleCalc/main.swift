//
//  main.swift
//  SimpleCalc
//
//  Created by Rachel Kipps on 10/8/15.
//  Copyright © 2015 Rachel Kipps. All rights reserved.
//

import Foundation


func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
        return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

// Fuction to calculate simple operations (addition, subtraction, multiplication, division, and modulus). Takes in 2 numbers and an operator in String form and returns the resultant integer of the operator and the two operands.
func simpleOperation(number1 : Int, op: String, number2: Int) -> Int {
    var result = 0
    switch op {
        case "+":
            result = number1 + number2
        case "-":
            result = number1 - number2
        case "*":
            result = number1 * number2
        case "/":
            result = number1 / number2
        case "%":
            result = number1 % number2
    default: break
    }
    return result
}

// Function to calculate complex operations (factorial, count, and average). Takes in an array of String input from the user and returns the resultant integer.
func complexOperation(inputArray: [String]) -> Int {
    var result = 0
    if inputArray.last! == "fact" { // Calculates factorial
        result = 1
        for var i = 1; i <= convert(inputArray[0]); i++ {
            result *= i
        }
    } else if inputArray.last! == "count" { // Calculates count
        result = inputArray.count - 1
    } else if inputArray.last! == "avg" { // Calculates average
        for var i = 0; i < inputArray.count - 1; i++ {
            result += convert(inputArray[i])
        }
        result = result/(inputArray.count - 1)
    }
    return result
}

print("Enter an expression separated by returns:")
var entry = input()
var inputArray = entry.componentsSeparatedByString(" ")
if inputArray.count > 1 {
    print("Result: \(complexOperation(inputArray))")
} else {
    var number1 = convert(entry)
    var op = input()
    var number2 = convert(input())
    print("Result: \(simpleOperation(number1, op: op, number2: number2))")
}





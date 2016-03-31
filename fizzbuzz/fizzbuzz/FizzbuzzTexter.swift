//
//  FizzbuzzTexter.swift
//  fizzbuzz
//
//  Created by Sergio on 20/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Cocoa

/*
Write a program that prints the numbers from 1 to 100. 
 - But for multiples of three print “Fizz” instead of the number
 - and for the multiples of five print “Buzz”.
 - For numbers which are multiples of both three and five print “FizzBuzz”.
*/

class FizzbuzzTexter: NSObject {
    
    func textForNumber(number: Int) -> String {
        var result = ""
        
        if (number % 3 == 0) {
            result = "Fizz"
        }
        if (number % 5 == 0) {
            result += "Buzz"
        }
        if (result.characters.count == 0) {
            result = "\(number)"
        }
        
        return result
    }

}

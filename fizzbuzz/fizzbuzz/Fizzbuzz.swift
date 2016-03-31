//
//  Fizzbuzz.swift
//  fizzbuzz
//
//  Created by Sergio on 20/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Cocoa

class Fizzbuzz: NSObject {
    let texter = FizzbuzzTexter()

    func run() {
        for i in 1...100 {
            let text = self.texter.textForNumber(i)
            print(text)
        }
    }
}

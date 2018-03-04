//
//  ViewController.swift
//  ABAutoLocalizable
//
//  Created by Alcivanio on 27/01/18.
//  Copyright © 2018 Alcivanio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadTexts()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //loadTexts()
    }

}








extension String {
    func capturedGroups(withRegex pattern: String) -> [String] {
        var results = [String]()
        
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            return results
        }
        
        let matches = regex.matches(in: self, options: [], range: NSRange(location:0, length: self.count))
        
        guard let match = matches.first else { return results }
        
        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return results }
        
        for i in 1...lastRangeIndex {
            let capturedGroupIndex = match.range(at: i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
    
    
    
    func teste()->[String] {
        let regex = try! NSRegularExpression(pattern:"[\\$][\\{](.*)[\\}]", options: [])
        let tmp = self as NSString
        var results = [String]()
        

        
        regex.enumerateMatches(in: self, options: [], range: NSMakeRange(0, self.count)) { result, flags, stop in
            if let range = result?.range(at: 1) {
                results.append(tmp.substring(with: range))
            }
        }
        
        return results
    }
}
























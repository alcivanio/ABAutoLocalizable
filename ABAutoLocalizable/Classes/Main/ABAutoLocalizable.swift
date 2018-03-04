//
//  ABAutoLocalizable.swift
//  ABAutoLocalizable
//
//  Created by Alcivanio on 04/03/18.
//  Copyright © 2018 Alcivanio. All rights reserved.
//

import UIKit

public class ABAutoLocalizable {
    public static let REGEX_KEY = "[\\$][\\{](.*)[\\}]"
    
    
    public static func initiate() {
        UIViewController.swizzleViewWillAppear()
    }
}


extension UIView {
    func loadTexts() {
        
        for subview in subviews {
            subview.loadTexts()
            
            if let subview = subview as? ABLocalizable,
            let localizableKey = subview.getCurrentText()?.capturedGroups(withRegex: ABAutoLocalizable.REGEX_KEY).first {
                subview.setLocalizedText(string: NSLocalizedString(localizableKey, comment: ""))
            }
        }
    }
}








extension UIViewController {
    
    fileprivate static func swizzleViewWillAppear() {
        if self !== UIViewController.self {
            return
        }
        
        
        let originalSelector = #selector(viewWillAppear(_:))
        let newSelector = #selector(nsh_viewWillAppear(_:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, newSelector)
        
        let didAdded = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAdded {
            class_replaceMethod(self, newSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(swizzledMethod!))
            
        }
        else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
    
    
    @objc func nsh_viewWillAppear(_ animated: Bool) {
        nsh_viewWillAppear(animated)
        
        if self is UINavigationController {
            DispatchQueue.main.async {
                self.view.loadTexts()
            }
        }
            
        else { self.view.loadTexts() }
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




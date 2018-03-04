//
//  ABLocalizableExtensions.swift
//  ABAutoLocalizable
//
//  Created by Alcivanio on 03/03/18.
//  Copyright © 2018 Alcivanio. All rights reserved.
//

import UIKit

extension UILabel: ABLocalizable {
    public func setLocalizedText(string: String) {
        self.text = string
    }
    
    
    public func getCurrentText()->String? {
        return self.text
    }
}



extension UITextField: ABLocalizable {
    public func setLocalizedText(string: String) {
        self.text = string
    }
    
    
    public func getCurrentText()->String? {
        return self.text
    }
}



extension UITextView: ABLocalizable {
    public func setLocalizedText(string: String) {
        self.text = string
    }
    
    
    public func getCurrentText()->String? {
        return self.text
    }
}



extension UIButton: ABLocalizable {
    public func setLocalizedText(string: String) {
        self.setTitle(string, for: .normal)
        self.setTitle(string, for: .highlighted)
        self.setTitle(string, for: .selected)
    }
    
    
    public func getCurrentText()->String? {
        return self.title(for: .normal)
    }
}



extension UIBarButtonItem: ABLocalizable {
    public func setLocalizedText(string: String) {
        self.title = string
    }
    
    
    public func getCurrentText()->String? {
        return self.title
    }
}








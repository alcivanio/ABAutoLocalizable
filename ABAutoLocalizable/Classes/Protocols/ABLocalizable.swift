//
//  ABLocalizable.swift
//  ABAutoLocalizable
//
//  Created by Alcivanio on 03/03/18.
//  Copyright © 2018 Alcivanio. All rights reserved.
//

import UIKit

public protocol ABLocalizable {
    func setLocalizedText(string: String)
    func getCurrentText()->String?
}


extension ABLocalizable {
    func loadTexts() {
        (self as? UIView)?.loadTexts()
    }
}


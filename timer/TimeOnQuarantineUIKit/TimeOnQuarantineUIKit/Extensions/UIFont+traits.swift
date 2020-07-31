//
//  UIFont+traits.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 31/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIFont {
    func with(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }
    
    var bold: UIFont {
        with(traits: .traitBold)
    }
    
    var italic: UIFont {
        with(traits: .traitItalic)
    }

}

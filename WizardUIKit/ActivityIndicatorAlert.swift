//
//  ActivityIndicatorAlert.swift
//  WizardUIKit
//
//  Created by Wei-Ting Lin on 11/19/16.
//  Copyright © 2016 Wei-Ting Lin. All rights reserved.
//

import UIKit

public struct WizardIndicatorAlert {
    public var cornerRadius: CGFloat
    public var backgroundColor : UIColor
    public var color: UIColor
    public var dimColor: UIColor
    
    public init() {
        self.cornerRadius    = 15
        self.color           = UIColor.WizardBlueColor()
        self.backgroundColor = .white
        self.dimColor        = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    public init(cornerRadius: CGFloat, backgroundColor: UIColor, color: UIColor, dimColor: UIColor) {
        self.cornerRadius    = cornerRadius
        self.backgroundColor = backgroundColor
        self.color           = color
        self.dimColor        = dimColor
    }
}

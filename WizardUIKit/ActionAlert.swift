/**********************************************************
 MIT License
 
 WizardUIKit
 
 Copyright (c) 2016 Wei-Ting Lin
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 ***********************************************************/

import UIKit

public struct WizardActionAlert {
    public var expandable: Bool
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    public var titleLabel: WizardLabel
    public var contentLabel: WizardLabel
    public var cancelButton: WizardButton?
    public var actionButton: WizardButton?
    public var animation: WizardAnimation
    
    init() {
        expandable          = false
        cornerRadius        = kDefaultAlertCornerRadius
        backgroundColor     = .white
        titleLabel   = WizardLabel(text: "Example", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold))
        contentLabel  = WizardLabel(text: "Example", textColor: .darkGray, textAlignment: .center, font: UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular))
        cancelButton = WizardButton(text: "Cancel", textColor: .darkGray, backgroundColor: .groupTableViewBackground, cornerRadius: 3)
        actionButton = WizardButton(text: "OK", textColor: .white, backgroundColor: UIColor.WizardGreenColor(), cornerRadius: 3)
        animation    = WizardAnimation(direction: .slideDown, duration: 0.5)
    }
    
    init(cornerRadius: CGFloat, expandable: Bool, backgroundColor: UIColor, titleLabel: WizardLabel, contentLabel: WizardLabel,cancelButton: WizardButton, actionButton: WizardButton, animation: WizardAnimation) {
        self.expandable       = expandable
        self.cornerRadius     = cornerRadius
        self.backgroundColor  = backgroundColor
        self.titleLabel       = titleLabel
        self.contentLabel     = contentLabel
        self.cancelButton     = cancelButton
        self.actionButton     = actionButton
        self.animation        = animation
    }
}


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

public struct WizardImageActionAlert {
    public var image: UIImage
    public var backgroundColor: UIColor
    public var cornerRadius: CGFloat
    public var expandable: Bool
    public var contentLabel: WizardLabel
    public var actionButton: WizardButton
    public var animation: WizardAnimation
    
    init() {
        image               = UIImage()
        cornerRadius        = kDefaultAlertCornerRadius
        expandable          = true
        backgroundColor     = .white
        contentLabel = WizardLabel(text: "write something here...", textColor: .black, textAlignment: .center, font: UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular))
        actionButton = WizardButton(text: "Action", textColor: .white, backgroundColor: UIColor.WizardBlueColor(), cornerRadius: 3)
        animation    = WizardAnimation(direction: .fadeIn, duration: 0.3)
    }
    
    init(image: UIImage, cornerRadius: CGFloat, backgroundColor: UIColor, expandable: Bool, contentLabel: WizardLabel, actionButton: WizardButton, animation: WizardAnimation) {
        self.image           = image
        self.cornerRadius    = cornerRadius
        self.backgroundColor = backgroundColor
        self.expandable      = expandable
        self.contentLabel    = contentLabel
        self.actionButton    = actionButton
        self.animation       = animation
    }
}

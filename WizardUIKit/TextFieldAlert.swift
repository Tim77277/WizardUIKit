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

public struct WizardTextFieldAlert {
    public var expandable: Bool
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    public var keyboardType: UIKeyboardType
    public var titleLabel: WizardLabel
    public var textField: WizardTextField
    public var button: WizardButton
    public var animation: WizardAnimation
    
    public init() {
        backgroundColor = .white
        cornerRadius    = kDefaultAlertCornerRadius
        expandable      = false
        keyboardType    = .default
        titleLabel      = WizardLabel(text: "Title", textColor: .black, font: UIFont.boldSystemFont(ofSize: 18))
        textField       = WizardTextField(placeholder: "Enter something..", textColor: .black, backgroundColor: .groupTableViewBackground, cornerRadius: 3, font: UIFont.systemFont(ofSize: 14))
        button          = WizardButton(text: "Done", textColor: .white, backgroundColor: UIColor.WizardBlueColor(), cornerRadius: 3)
        animation       = WizardAnimation(direction: .slideUp, duration: 0.5)
    }
    
    public init(expandable: Bool, cornerRadius: CGFloat, backgroundColor: UIColor, keyboardType: UIKeyboardType, titleLabel: WizardLabel, textField: WizardTextField, button: WizardButton, animation: WizardAnimation) {
        //Variables
        self.expandable        = expandable
        self.cornerRadius      = cornerRadius
        self.backgroundColor   = backgroundColor
        self.keyboardType      = keyboardType
        
        //Options
        self.titleLabel        = titleLabel
        self.textField         = textField
        self.button            = button
        self.animation         = animation
    }
}

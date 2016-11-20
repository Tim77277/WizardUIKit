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

public struct WizardNamePickerAlert {
    public var pickerTextColor: UIColor
    public var backgroundColor: UIColor
    public var titleLabel: WizardLabel
    public var doneButton: WizardButton
    public var animation: WizardAnimation
    
    init() {
        pickerTextColor = .black
        backgroundColor = .white
        titleLabel   = WizardLabel(text: "Title", textColor: .black, font: UIFont.boldSystemFont(ofSize: 18))
        doneButton   = WizardButton(text: "Done", textColor: UIColor.WizardBlueColor(), backgroundColor: .clear, cornerRadius: 0)
        animation    = WizardAnimation(direction: .slideUp, duration: 0.3)
    }
    
    init(pickerTextColor: UIColor, backgroundColor: UIColor, titleLabel: WizardLabel, doneButton: WizardButton, animation: WizardAnimation) {
        self.titleLabel          = titleLabel
        self.doneButton          = doneButton
        self.animation           = animation
        self.pickerTextColor     = pickerTextColor
        self.backgroundColor     = backgroundColor
    }
}

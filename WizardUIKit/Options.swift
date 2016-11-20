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

let kAlertTextMinimumHeight: CGFloat   = 185.0
let kDefaultAlertCornerRadius: CGFloat = 5
let kWizardBundle = Bundle(for: Wizard.self)

public enum AnimateDirection {
    case slideUp
    case slideDown
    case fadeIn
}

public enum IndicatorStyle {
    case white
    case black
}

public struct WizardDatePicker {
    public var mode: UIDatePickerMode!
    public var textColor: UIColor
    public var defaultDate: Date!
    public var locale: Locale?
    public var minimumDate: Date?
    public var maximumDate: Date?
    
    init() {
        self.mode        = UIDatePickerMode.date
        self.defaultDate = Date()
        self.textColor   = .black
    }
    
    public init(mode: UIDatePickerMode, textColor: UIColor, defaultDate: Date, locale: Locale, minimumDate: Date?, maximumDate: Date?) {
        self.mode   = mode
        self.locale = locale
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.defaultDate = defaultDate
        self.textColor   = textColor
    }
}

public struct WizardProgressBar {
    public var progressColor: UIColor
    public var trackColor: UIColor
    public var cornerRadius: CGFloat
    
    init() {
        self.progressColor = UIColor.WizardBlueColor()
        self.trackColor = UIColor.groupTableViewBackground
        self.cornerRadius = 3
    }
    
    public init(progressColor: UIColor, trackColor: UIColor, cornerRadius: CGFloat) {
        self.progressColor = progressColor
        self.trackColor    = trackColor
        self.cornerRadius  = cornerRadius
    }
}

public struct WizardAnimation {
    public var direction: AnimateDirection
    public var duration: TimeInterval
    
    init() {
        direction = .fadeIn
        duration  = 0.3
    }
    
    public init(direction: AnimateDirection, duration: TimeInterval) {
        self.direction = direction
        self.duration  = duration
    }
}

public struct WizardStatus {
    public var image: UIImage
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    public var titleLabel: WizardLabel
    public var contentLabel: WizardLabel
    public var button: WizardButton
    
    public init (image: UIImage = UIImage(), cornerRadius: CGFloat = kDefaultAlertCornerRadius, backgroundColor: UIColor = .white, titleLabel: WizardLabel, contentLabel: WizardLabel, button: WizardButton) {
        self.image           = image
        self.cornerRadius    = cornerRadius
        self.backgroundColor = backgroundColor
        self.titleLabel      = titleLabel
        self.contentLabel    = contentLabel
        self.button          = button
    }
}

public struct WizardLabel {
    public var text: String
    public var textColor: UIColor
    public var textAlignment: NSTextAlignment
    public var font: UIFont
    
    init() {
        text = "--"
        textColor = .black
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 18)
    }
    
    public init(text: String, textColor: UIColor, textAlignment: NSTextAlignment = .left, font: UIFont) {
        self.text      = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font      = font
    }
}

public struct WizardTextField {
    public var font: UIFont
    public var textColor: UIColor
    public var placeholder: String
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    
    public init(placeholder: String, textColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, font: UIFont) {
        self.font            = font
        self.textColor       = textColor
        self.placeholder     = placeholder
        self.backgroundColor = backgroundColor
        self.cornerRadius    = cornerRadius
    }
}

public struct TextViewOptions {
    public var font: UIFont
    public var text: String
    public var textColor: UIColor
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    
    public init(text: String, textColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, font: UIFont) {
        self.font            = font
        self.text            = text
        self.textColor       = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius    = cornerRadius
    }
}

public struct WizardButton {
    public var cornerRadius: CGFloat
    public var text: String
    public var textColor: UIColor
    public var backgroundColor: UIColor
    
    public init (text: String = "OK", textColor: UIColor = .darkGray, backgroundColor: UIColor = .groupTableViewBackground, cornerRadius: CGFloat = 3) {
        self.text            = text
        self.textColor       = textColor
        self.cornerRadius    = cornerRadius
        self.backgroundColor = backgroundColor
    }
}

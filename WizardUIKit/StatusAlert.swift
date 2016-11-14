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

public struct WizardStatusAlert {
    public var successStatus: WizardStatus
    public var warningStatus: WizardStatus
    public var errorStatus: WizardStatus
    public var animation: WizardAnimation
    public var expandable: Bool = true
    
    public init() {
        let successTitleLabelOptions  = WizardLabel(text: "Congradulation", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold))
        let warningTitleLabelOptions  = WizardLabel(text: "Warning", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold))
        let errorTitleLabelOptions    = WizardLabel(text: "Error", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold))
        let successAlertButtonOptions = WizardButton(text: "OK", textColor: .white, backgroundColor: UIColor.WizardGreenColor(), cornerRadius: 3)
        let warningAlertButtonOptions = WizardButton(text: "OK", textColor: .white, backgroundColor: UIColor.WizardYellowColor(), cornerRadius: 3)
        let errorAlertButtonOptions   = WizardButton(text: "OK", textColor: .white, backgroundColor: UIColor.WizardRedColor(), cornerRadius: 3)
        let defaultContentTextOptions = WizardLabel(text: "write something to say ...", textColor: .black, textAlignment: .center, font: UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular))
        
        successStatus = WizardStatus(image: UIImage(named: "statusAlertCheckIcon", in: kWizardBundle, compatibleWith: nil)!, titleLabel: successTitleLabelOptions, contentLabel: defaultContentTextOptions, button: successAlertButtonOptions)
        warningStatus = WizardStatus(image: UIImage(named: "statusAlertWarningIcon", in: kWizardBundle, compatibleWith: nil)!, titleLabel: warningTitleLabelOptions, contentLabel: defaultContentTextOptions, button: warningAlertButtonOptions)
        errorStatus = WizardStatus(image: UIImage(named: "statusAlertErrorIcon", in: kWizardBundle, compatibleWith: nil)!, titleLabel: errorTitleLabelOptions, contentLabel: defaultContentTextOptions, button: errorAlertButtonOptions)
        animation    = WizardAnimation(direction: .slideUp, duration: 0.5)
        
    }
    
    public init (successStatus: WizardStatus, warningStatus: WizardStatus, errorStatus: WizardStatus, animation: WizardAnimation) {
        self.warningStatus    = warningStatus
        self.errorStatus      = errorStatus
        self.successStatus    = successStatus
        self.animation = animation
    }
}



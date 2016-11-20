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

class TextFieldAlertViewController: UIViewController {

    typealias ConfirmDelegate   = (String) -> ()
    typealias CancelDelegate = () -> ()
    
    var didConfirm: ConfirmDelegate?
    var didCancel: CancelDelegate?
    var textFieldAlert: WizardTextFieldAlert!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        if didCancel != nil {
            textField.resignFirstResponder()
            didCancel!()
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        if didConfirm != nil {
            textField.resignFirstResponder()
            if let text = textField.text {
                didConfirm!(text)
            } else {
                didConfirm!("")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFieldAlertWith(textFieldAlert: textFieldAlert)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showAlertAnimationWith(options: textFieldAlert.animation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showAlertAnimationWith(options: WizardAnimation) {
        switch options.direction {
        case .fadeIn:
            alertView.alpha = 0.0
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
                self.alertView.alpha = 1.0
                }, completion: nil)
        case .slideDown:
            alertView.transform = CGAffineTransform(translationX: 0, y: -500)
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
                self.alertView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
        case .slideUp:
            alertView.transform = CGAffineTransform(translationX: 0, y: 500)
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
                self.alertView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
        }
    }
    
    private func initializeTextFieldAlertWith(textFieldAlert: WizardTextFieldAlert) {
        //alert view
        titleLabel.text               = textFieldAlert.titleLabel.text
        titleLabel.textColor          = textFieldAlert.titleLabel.textColor
        titleLabel.font               = textFieldAlert.titleLabel.font
        alertView.backgroundColor     = textFieldAlert.backgroundColor
        alertView.layer.cornerRadius  = textFieldAlert.cornerRadius
        
        //textField
        textField.placeholder         = textFieldAlert.textField.placeholder
        textField.textColor           = textFieldAlert.textField.textColor
        textField.backgroundColor     = textFieldAlert.textField.backgroundColor
        textField.layer.cornerRadius  = textFieldAlert.textField.cornerRadius
        textField.keyboardType        = textFieldAlert.keyboardType
        
        //button
        doneButton.backgroundColor    = textFieldAlert.button.backgroundColor
        doneButton.layer.cornerRadius = textFieldAlert.button.cornerRadius
        doneButton.setTitle(textFieldAlert.button.text, for: .normal)
        doneButton.setTitleColor(textFieldAlert.button.textColor, for: .normal)
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

}

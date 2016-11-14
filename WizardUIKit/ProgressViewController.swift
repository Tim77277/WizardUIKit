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

class ProgressViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBarBackgroundView: UIView!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    
    typealias CancelDelegate   = () -> ()
    typealias FinishedDelegate = () -> ()
    var didCancel: CancelDelegate?
    var didFinish: FinishedDelegate?
    
    var progressAlert: WizardProgressAlert!
    var percentage: CGFloat = 0 {
        didSet {
            
            if percentage <= 0 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.progressBarView.frame = CGRect(x: 0, y: 0, width: 1, height: 5)
                    }, completion: { (finished) in
                        if self.progressAlert.displayPercentage {
                            self.titleLabel.text = "\(String(format: "%.1f", self.percentage * 100))% \(self.progressAlert.titleLabel.text)"
                        }
                })
            }
            
            if percentage > 0 && percentage < 1 {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.5, animations: { 
                        self.progressBarView.frame = CGRect(x: 0, y: 0, width: self.progressBarBackgroundView.frame.width * self.percentage, height: 5)
                        }, completion: { (finished) in
                            if self.progressAlert.displayPercentage {
                                self.titleLabel.text = "\(String(format: "%.1f", self.percentage * 100))% \(self.progressAlert.titleLabel.text)"
                            }
                    })
                }
            }
            
            if percentage >= 1 {
                if didFinish != nil {
                    self.didFinish!()
                }
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        if didCancel != nil {
            self.didCancel!()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProgressAlertWith(progressAlert: progressAlert)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        progressBarBackgroundView.layoutIfNeeded()
        progressBarView.layoutIfNeeded()
        progressBarView.frame = CGRect(x: 0, y: 0, width: 1, height: progressBarView.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializeProgressAlertWith(progressAlert: WizardProgressAlert) {
        let titleLabelOptions  = progressAlert.titleLabel
        let buttonOptions      = progressAlert.button
        let progressBarOptions = progressAlert.progressBar
        titleLabel.text        = titleLabelOptions.text
        titleLabel.textColor   = titleLabelOptions.textColor
        titleLabel.font        = titleLabelOptions.font
        cancelButton.setTitle(buttonOptions.text, for: .normal)
        cancelButton.setTitleColor(buttonOptions.textColor, for: .normal)
        cancelButton.layer.cornerRadius = buttonOptions.cornerRadius
        cancelButton.backgroundColor    = buttonOptions.backgroundColor
        progressBarView.backgroundColor = progressBarOptions.barColor
        progressBarBackgroundView.backgroundColor = progressBarOptions.backgroundColor
        alertView.backgroundColor    = progressAlert.backgroundColor
        alertView.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

}

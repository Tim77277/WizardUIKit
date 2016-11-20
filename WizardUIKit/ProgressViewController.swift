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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var alertView: UIView!
    
    var progressAlert: WizardProgressAlert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProgressAlertWith(progressAlert: progressAlert)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializeProgressAlertWith(progressAlert: WizardProgressAlert) {
        let titleLabelOptions  = progressAlert.titleLabel
        let progressBarOptions = progressAlert.progressBar
        titleLabel.text        = titleLabelOptions.text
        titleLabel.textColor   = titleLabelOptions.textColor
        titleLabel.font        = titleLabelOptions.font

        progressView.progressTintColor  = progressBarOptions.progressColor
        progressView.backgroundColor    = progressBarOptions.trackColor
        progressView.layer.cornerRadius = progressBarOptions.cornerRadius
        progressView.clipsToBounds      = true
        
        alertView.backgroundColor       = progressAlert.backgroundColor
        alertView.layer.cornerRadius    = progressAlert.cornerRadius
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

}

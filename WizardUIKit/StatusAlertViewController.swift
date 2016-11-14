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

class StatusAlertViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertTableView: UITableView!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var alertViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var gapViewHeightConstraint: NSLayoutConstraint!
    
    typealias ConfirmDelegate = () -> ()
    var didConfim: ConfirmDelegate?
    
    var statusAlert: WizardStatusAlert!
    var statusOptions: WizardStatus!
    
    @IBAction func alertButtonTapped(_ sender: AnyObject) {
        if didConfim != nil {
            didConfim!()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
        initializeAlertWithOptions(statusAlertOptions: statusOptions)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.layoutIfNeeded()
        showAlertAnimationWith(options: statusAlert.animation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - UITableView Delegate / DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WizardAlertTextCell", for: indexPath) as! WizardAlertTextCell
        
        cell.contentTextLabel.font = statusOptions.contentLabel.font
        cell.contentTextLabel.textAlignment = statusOptions.contentLabel.textAlignment
        cell.contentTextLabel.text = statusOptions.contentLabel.text
        cell.contentTextLabel.textColor = statusOptions.contentLabel.textColor
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
//MARK: - Animations
    private func showAlertAnimationWith(options: WizardAnimation) {
        
        //Handle expandable
        if statusAlert.expandable && alertTableView.contentSize.height > 20 {
            //New height = height of the content text + other objects heigh in alertView
            let newHeight = alertView.frame.height + alertTableView.contentSize.height - alertTableView.frame.height
            
            let kAlertTextMaximumHeight = view.frame.height * 0.8
            
            if newHeight > kAlertTextMaximumHeight {
                alertViewHeightConstraint.constant = kAlertTextMaximumHeight
            } else if newHeight > kAlertTextMinimumHeight && newHeight <= kAlertTextMaximumHeight {
                alertViewHeightConstraint.constant = newHeight
            }
        }
        
        //Optimize lable position
        let numOfLines = alertTableView.contentSize.height / statusOptions.contentLabel.font.lineHeight
        
        if numOfLines <= 2 {
            gapViewHeightConstraint.constant = 20
        }
        
        switch options.direction {
        case .fadeIn:
            alertView.alpha = 0.0
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: { 
                self.alertView.alpha = 1.0
            }, completion: nil)
        case .slideUp:
            alertView.transform = CGAffineTransform(translationX: 0, y: 500)
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: { 
                self.alertView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        case .slideDown:
            alertView.transform = CGAffineTransform(translationX: 0, y: -500)
            UIView.animate(withDuration: options.duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
                self.alertView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
    
//MARK: - Initialization / Configurations
    private func initializeAlertWithOptions(statusAlertOptions: WizardStatus) {
        alertView.backgroundColor      = statusOptions.backgroundColor
        alertTitleLabel.text           = statusOptions.titleLabel.text
        alertTitleLabel.textColor      = statusOptions.titleLabel.textColor
        alertImageView.image           = statusOptions.image
        alertButton.setTitle(statusOptions.button.text, for: .normal)
        alertButton.setTitleColor(statusOptions.button.textColor, for: .normal)
        alertButton.backgroundColor = statusOptions.button.backgroundColor
        alertButton.layer.cornerRadius = statusOptions.button.cornerRadius
        alertView.layer.cornerRadius = statusOptions.cornerRadius
        
        //Not yet public properties
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private func tableViewConfiguration() {
        alertTableView.rowHeight = UITableViewAutomaticDimension
        alertTableView.estimatedRowHeight = 300
        alertTableView.delegate = self
        alertTableView.dataSource = self
        alertTableView.separatorColor = .clear

        alertTableView.register(UINib(nibName: "WizardAlertTextCell", bundle: kWizardBundle), forCellReuseIdentifier: "WizardAlertTextCell")
    }
}

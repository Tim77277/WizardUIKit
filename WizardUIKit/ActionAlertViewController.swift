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

class ActionAlertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//MARK: - Custom Delegate
    typealias CancelDelegate = () -> ()
    typealias ActionDelegate = () -> ()
    var didCancel: CancelDelegate?
    var didConfirmAction: ActionDelegate?
    
//MARK: - Variables
    var actionAlert: WizardActionAlert!
    
//MARK: - IBOutlets
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertTableView: UITableView!
    @IBOutlet weak var alertActionButton: UIButton!
    @IBOutlet weak var alertCancelButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var gapViewHeightConstraint: NSLayoutConstraint!
    
//MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
        initializeActionAlertWith(actionAlert: actionAlert)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.layoutIfNeeded()
        showAlertAnimationWith(options: actionAlert.animationOptions)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: UITableView Delegate / DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WizardAlertTextCell", for: indexPath) as! WizardAlertTextCell
        cell.contentTextLabel.font = actionAlert.contentLabel.font
        cell.contentTextLabel.textAlignment = actionAlert.contentLabel.textAlignment
        cell.contentTextLabel.text = actionAlert.contentLabel.text
        cell.contentTextLabel.textColor = actionAlert.contentLabel.textColor
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
//MARK: - IBActions
    @IBAction func alertCancelButtonTapped(_ sender: AnyObject) {
        if didCancel != nil {
            self.didCancel!()
        }
    }
    
    @IBAction func alertActionButtonTapped(_ sender: AnyObject) {
        if didConfirmAction != nil {
            self.didConfirmAction!()
        }
    }
    
//MARK: - Animations
    private func showAlertAnimationWith(options: WizardAnimation) {
        //Handle expandable
        if actionAlert.expandable && alertTableView.contentSize.height > 20 {
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
        let numOfLines = alertTableView.contentSize.height / actionAlert.contentLabel.font.lineHeight
        
        if numOfLines <= 2 {
            gapViewHeightConstraint.constant = 20
        }
        
        //Animate alert view
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
    
//MARK: - Initialization
    private func initializeActionAlertWith(actionAlert: WizardActionAlert) {
        alertTitleLabel.text           = actionAlert.titleLabel.text
        alertTitleLabel.textColor      = actionAlert.titleLabel.textColor
        alertTitleLabel.font           = actionAlert.titleLabel.font
        alertView.backgroundColor      = actionAlert.backgroundColor
        
        if let cancelButtonOptions = actionAlert.cancelButton {
            alertCancelButton.setTitle(cancelButtonOptions.text, for: .normal)
            alertCancelButton.setTitleColor(cancelButtonOptions.textColor, for: .normal)
            alertCancelButton.layer.cornerRadius = cancelButtonOptions.cornerRadius
            alertCancelButton.backgroundColor    = cancelButtonOptions.backgroundColor
        }
        
        if let actionButtonOptions = actionAlert.actionButton {
            alertActionButton.setTitle(actionButtonOptions.text, for: .normal)
            alertActionButton.setTitleColor(actionButtonOptions.textColor, for: .normal)
            alertActionButton.layer.cornerRadius = actionButtonOptions.cornerRadius
            alertActionButton.backgroundColor    = actionButtonOptions.backgroundColor
        }
        
        //Not yet public properties
        alertView.layer.cornerRadius   = 5
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

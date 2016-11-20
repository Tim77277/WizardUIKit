//
//  ActivityIndicatorAlertViewController.swift
//  WizardUIKit
//
//  Created by Wei-Ting Lin on 11/19/16.
//  Copyright © 2016 Wei-Ting Lin. All rights reserved.
//

import UIKit

class ActivityIndicatorAlertViewController: UIViewController {

    @IBOutlet weak var indicatorBackgroundView: UIView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var indicator: WizardIndicatorAlert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeIndicatorWith(indicator: indicator)
        indicatorView.startAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeIndicatorWith(indicator: WizardIndicatorAlert) {
        self.indicatorView.color = indicator.color
        self.indicatorBackgroundView.backgroundColor = indicator.backgroundColor
        self.indicatorBackgroundView.layer.cornerRadius = indicator.cornerRadius
        
        //dim
        self.view.backgroundColor = indicator.dimColor
    }

}

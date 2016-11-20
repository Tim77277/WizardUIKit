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

class NamePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//MARK: - Custom Delegate
    typealias PickDelegate   = (([String], [Int])) -> ()
    typealias CancelDelegate = () -> ()
    var didPick: PickDelegate?
    var didCancel: CancelDelegate?
    
//MARK: - Variables
    var newSelectedStrings: [String]!
    var newSelectedIndices = [Int]()
    var namePicker: WizardNamePickerAlert!
    var stringsForComponents         = [[String]]()
    var selectedStringsForComponents = [String]()

//MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerBackgroundView: UIView!
    
//MARK: - UIVIewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate   = self
        picker.dataSource = self
        
        //check if pre-selection is given
        if !selectedStringsForComponents.isEmpty {
            //assign them if it is given
            newSelectedStrings = selectedStringsForComponents
        } else {
            //assign first row as each default selected value for each components
            newSelectedStrings = stringsForComponents.map{$0.first!}
        }
        
        //Loop through each components and select the row with given string
        for index in 0..<newSelectedStrings.count {
            if let row = stringsForComponents[index].index(of: newSelectedStrings[index]) {
                picker.selectRow(row, inComponent: index, animated: true)
                newSelectedIndices.append(row)
            } else {
                picker.selectRow(0, inComponent: index, animated: true)
                newSelectedIndices.append(0)
            }
        }
        
        //initialze the picker with options
        initializeNamePickerWith(namePicker: namePicker)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NamePickerViewController.backgroundTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showPickerAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - IBActions
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        if didPick != nil {
            hidePickerAnimationWith(options: namePicker.animation, completionHandler: {
                self.didPick!((self.newSelectedStrings, self.newSelectedIndices))
            })
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        if didCancel != nil {
            hidePickerAnimationWith(options: namePicker.animation, completionHandler: {
                self.didCancel!()
            })
        }
    }
    
    func backgroundTapped() {
        if didCancel != nil {
            hidePickerAnimationWith(options: namePicker.animation, completionHandler: {
                self.didCancel!()
            })
        }
    }
    
//MARK: - UIPicker Delegate / DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return stringsForComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringsForComponents[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: stringsForComponents[component][row], attributes: [NSForegroundColorAttributeName : namePicker.pickerTextColor])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newSelectedStrings[component] = stringsForComponents[component][row]
        newSelectedIndices[component] = row
    }
    
//MARK: - Animations
    private func showPickerAnimation() {
        pickerBackgroundView.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: namePicker.animation.duration) {
            self.pickerBackgroundView.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    private func hidePickerAnimationWith(options: WizardAnimation, completionHandler block: @escaping () -> ()) {
        switch options.direction {
        default:
            UIView.animate(withDuration: options.duration, animations: {
                self.pickerBackgroundView.transform = CGAffineTransform(translationX: 0, y: 300)
                }, completion: { (finished) in
                    block()
            })
        }
    }
    
//MARK: - Initialization
    private func initializeNamePickerWith(namePicker: WizardNamePickerAlert) {
        titleLabel.text      = namePicker.titleLabel.text
        titleLabel.textColor = namePicker.titleLabel.textColor
        titleLabel.font      = namePicker.titleLabel.font
        doneButton.setTitle(namePicker.doneButton.text, for: .normal)
        doneButton.setTitleColor(namePicker.doneButton.textColor, for: .normal)
        doneButton.backgroundColor    = namePicker.doneButton.backgroundColor
        pickerBackgroundView.backgroundColor = namePicker.backgroundColor
        
        
        if namePicker.doneButton.cornerRadius > 0 {
            doneButton.layer.cornerRadius = namePicker.doneButton.cornerRadius
            doneButton.clipsToBounds      = true
        }
        
        //Not yet public valuables
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

}

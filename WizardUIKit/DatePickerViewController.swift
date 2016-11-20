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

class DatePickerViewController: UIViewController {
    
    typealias PickDelegate = (Date) -> ()
    typealias CancelDelegate = () -> ()
    var didPick: PickDelegate?
    var didCancel: CancelDelegate?
    
    var datePicker: WizardDatePickerAlert!
    var selectedDate: Date!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var pickerBackgroundView: UIView!

    
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        if self.didPick != nil {
            hidePickerAnimationWith(options: datePicker.animation, completionHandler: {
                self.didPick!(self.picker.date)
            })
        }
    }
    
    @IBAction func todayButtonTapped(_ sender: AnyObject) {
        picker.setDate(Date(), animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: AnyObject) {
        selectedDate = sender.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDatePickerViewWith(datePicker: datePicker)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showPickerAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showPickerAnimation() {
        pickerBackgroundView.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: datePicker.animation.duration) {
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
    
    private func initializeDatePickerViewWith(datePicker: WizardDatePickerAlert) {
        titleLabel.text      = datePicker.titleLabel.text
        titleLabel.textColor = datePicker.titleLabel.textColor
        titleLabel.font      = datePicker.titleLabel.font
        doneButton.setTitle(datePicker.doneButton.text, for: .normal)
        doneButton.setTitleColor(datePicker.doneButton.textColor, for: .normal)
        doneButton.backgroundColor = datePicker.doneButton.backgroundColor
        todayButton.setTitle(datePicker.todayButton.text, for: .normal)
        todayButton.setTitleColor(datePicker.todayButton.textColor, for: .normal)
        todayButton.backgroundColor = datePicker.todayButton.backgroundColor
        selectedDate = datePicker.picker.defaultDate
        //UIDatePicker
        picker.setDate(datePicker.picker.defaultDate, animated: true)
        picker.setValue(datePicker.picker.textColor, forKeyPath: "textColor")
        picker.maximumDate = datePicker.picker.maximumDate
        picker.minimumDate = datePicker.picker.minimumDate
        picker.datePickerMode = datePicker.picker.mode
        picker.locale      = datePicker.picker.locale
        pickerBackgroundView.backgroundColor = datePicker.backgroundColor
        
        if datePicker.doneButton.cornerRadius > 0 {
            doneButton.layer.cornerRadius = datePicker.doneButton.cornerRadius
            doneButton.clipsToBounds      = true
        }
        
        //Not yet public valuable
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
}

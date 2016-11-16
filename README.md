# WizardUIKit
"WizardUIKit includes reusable and customizable UI elements such as StatusAlerts, ActionAlert, ImageActionAlert, ProgressAlert, NamePicker and DatePicker that developers can take an advantage with so that developers do not need to make those UI again and again in different projects and apps. Of course, if you need a very unique design to fit your app then you still need to make one on your own. However, WizardUIKit provides common used UIs with a clean, simple and general design. You can change the design property such as images, text color, text font, background color...etc to fit your need."

# Installation
[CocoaPods](https://cocoapods.org) is the recommended way to add WizardUIKit to your project.

1. Add a pod entry for WizardUIKit to your Podfile 

```
pod 'WizardUIKit', :git => 'https://github.com/Tim77277/WizardUIKit.git', :tag => '1.0.2'
```

2. Install it by running pod install.
3. Include WizardUIKit wherever you need it with #import WizardUIKit.

# Usage
WizardUIKit is writen as a singleton, all UIs are created when Wizard.UIKit is being called at the first time. The reason why I choose to implement in this way is because when a user changes the design property of a Wizard UI, it stores the property values so that he/she doesn't need to redefine everytime in every single viewController. Thus the first thing to do is to implement the WizardUIKit instance.

```swift
let wizard = Wizard.UIKit
```

## StatusAlert

### Properties
```swift
var successStatus: WizardStatus
```
A struct contains the information how StatusAlert should be displayed when status is success
```swift
var warningStatus: WizardStatus
```
A struct contains the information how StatusAlert should be displayed when status is warning
```swift
var errorStatus: WizardStatus
```
A struct contains the information how StatusAlert should be displayed when status is error
```swift
var animation: WizardAnimation
```
A struct contains the information how StatusAlert should be animated
```swift
var expandable: Bool
```
use to set up if the StatusAlert should be expanded when the message is longer than default heigh

### Example
```swift
wizard.showStatusAlert(withStatus: .success, 
                            title: "Congradulation", 
                          message: "Your profile has been created successfully", 
                   viewController: self) {
  //do something after user confirm the message...
}
```

- WizardStatus
  * success (by default, it comes with a check mark Icon and a green button with white text color)
  * warning (by default, it comes with a exclamation point Icon and a yello button with white text color)
  * error   (by default, it comes with a cross mark Icon and a red button with white text color)

If you would like to customize the StatusAlert, you can simplely change the StatusAlert property before you call showStatusAlert function, for example the below code shows how to change successStatus button background color to black:

```swift
//change statusAlert successStatus button backgroundColor to black
wizard.statusAlert.successStatus.button.backgroundColor = .black

//show statusAlert with your style
wizard.showStatusAlert(withStatus: .success, 
                            title: "Congradulation", 
                          message: "Your profile has been created successfully", 
                   viewController: self) {
  //do something after user confirm the message...
}
```
*Note: Once you change it, it stays what it looks like. Thus next time you can just call showStatusAlert function without redefine the color again*



## ActionAlert
### Properties
```swift
var titleLabel: WizardLabel
```
A struct contains the information how title label should be displayed in ActionAlert
```swift
var contentLabel: WizardLabel
```
A struct contains the information how message label should be displayed in ActionAlert
```swift
var cancelButton: WizardButton
```
A struct contains the information how cancel button should be displayed in ActionAlert
```swift
var actionButton: WizardButton
```
A struct contains the information how action button should be displayed in ActionAlert
```swift
var animation: WizardAnimation
```
A struct contains the information how ActionAlert should be animated
```swift
var expandable: Bool
```
use to set up if the ActionAlert should be expanded when the message is longer than default heigh
```swift
var cornerRadius: CGFloat
```
use to change ActionAlert's cornerRadius
```swift
var backgroundColor: UIColor
```
use to change ActionAlert's background color

### Example
ActionAlert comes with an action button and a cancel button.
Action button has a call back to handle the action after the user confirm the request and cancel button will dismiss the alert by itself once the user tap on the cancel button.

```swift
wizard.showActionAlert(message: "Would you like to overwrite this file?", 
                        action: .overwrite, 
                viewController: self) { 
        //overwrite the file here if user wish to do so...
}
```

- AlertAction
  * add       (by default, it comes with a "Add" title and a green button with "Add" as its button text)
  * save      (by default, it comes with a "Save" title and a green button with "Save" as its button text)
  * delete    (by default, it comes with a "Delete" title and a red button with "Delete" as its button text)
  * overwrite (by default, it comes with a "Overwrite" title and a red button with "Overwrite" as its button text)
  * download  (by default, it comes with a "Download" title and a blue button with "Download" as its button text)
  
If you would like to customize the ActionAlert, you would need to call a different function instead because the above function prefills the title for developers who do not wish to change the design. However, if you wish to change the title of the ActionAlert, you can call the below function and change ActionAlert property before you call it.

```swift
//change action button backgroundColor
wizard.actionAlert.actionButton.backgroundColor = .black

//show actionAlert with your style
wizard.showActionAlert(withTitle: "Connect", 
                         message: "Would you like to connect to wifi?",
                  viewController: self) { 
        //connect to wifi here if user wish to do so...
}
```

*Note: Once you change it, it stays what it looks like. Thus next time you can just call showStatusAlert function without redefine the color again*


## ImageActionAlert
ImageActionAlert is idendical to ActionAlert, the only difference is it comes with an image.

```swift
wizard.showImageActionAlert(message: "Would you like to save this record?", 
                        action: .save, 
                viewController: self) { 
        //save the record here if user wish to do so...
}
```

- **AlertAction**
  * **add**       (by default, it comes with a "Add" image and a green button with "Add" as its button text)
  * **save**      (by default, it comes with a "Save" image and a green button with "Save" as its button text)
  * **delete**    (by default, it comes with a "Delete" image and a red button with "Delete" as its button text)
  * **overwrite** (by default, it comes with a "Overwrite" image and a red button with "Overwrite" as its button text)
  * **download**  (by default, it comes with a "Download" image and a blue button with "Download" as its button text)
  
If you would like to customize the ImageActionAlert, you would need to call a different function instead because the above function prefills the image for developers who do not wish to change the design. However, if you wish to change the image of the ImageActionAlert, you can call the below function and change ImageActionAlert property before you call it.

```swift
//change action button backgroundColor
wizard.imageActionAlert.actionButton.backgroundColor = .black

//show imageActionAlert with your style
wizard.showImageActionAlert(withImage: UIImage(named: "YOURIMAGE"), 
                         message: "Would you like to connect to wifi?",
                  viewController: self) { 
        //connect to wifi here if user wish to do so...
}
```

### TextFieldAlert
If you wish your user to enter some information for you, you can use TextFieldAlert to get the user input in the call back. Example here shows the scenario that you would like your user enter a file name before saving the data.

```swift
wizard.showTextFieldAlert(title: "Save File", 
                    placeholder: "Enter a file name...", 
                 viewController: self) { (filename) in
       //save file with the file name that user entered...
}
```

### ProgressAlert
If you need an alert to show the progress of a certain process. ProgressAlert is the one that you might want to use in your project. ProgressAlert has two functions. One is purely for dispalying the alert and set up the call back. Another one is a function to set up the progress percentage. 

```swift
wizard.showProgressAlert(title: "Downloading..",
                         viewController: self,
       finishHandler: {
        //.. do something when it has been finished
        
    }, cancelHandler: {
        //.. do something when it has been canceled
})

var finishedTask = 0
for task in tasks {

   //process the task...     
   finishedTask += 1
   
   //Update the percentage to ProgressAlert
   wizard.setProgressBar(percentage: CGFloat(finishedTask / downloadTasks.count))
}
```

### DatePicker
A simple date picker with "Today" button and some settings, should be enough for general cases.

```swift
//set up default date, datePicker will animate to this date when it shows
wizard.datePicker.picker.defaultDate = YOURDEFAULTDATE

//show datePicker
wizard.showDatePicker(title: "Select Date", 
             datePickerMode: .date, 
             viewController: self) { (selectedDate) in
       //do something with the date which user picked
}
```  

### NamePicker
Name picker is actually a strings picker, you would be able to give multiple [String] as dataSet for each picker component. It returns both selected strings array and selected index array. For example, if an user select "Katie" and "Female" in the below code, it returns both ["Katie", "Female"] and [3, 1]

```swift
let names  = ["John", "David", "Billy", "Katie"]
let gender = ["Male", "Female", "Complicated"]
wizard.showNamePicker(title: "Information", 
       stringsForComponents: [names, gender], 
             viewController: self) { (strings, indices) in
    //do something with the selected information
}
```  

If you want the name picker to select a certain value in the dataSet, you can call the same function with an extra parameter *selectedStringsForComponents*.

```swift
let names  = ["John", "David", "Billy", "Katie"]
let gender = ["Male", "Female", "Complicated"]
wizard.showNamePicker(title: "Information", 
       stringsForComponents: [names, gender], 
       selectedStringsForComponents: ["David", "Male"]
             viewController: self) { (strings, indices) in
    //do something with the selected information
}
```  
**Note: if a given value in selectedStringsForComponents is not found to the matched component, it will scroll to index 0** 
